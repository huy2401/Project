/*
 * send.h
 *
 *  Created on: Apr 4, 2024
 *      Author: HUY
 */

#ifndef SOURCE_APP_SEND_SEND_H_
#define SOURCE_APP_SEND_SEND_H_

void SEND_FillBufferGlobalCommand(EmberAfClusterId ClusterID,
		                          EmberAfAttributeId attributeID,
								  uint8_t globalCommand,
								  uint8_t length,
								  uint8_t *value,
								  uint8_t dataType
								  );
void SEND_SendCommandUnicast(uint16_t address,
		                     uint8_t  source,
							 uint8_t  destination);

void SEND_modelIdAttributeResponse(
		                  uint16_t address,
		                  uint8_t  source,
				          uint8_t  destination,
						  uint8_t length,
						  uint8_t  *modelId
						  );

void SEND_onoffAttributeResponse (
		                  uint16_t address,
                          uint8_t  source,
		                  uint8_t  destination,
						  boolean  state
						  );

void SEND_BindingCommand         (EmberAfClusterId ClusterID,
								  uint8_t CommandId,
								  uint8_t index,
								  uint8_t source,
								  uint8_t destination
								  );

#endif /* SOURCE_APP_SEND_SEND_H_ */
