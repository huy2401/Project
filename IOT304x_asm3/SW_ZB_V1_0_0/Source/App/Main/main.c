#include "app/framework/include/af.h"
#include "Source/Mid/led/led.h"
#include "Source/App/Send/send.h"
#include "protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.h"
#include "Source/Drive/Light_sensor/Light_sensor.h"
#include "protocol/zigbee/app/framework/plugin/find-and-bind-target/find-and-bind-target.h"
#include "protocol/zigbee/app/framework/plugin/find-and-bind-initiator/find-and-bind-initiator.h"
#include "SW_ZB_V1_0_0.h"

#define HC_ADDRESS  0x0000

EmberEventControl joinNetworkEventControl;
EmberEventControl mainStateEventControl;
EmberEventControl lightSensorEventControl;

enum  {
	POWER_ON_STATE,
	NETWORK_ON_STATE,
	NETWORK_LEAVE_STATE,
	REBOOT_STATE

} systemState;

void buttonCallback(uint8_t button, uint8_t state);

/**
 * @func   emberAfMainInitCallback
 * @brief  Ham khoi chay moi khi khoi dong chuong trinh
 *         Cau hinh cho LED. Cau hinh IADC0 de giao tiep cam bien anh sang
 *         Khoi dong su kien mainStateEventControl
 * @param  void
 * @reveal void
 */

void emberAfMainInitCallback(void)
{
	emberAfCorePrintln("Main Init Callback");
	CMU_ClockEnable(cmuClock_GPIO, true);
	ledInit();
    initIADC();
    buttonInit(buttonCallback);
	systemState = POWER_ON_STATE;
	emberEventControlSetActive(mainStateEventControl);

}

/**
 * @func   mainStateEventHandler()
 * @brief  Su kien xu ly trang thai cua chuong trinh chinh
 * @param  void
 * @reveal void
 */

void mainStateEventHandler()
{
	static char modelID[13] = "SW2_LM1";
	emberEventControlSetInactive(mainStateEventControl);
    switch(systemState)
	{
		 case POWER_ON_STATE:
			 if (emberAfNetworkState() == EMBER_NO_NETWORK)
			 {
				 toggleLed(LED_1, ledRed, 3, 300, 300);
				 emberEventControlSetActive(joinNetworkEventControl);
			 }
			 break;
		 case NETWORK_ON_STATE:
		     toggleLed(LED_1, ledPink, 3, 300, 300);
		     SEND_modelIdAttributeResponse(HC_ADDRESS, 1, 1, 7 , modelID);
		     emberEventControlSetDelayMS(lightSensorEventControl,5000);
		     break;
		 case NETWORK_LEAVE_STATE:
		     emberLeaveNetwork();
		     emberClearBindingTable();
		     systemState = REBOOT_STATE;
		     emberEventControlSetDelayMS(mainStateEventControl, 1500); //Doi 1.5 de thiet bi thoat mang
		     break;
		 case REBOOT_STATE:
		     halReboot();
		     break;
		 default:
		     break;
	}
}

/**
 * @func   buttonCallback()
 * @brief  Ham su kien xu ly trang thai cua nut bam
 * @param  uint8_t button la PIN cua nut bam
 *         uint8_t state la trang thai cua nut bam
 * @reveal void
 */

void buttonCallback(uint8_t button, uint8_t state)
{
	static uint8_t Press0 = 0, Press1 = 0;
	static uint8_t contents[ZDO_MESSAGE_OVERHEAD + 1] = {0,0};
    if (state == BUTTON_PRESSED)
    {
    	 if (button == BUTTON0)
    	 switch (++Press0)
    	 {
    	     case 1:
    	    	 onLed(LED_1, ledBlue);
    	    	 SEND_onoffAttributeResponse(HC_ADDRESS,1,1,true);
    	    	 break;
    	     case 2:
    	    	 offLed(LED_1);
    	    	 SEND_onoffAttributeResponse(HC_ADDRESS,1,1,false);
    	    	 break;
    	     case 3:
    	    	 emberAfPluginFindAndBindTargetStart(1);
    	    	 break;
    	     case 4:
    	    	 emberAfPluginFindAndBindInitiatorStart(1);
    	    	 break;
    	     case 5:
    	    	 systemState = NETWORK_LEAVE_STATE;
    	    	 emberSendZigDevRequest(HC_ADDRESS, LEAVE_RESPONSE, EMBER_AF_DEFAULT_APS_OPTIONS, contents, sizeof(contents));
    	    	 emberEventControlSetDelayMS(mainStateEventControl,1500);
    	    	 break;
    	     default:
    	    	 break;
    	 }
    	 else
    	 switch (++Press1)
    	 {
         	 case 1:
    	     	 onLed(LED_2, ledBlue);
    	     	 SEND_onoffAttributeResponse(HC_ADDRESS,2,1,true);
    	     	 break;
    	     case 2:
    	     	 offLed(LED_2);
    	     	 SEND_onoffAttributeResponse(HC_ADDRESS,2,1,false);
    	     	 break;
    	     default:
    	         break;

    	 }
    }
}

/**
 * @func   joinNetworkEventHandler()
 * @brief  Ham su kien tim va gia nhap mang
 * @param  void
 * @reveal void
 */


void joinNetworkEventHandler()
{
	emberEventControlSetInactive(joinNetworkEventControl);
	if (emberAfNetworkState() != EMBER_JOINED_NETWORK)
	{
		if (emberAfNetworkState() == EMBER_NO_NETWORK) emberAfPluginNetworkSteeringStart();
		else emberLeaveNetwork();
		emberEventControlSetDelayMS(joinNetworkEventControl, 5000);
	}
}

/**
 * @func   emberAfStackStatusCallback()
 * @brief  Ham ngat moi khi stack status thay doi, o day chi su dung de kiem tra
 *         trang thai mang
 * @param  EmberStatus status la trang thai cua mang
 * @reveal void
 */

boolean emberAfStackStatusCallback(EmberStatus status)
{
	if (status == EMBER_NETWORK_UP)
	{
		systemState = NETWORK_ON_STATE;
		emberEventControlSetActive(mainStateEventControl);

	}
	else if (status == EMBER_NETWORK_DOWN)
	{
		systemState = NETWORK_LEAVE_STATE;
		emberEventControlSetActive(mainStateEventControl);
	}
	return false;
}

/**
 * @func    emberAfPreCommandReceivedCallback()
 * @brief  Ham ngat moi khi co menh lenh gui toi thiet bi
 * @param  EmberAfClusterCommand* cmd la con tro chi den cau truc bao gom cac phan tu lien quan den
 *         menh lenh duooc gui
 * @reveal boolean
 */

boolean emberAfPreCommandReceivedCallback(EmberAfClusterCommand* cmd)
{
	EmberBindingTableEntry bind;
    if (cmd->apsFrame->clusterId == ZCL_IDENTIFY_CLUSTER_ID) return false;
    for (int index = 0; index < EMBER_BINDING_TABLE_SIZE; index++)
    	{
    		   emberGetBinding(index, &bind);
    		   if ((bind.clusterId == cmd->apsFrame->clusterId)
    		    && (cmd->source == HC_ADDRESS)
				&& (emberGetBindingRemoteNodeId(index) != emberGetNodeId())
    			&& (cmd ->apsFrame->destinationEndpoint == bind.local))
    		    {
    			   SEND_BindingCommand (bind.clusterId,
    					                cmd->commandId,
    									index,
    									bind.local,
    									bind.remote

    			   );

    		    }
    	}
    	if (cmd->apsFrame->clusterId == ZCL_ON_OFF_CLUSTER_ID)
    	{
    		switch(cmd->apsFrame->destinationEndpoint)
    		{
    		    case 1:
    		        if (cmd->commandId == 0x01) onLed(LED_1,ledBlue);
    		        else offLed(LED_1);
    		        SEND_onoffAttributeResponse(HC_ADDRESS,1,1,cmd->commandId == 0x01);
    		        break;
    		    case 2:
    		    	if (cmd->commandId == 0x01) onLed(LED_2,ledBlue);
    		    	else offLed(LED_2);
    		    	SEND_onoffAttributeResponse(HC_ADDRESS,2,1,cmd->commandId == 0x01);
    		    	break;
    		    default:
    		    	break;
    		}

    	}
    	return true;


}

/**
 * @func    lightSensorEventHandler()
 * @brief  Ham su kien doc va gui du lieu len ZC
 * @param  void
 * @reveal void
 */

void lightSensorEventHandler()
{
	static double Pre_Light = -100;
    double Light;
    uint16_t Lux, Pre_Lux;
    uint8_t data[2];
    emberEventControlSetInactive( lightSensorEventControl);
    Light = LightSensor_getLight();
    Lux = round(Light);
    if (fabs (Light - Pre_Light) > 30)
    {
         data[0] = (uint8_t)(Lux & 0x00FF);
         data[1] = (uint8_t)((Lux & 0xFF00) >> 8);
	     SEND_FillBufferGlobalCommand(ZCL_ILLUM_MEASUREMENT_CLUSTER_ID,
			                          ZCL_ILLUM_MEASURED_VALUE_ATTRIBUTE_ID,
								      ZCL_READ_ATTRIBUTES_RESPONSE_COMMAND_ID,
								      2,
                                      data,
								      ZCL_INT16U_ATTRIBUTE_TYPE
 	                                  );
	     SEND_SendCommandUnicast(HC_ADDRESS,3,1);
	     Pre_Light = Light;
    }

    if (Lux > 500) onLed(LED_2,ledGreen);
    else offLed(LED_2);
	emberEventControlSetDelayMS(lightSensorEventControl, 10000);
}







