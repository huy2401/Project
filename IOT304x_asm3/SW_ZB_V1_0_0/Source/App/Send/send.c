/*
 * send.c
 *
 *  Created on: Apr 4, 2024
 *      Author: HUY
 */

//#include "protocol/zigbee/stack/include/network-formation.h"
#include "app/framework/include/af.h"
#include "send.h"

void SEND_FillBufferGlobalCommand(EmberAfClusterId ClusterID,
		                          EmberAfAttributeId attributeID,
								  uint8_t globalCommand,
								  uint8_t length,
								  uint8_t *value,
								  uint8_t dataType
								  )
{
	uint8_t data[20];
	data[0] = (uint8_t)(attributeID & 0x00FF);
	data[1] = (uint8_t)((attributeID & 0xFF00) >> 8);
	data[2] = EMBER_SUCCESS;
	data[3] = dataType;
	data[4] = length;
	if (dataType == 0x42) memcpy(&data[5], value, length++);
	else memcpy(&data[4], value, length);
	emAfZclBufferLen = 100;
	emberAfFillExternalBuffer(     ZCL_DISABLE_DEFAULT_RESPONSE_MASK,
						           ClusterID,
						           globalCommand,
		 	    	 			   "b", data, length+4
							 );
}

void SEND_SendCommandUnicast(uint16_t address,
		                     uint8_t  source,
							 uint8_t  destination)
{
	emberAfSetCommandEndpoints(source,destination);
    emberAfSendCommandUnicast(EMBER_OUTGOING_DIRECT, address);

}

void SEND_onoffAttributeResponse (
		                  uint16_t address,
                          uint8_t  source,
		                  uint8_t  destination,
						  boolean  state
						  )
{
	SEND_FillBufferGlobalCommand(
			                     ZCL_ON_OFF_CLUSTER_ID,
		    					 ZCL_ON_OFF_ATTRIBUTE_ID,
								 ZCL_READ_ATTRIBUTES_RESPONSE_COMMAND_ID,
								 1,
		    					 &state,
		    					 ZCL_BOOLEAN_ATTRIBUTE_TYPE);
	SEND_SendCommandUnicast(address, source, destination);
}

void SEND_modelIdAttributeResponse(
		                  uint16_t address,
		                  uint8_t  source,
				          uint8_t  destination,
						  uint8_t length,
						  uint8_t  *modelId
						  )
{
	SEND_FillBufferGlobalCommand(
			                      ZCL_BASIC_CLUSTER_ID,
								  ZCL_MODEL_IDENTIFIER_ATTRIBUTE_ID,
								  ZCL_READ_ATTRIBUTES_RESPONSE_COMMAND_ID,
								  length,
								  modelId,
								  ZCL_CHAR_STRING_ATTRIBUTE_TYPE
								 );
	SEND_SendCommandUnicast(address, source, destination);
}

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

