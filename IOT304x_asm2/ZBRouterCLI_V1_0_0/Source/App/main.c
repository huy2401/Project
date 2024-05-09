/*
 * main.c
 *
 *  Created on: Apr 10, 2024
 *      Author: HUY
 */

#include "app/framework/include/af.h"
#include "Source/Mid/led/led.h"
#include "protocol/zigbee/stack/include/binding-table.h"
#include "ZBRouterCLI_V1_0_0.h"

/**
 * @func   emberAfMainInitCallback
 * @brief  Ham khoi chay moi khi khoi dong chuong trinh
 *         Cau hinh cho LED.
 * @param  void
 * @reveal void
 */

void emberAfMainInitCallback(void)
{
  ledInit();
}

/**
 * @func   SEND_BindingCommand
 * @brief  Ham gui ban tin cho phan tu trong bang binding
 * @param  EmberAfClusterId ClusterID
		   uint8_t CommandId
		   uint8_t index thu tu trong bang binding
		   uint8_t source endpoint nguon
		   uint8_t destination endpoint dich

 * @reveal void
 */

void SEND_BindingCommand         (EmberAfClusterId ClusterID,
								  uint8_t CommandId,
								  uint8_t index,
								  uint8_t source,
								  uint8_t destination
								  )
{
	emAfZclBufferLen = 100;
	emberAfFillExternalBuffer(     ZCL_DISABLE_DEFAULT_RESPONSE_MASK,
						           ClusterID,
						           CommandId,
		 	    	 			   "b", 0, 0
							 );
	emberAfSetCommandEndpoints(source,destination);
	emberAfSendCommandUnicast(EMBER_OUTGOING_VIA_BINDING, index);
}

/**
 * @func   emberAfPreCommandReceivedCallback
 * @brief  Ham duoc goi ra moi khi co ban tin gui den va xu ly ban tin
 * @param  EmberAfClusterCommand* cmd con tro chi den cau truc chua ban tin duoc gui den
 * @reveal boolean
 */

boolean emberAfPreCommandReceivedCallback(EmberAfClusterCommand* cmd)
{
   EmberBindingTableEntry bind;
   if ((cmd->apsFrame->clusterId == ZCL_IDENTIFY_CLUSTER_ID
     || cmd->apsFrame->clusterId == ZCL_GROUPS_CLUSTER_ID)) return false;

   if (cmd->type == EMBER_INCOMING_UNICAST) // Neu ban tin gui toi la Unicast
   for (int index = 0; index < EMBER_BINDING_TABLE_SIZE; index++)
   {
	   emberGetBinding(index, &bind);
	   if ((bind.clusterId == cmd->apsFrame->clusterId)
		&& (bind.clusterId != ZCL_IDENTIFY_CLUSTER_ID)
		&& (cmd ->source != emberGetNodeId()))
		   SEND_BindingCommand (bind.clusterId,
				                cmd->commandId,
								index,
								bind.local,
								bind.remote

		   );
   }

   if (cmd->apsFrame->clusterId == ZCL_ON_OFF_CLUSTER_ID)
   {
	   if (cmd->commandId == 0x01) onLed(LED_2, ledGreen);
	   else if (cmd->commandId == 0x00) offLed(LED_2);
   }
   return true;

}
