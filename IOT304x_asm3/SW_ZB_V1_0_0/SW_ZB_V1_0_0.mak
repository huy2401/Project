# Architecture directories
ARCHITECTURE_DIR = efr32
BUILD_DIR = build
OUTPUT_DIR = $(BUILD_DIR)/$(ARCHITECTURE_DIR)
LST_DIR = lst
PROJECTNAME = SW_ZB_V1_0_0

# Stack and submodule directories
GLOBAL_BASE_DIR     = ../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/..

SOURCE_FILES = \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/dmadrv/src/dmadrv.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/gpiointerrupt/src/gpiointerrupt.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../service/sleeptimer/src/sl_sleeptimer.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/sleep/src/sleep.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/tempdrv/src/tempdrv.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/ustimer/src/ustimer.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_adc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_cmu.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_core.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_cryotimer.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_emu.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_eusart.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_gpio.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_i2c.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_ldma.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_leuart.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_msc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_prs.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_rmu.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_rtcc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_se.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_system.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_timer.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_usart.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/src/em_wdog.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../Device/SiliconLabs/EFR32MG21/Source/system_efr32mg21.c \
./znet-bookkeeping.c \
./call-command-handler.c \
./callback-stub.c \
./stack-handler-stub.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/assert-crash-handlers.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/button.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/plugin/buzzer/buzzer-efr32.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../util/serial/command-interpreter2.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/generic/crc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/cstartup-common.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/diagnostic.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../../stack/config/ember-configuration.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/generic/endian.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/faults-v7m.s79 \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/isr-stubs.s79 \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/led.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../util/common/library.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/generic/mem-util.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/mfg-token.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/micro-common.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/micro.c \
./znet-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/generic/random.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../util/security/security-address-cache.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/ember-base-configuration.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/sleep-efm32.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/generic/token-def.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/token.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/ext-device.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../util/zigbee-framework/zigbee-device-common.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../util/zigbee-framework/zigbee-device-library.c \
  ../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/plugin/serial/cortexm/efm32/com.c \
  ../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/emdrv/uartdrv/src/uartdrv.c \
 \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\base\hal\plugin\adc\adc-efr32.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\aes-cmac\aes-cmac.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\base\hal\plugin\antenna-stub\antenna-stub.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\basic\basic.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\stack\framework\ccm-star.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\radio\rail_lib\plugin\coexistence\protocol\ieee802154\coexistence-802154.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\radio\rail_lib\plugin\coexistence\protocol\ieee802154\coulomb-counter-802154.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\counters\counters-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\counters\counters-ota.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\counters\counters-soc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\segger\systemview\SEGGER\SEGGER_RTT.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\base\hal\plugin\debug-jtag\debug-jtag-efr32.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\base\hal\plugin\serial\ember-printf.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\find-and-bind-initiator\find-and-bind-initiator.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\find-and-bind-initiator\find-and-bind-initiator-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\find-and-bind-target\find-and-bind-target.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\find-and-bind-target\find-and-bind-target-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\base\hal\micro\cortexm3\efm32\hal-config.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\base\hal\micro\cortexm3\efm32\hal-config-gpio.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\service\mpu\src\sl_mpu.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\heartbeat\heartbeat.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\identify\identify.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\identify\identify-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\interpan\interpan.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\interpan\interpan-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\interpan\interpan-soc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\aes_aes.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\crypto_aes.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\crypto_ble.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\crypto_ecp.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\crypto_management.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\crypto_sha.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\cryptoacc_aes.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\cryptoacc_ccm.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\cryptoacc_cmac.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\cryptoacc_ecp.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\cryptoacc_gcm.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\cryptoacc_management.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\cryptoacc_sha.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\cryptoacc_trng.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\entropy_adc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\entropy_rail.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\radioaes.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\radioaes_aes.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\radioaes_ble.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_aes.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_ccm.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_cmac.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_ecp.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_gcm.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_jpake.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_management.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_sha.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\se_trng.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\shax.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\sl_crypto\src\trng.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\aes.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\aesni.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\arc4.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\asn1parse.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\asn1write.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\base64.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\bignum.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\blowfish.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\camellia.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ccm.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\certs.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\cipher.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\cipher_wrap.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\cmac.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ctr_drbg.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\debug.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\des.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\dhm.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ecdh.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ecdsa.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ecjpake.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ecp.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ecp_curves.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\entropy.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\entropy_poll.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\error.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\gcm.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\havege.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\hmac_drbg.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\md.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\md2.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\md4.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\md5.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\md_wrap.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\memory_buffer_alloc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\net_sockets.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\oid.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\padlock.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\pem.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\pk.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\pk_wrap.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\pkcs11.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\pkcs12.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\pkcs5.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\pkparse.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\pkwrite.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ripemd160.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\rsa.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\rsa_internal.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\sha1.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\sha256.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\sha512.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ssl_cache.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ssl_ciphersuites.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ssl_cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ssl_cookie.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ssl_srv.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ssl_ticket.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\ssl_tls.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\threading.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\timing.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\version.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\version_features.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\x509.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\x509_create.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\x509_crl.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\x509_crt.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\x509_csr.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\x509write_crt.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\x509write_csr.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util\third_party\mbedtls\library\xtea.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\network-steering\network-steering.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\network-steering\network-steering-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\network-steering\network-steering-v2.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\network-steering\network-steering-soc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\emdrv\nvm3\src\nvm3_lock.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\emdrv\nvm3\src\nvm3_default.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\emdrv\nvm3\src\nvm3_hal_flash.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\on-off\on-off.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\reporting\reporting.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\reporting\reporting-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\reporting\reporting-default-configuration.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\scan-dispatch\scan-dispatch.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\base\hal\plugin\serial\serial.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\simple-main\simple-main.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\stack\framework\strong-random-api.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\update-tc-link-key\update-tc-link-key.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\plugin\update-tc-link-key\update-tc-link-key-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\cli\core-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\cli\network-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\cli\option-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\cli\plugin-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\cli\security-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\cli\zcl-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\cli\zdo-cli.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\security\af-node.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\security\af-security-common.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\security\af-trust-center.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\security\crypto-state.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\af-event.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\af-main-common.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\attribute-size.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\attribute-storage.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\attribute-table.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\client-api.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\message.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\multi-network.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\print.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\print-formatter.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\process-cluster-message.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\process-global-message.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\service-discovery-common.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\time-util.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\util.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\af-main-soc.c \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\app\framework\util\service-discovery-soc.c \
 \
SW_ZB_V1_0_0_callbacks.c \ \

LIB_FILES = \
 \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\binding-table-library-cortexm3-gcc-efr32mg21-rail\binding-table-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\cbke-163k1-stub-library-cortexm3-gcc-efr32mg21-rail\cbke-163k1-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\cbke-283k1-stub-library-cortexm3-gcc-efr32mg21-rail\cbke-283k1-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\cbke-stub-library-cortexm3-gcc-efr32mg21-rail\cbke-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\cbke-library-dsa-sign-stub-cortexm3-gcc-efr32mg21-rail\cbke-library-dsa-sign-stub.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\cbke-library-dsa-verify-stub-cortexm3-gcc-efr32mg21-rail\cbke-library-dsa-verify-stub.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\cbke-library-dsa-verify-283k1-stub-cortexm3-gcc-efr32mg21-rail\cbke-library-dsa-verify-283k1-stub.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\debug-basic-library-cortexm3-gcc-efr32mg21-rail\debug-basic-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\debug-extended-stub-library-cortexm3-gcc-efr32mg21-rail\debug-extended-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\end-device-bind-stub-library-cortexm3-gcc-efr32mg21-rail\end-device-bind-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\gp-stub-library-cortexm3-gcc-efr32mg21-rail\gp-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\hal-library-cortexm3-gcc-efr32mg21-rail\hal-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\install-code-library-cortexm3-gcc-efr32mg21-rail\install-code-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\multi-network-stub-library-cortexm3-gcc-efr32mg21-rail\multi-network-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\emdrv\nvm3\lib\libnvm3_CM33_gcc.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\packet-validate-stub-library-cortexm3-gcc-efr32mg21-rail\packet-validate-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform\radio\rail_lib\autogen\librail_release\librail_efr32xg21_gcc_release.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\security-library-link-keys-stub-cortexm3-gcc-efr32mg21-rail\security-library-link-keys-stub.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\sim-eeprom2-to-nvm3-upgrade-stub-library-cortexm3-gcc-efr32mg21-rail\sim-eeprom2-to-nvm3-upgrade-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\source-route-library-cortexm3-gcc-efr32mg21-rail\source-route-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\zigbee-pro-stack-cortexm3-gcc-efr32mg21-rail\zigbee-pro-stack.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\zigbee-r22-support-stub-library-cortexm3-gcc-efr32mg21-rail\zigbee-r22-support-stub-library.a \
../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol\zigbee\build\zll-stub-library-cortexm3-gcc-efr32mg21-rail\zll-stub-library.a \
 \
 \

CDEFS = -DNULL_BTL \
-DCORTEXM3 \
-DCORTEXM3_EFR32 \
-DCORTEXM3_EFR32_MICRO \
-DCORTEXM3_EFM32_MICRO \
-DEFR32_SERIES2_CONFIG1_MICRO \
-DEFR32MG21 \
-DEFR32MG21A010F512IM32 \
-DATTRIBUTE_STORAGE_CONFIGURATION=\"SW_ZB_V1_0_0_endpoint_config.h\" \
-DCONFIGURATION_HEADER=\"app/framework/util/config.h\" \
-DGENERATED_TOKEN_HEADER=\"SW_ZB_V1_0_0_tokens.h\" \
-DPLATFORM_HEADER=\"platform/base/hal/micro/cortexm3/compiler/gcc.h\" \
-DZA_GENERATED_HEADER=\"SW_ZB_V1_0_0.h\" \
-DPSSTORE_SIZE=0 \
-DLONGTOKEN_SIZE=0 \
-DLOCKBITS_IN_MAINFLASH_SIZE=8192 \
  -DHAL_CONFIG=1 \
  -DEMBER_AF_USE_HWCONF \
  -DNO_LED=1 \
  -DEMBER_AF_API_EMBER_TYPES=\"stack/include/ember-types.h\" \
  -DEMBER_AF_API_DEBUG_PRINT=\"app/framework/util/print.h\" \
  -DEMBER_AF_API_AF_HEADER=\"app/framework/include/af.h\" \
  -DEMBER_AF_API_AF_SECURITY_HEADER=\"app/framework/security/af-security.h\" \
  -DEMBER_AF_API_NEIGHBOR_HEADER=\"stack/include/stack-info.h\" \
  -DEMBER_STACK_ZIGBEE \
  -DMBEDTLS_CONFIG_FILE=\"mbedtls-config-generated.h\" \
  -DUSE_NVM3 \
  -DNVM3_DEFAULT_NVM_SIZE=NVM3_FLASH_PAGES*FLASH_PAGE_SIZE \
  -DEMLIB_USER_CONFIG \
  -DAPPLICATION_TOKEN_HEADER=\"znet-token.h\" \
  -DAPPLICATION_MFG_TOKEN_HEADER=\"znet-mfg-token.h\" \
  -DMBEDTLS_DEVICE_ACCELERATION_CONFIG_FILE=\"configs/config-device-acceleration.h\" \
  -DMBEDTLS_DEVICE_ACCELERATION_CONFIG_APP_FILE=\"config-device-acceleration-app.h\" \
  -DNVM3_FLASH_PAGES=4 \
  -DNVM3_DEFAULT_CACHE_SIZE=200 \
  -DNVM3_MAX_OBJECT_SIZE=254 \
  -DNVM3_DEFAULT_REPACK_HEADROOM=0 \
  -DPHY_RAIL=1 \
  -DMBEDTLS_DEVICE_ACCELERATION_CONFIG_FILE=\"configs/config-device-acceleration.h\" \
  -DMBEDTLS_DEVICE_ACCELERATION_CONFIG_APP_FILE=\"config-device-acceleration-app.h\" \
  -DNVM3_FLASH_PAGES=4 \
  -DNVM3_DEFAULT_CACHE_SIZE=200 \
  -DNVM3_MAX_OBJECT_SIZE=254 \
  -DNVM3_DEFAULT_REPACK_HEADROOM=0 \
  -DPHY_RAIL=1 \
 \

ASMDEFS = -DNULL_BTL \
-DCORTEXM3 \
-DCORTEXM3_EFR32 \
-DCORTEXM3_EFR32_MICRO \
-DCORTEXM3_EFM32_MICRO \
-DEFR32_SERIES2_CONFIG1_MICRO \
-DEFR32MG21 \
-DEFR32MG21A010F512IM32 \
-DATTRIBUTE_STORAGE_CONFIGURATION=\"SW_ZB_V1_0_0_endpoint_config.h\" \
-DCONFIGURATION_HEADER=\"app/framework/util/config.h\" \
-DGENERATED_TOKEN_HEADER=\"SW_ZB_V1_0_0_tokens.h\" \
-DPLATFORM_HEADER=\"platform/base/hal/micro/cortexm3/compiler/gcc.h\" \
-DZA_GENERATED_HEADER=\"SW_ZB_V1_0_0.h\" \
-DPSSTORE_SIZE=0 \
-DLONGTOKEN_SIZE=0 \
-DLOCKBITS_IN_MAINFLASH_SIZE=8192 \
  -DHAL_CONFIG=1 \
  -DEMBER_AF_USE_HWCONF \
  -DNO_LED=1 \
  -DEMBER_AF_API_EMBER_TYPES=\"stack/include/ember-types.h\" \
  -DEMBER_AF_API_DEBUG_PRINT=\"app/framework/util/print.h\" \
  -DEMBER_AF_API_AF_HEADER=\"app/framework/include/af.h\" \
  -DEMBER_AF_API_AF_SECURITY_HEADER=\"app/framework/security/af-security.h\" \
  -DEMBER_AF_API_NEIGHBOR_HEADER=\"stack/include/stack-info.h\" \
  -DEMBER_STACK_ZIGBEE \
  -DMBEDTLS_CONFIG_FILE=\"mbedtls-config-generated.h\" \
  -DUSE_NVM3 \
  -DNVM3_DEFAULT_NVM_SIZE=NVM3_FLASH_PAGES*FLASH_PAGE_SIZE \
  -DEMLIB_USER_CONFIG \
  -DAPPLICATION_TOKEN_HEADER=\"znet-token.h\" \
  -DAPPLICATION_MFG_TOKEN_HEADER=\"znet-mfg-token.h\" \
  -DMBEDTLS_DEVICE_ACCELERATION_CONFIG_FILE=\"configs/config-device-acceleration.h\" \
  -DMBEDTLS_DEVICE_ACCELERATION_CONFIG_APP_FILE=\"config-device-acceleration-app.h\" \
  -DNVM3_FLASH_PAGES=4 \
  -DNVM3_DEFAULT_CACHE_SIZE=200 \
  -DNVM3_MAX_OBJECT_SIZE=254 \
  -DNVM3_DEFAULT_REPACK_HEADROOM=0 \
  -DPHY_RAIL=1 \
  -DMBEDTLS_DEVICE_ACCELERATION_CONFIG_FILE=\"configs/config-device-acceleration.h\" \
  -DMBEDTLS_DEVICE_ACCELERATION_CONFIG_APP_FILE=\"config-device-acceleration-app.h\" \
  -DNVM3_FLASH_PAGES=4 \
  -DNVM3_DEFAULT_CACHE_SIZE=200 \
  -DNVM3_MAX_OBJECT_SIZE=254 \
  -DNVM3_DEFAULT_REPACK_HEADROOM=0 \
  -DPHY_RAIL=1 \
 \

CINC = -I./ \
-I$(ARM_IAR7_DIR)/ARM/INC \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7 \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../.. \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../../stack \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/../util \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/protocol/zigbee/app/framework/include \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/plugin \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/.. \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32 \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/config \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/micro/cortexm3/efm32/efr32 \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../CMSIS/Include \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../Device/SiliconLabs/EFR32MG21/Include \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/common/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/config \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/dmadrv/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/gpiointerrupt/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../service/sleeptimer/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../service/sleeptimer/config \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../common/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/sleep/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/spidrv/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/tempdrv/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/uartdrv/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emdrv/ustimer/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../emlib/inc \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../middleware/glib \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../middleware/glib/glib \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/base/hal/../../radio/rail_lib/plugin \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/halconfig/inc/hal-config \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/hardware/module/config \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/hardware/kit/common/halconfig \
-I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/hardware/kit/common/bsp \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/emdrv/nvm3/inc \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/radio/rail_lib/chip/efr32/efr32xg2x \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/radio/rail_lib/common \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/radio/rail_lib/plugin/coexistence/common \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/radio/rail_lib/plugin/coexistence/hal/efr32 \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154 \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/radio/rail_lib/protocol/ble \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/radio/rail_lib/protocol/ieee802154 \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/radio/rail_lib/protocol/zwave \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/platform/service/mpu/inc \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/plugin/plugin-common/mbedtls \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/third_party/mbedtls \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/third_party/mbedtls/include \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/third_party/mbedtls/include/mbedtls \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/third_party/mbedtls/sl_crypto/include \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/third_party/mbedtls/sl_crypto/src/cryptoacc/include \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/third_party/mbedtls/sl_crypto/src/cryptoacc/src \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/third_party/segger/systemview/Config \
  -I../../../../../SiliconLabs/SimplicityStudio/v4/developer/sdks/gecko_sdk_suite/v2.7/util/third_party/segger/systemview/SEGGER \
  -Ihal-config \
 \

TARGET = SW_ZB_V1_0_0

CSOURCES = $(filter %.c, $(SOURCE_FILES))
ASMSOURCES = $(filter %.s79, $(SOURCE_FILES))
ASMSOURCES2 = $(filter %.s, $(SOURCE_FILES))

COBJS = $(addprefix $(OUTPUT_DIR)/,$(CSOURCES:.c=.o))
ASMOBJS = $(addprefix $(OUTPUT_DIR)/,$(ASMSOURCES:.s79=.o))
ASMOBJS2 = $(addprefix $(OUTPUT_DIR)/,$(ASMSOURCES2:.s=.o))

OUTPUT_DIRS = $(sort $(dir $(COBJS)) $(dir $(ASMOBJS)) $(dir $(ASMOBJS2)))

ARCHITECTUREID = efr32~family[m]~series[2]~device_configuration[1]~performance[a]~radio[010]~flash[512k]~temp[i]~package[m]~pins[32]~!module+none+gcc

# GNU ARM compiler
ifeq ($(findstring +gcc,$(ARCHITECTUREID)), +gcc)
$(info GCC Build)
	# Add linker circular reference as the order of objects may matter for any libraries used
	GROUP_START =-Wl,--start-group
	GROUP_END =-Wl,--end-group

	CCFLAGS = -g3 \
    -gdwarf-2 \
    -mcpu=cortex-m4 \
    -mthumb \
    -std=gnu99 \
    -Os  \
    -Wall  \
    -c  \
    -fmessage-length=0  \
    -ffunction-sections  \
    -fdata-sections  \
    -mfpu=fpv4-sp-d16  \
    -mfloat-abi=softfp \
	$(CDEFS) \
	$(CINC) \

	ASMFLAGS = -c \
	-g3 \
	-gdwarf-2 \
	-mcpu=cortex-m4 \
	-mthumb \
	-c \
	-x assembler-with-cpp \
	$(CINC) \
	$(ASMDEFS)

	LDFLAGS = -g3 \
	-gdwarf-2 \
	-mcpu=cortex-m4 \
	-mthumb -T "$(GLOBAL_BASE_DIR)/hal/micro/cortexm3/efm32/gcc-cfg.ld" \
	-L"$(GLOBAL_BASE_DIR)/hal/micro/cortexm3/" \
	-Xlinker --defsym="SIMEEPROM_SIZE=32768" \
	-Xlinker --defsym="PSSTORE_SIZE=0" \
	-Xlinker --defsym="LONGTOKEN_SIZE=0" \
	-Xlinker --defsym="LOCKBITS_IN_MAINFLASH_SIZE=8192" \
	-Xlinker --defsym="FLASH_SIZE=524288" \
	-Xlinker --defsym="RAM_SIZE=65536" \
	-Xlinker --defsym="FLASH_PAGE_SIZE=8192" \
	-Xlinker --defsym="APP_BTL=1" \
	-Xlinker --defsym="EMBER_MALLOC_HEAP_SIZE=0" \
	-Xlinker --defsym="HEADER_SIZE=512" \
	-Xlinker --defsym="BTL_SIZE=16384" \
	-Xlinker --gc-sections \
	-Xlinker -Map="$(PROJECTNAME).map" \
	-mfpu=fpv4-sp-d16 \
	-mfloat-abi=softfp --specs=nano.specs -u _printf_float \
	-Wl,--start-group -lgcc -lc -lnosys   -Wl,--end-group

	ARCHFLAGS = r

	ELFTOOLFLAGS_BIN = -O binary
	ELFTOOLFLAGS_HEX = -O ihex
	ELFTOOLFLAGS_S37 = -O srec

	ifeq ($(OS),Windows_NT)
		ARCH = $(ARM_GNU_DIR)/bin/arm-none-eabi-gcc-ar.exe
		AS = $(ARM_GNU_DIR)/bin/arm-none-eabi-gcc.exe
		CC = $(ARM_GNU_DIR)/bin/arm-none-eabi-gcc.exe
		ELFTOOL = $(ARM_GNU_DIR)/bin/arm-none-eabi-objcopy.exe
		LD = $(ARM_GNU_DIR)/bin/arm-none-eabi-gcc.exe
	else
		ARCH = $(ARM_GNU_DIR)/bin/arm-none-eabi-gcc-ar
		AS = $(ARM_GNU_DIR)/bin/arm-none-eabi-gcc
		CC = $(ARM_GNU_DIR)/bin/arm-none-eabi-gcc
		ELFTOOL = $(ARM_GNU_DIR)/bin/arm-none-eabi-objcopy
		LD = $(ARM_GNU_DIR)/bin/arm-none-eabi-gcc
	endif

endif

# IAR 7.xx toolchain
ifeq ($(findstring +iar,$(ARCHITECTUREID)), +iar)
$(info IAR Build)

	# IAR is not sensitive to linker lib order thus no groups needed.
	GROUP_START =
	GROUP_END =
	CINC += -I$(ARM_IAR6_DIR)/ARM/INC

	ifndef ARM_IAR7_DIR
	$(error ARM_IAR7_DIR is not set. Please define ARM_IAR7_DIR pointing to your IAR 7.xx installation folder.)
	endif

	CCFLAGS = --cpu=cortex-m3 \
	--cpu_mode=thumb \
	--diag_suppress=Pa050 \
	-e \
	--endian=little \
	--fpu=none \
	--no_path_in_file_macros \
	--separate_cluster_for_initialized_variables \
	--dlib_config=$(ARM_IAR7_DIR)/ARM/inc/c/DLib_Config_Normal.h \
	--debug \
	--dependencies=m $*.d \
	-Ohz \
	$(CDEFS) \
	$(CINC)

	ASMFLAGS = --cpu cortex-M3 \
	--fpu None \
	-s+ \
	"-M<>" \
	-w+ \
	-t2 \
	-r \
	$(CINC) \
	$(ASMDEFS)

	LDFLAGS = --entry __iar_program_start \
	--diag_suppress=Lp012 \
	--config $(GLOBAL_BASE_DIR)/hal/micro/cortexm3/efm32/iar-cfg.icf \
	--config_def NULL_BTL=1 \
	--config_def EMBER_MALLOC_HEAP_SIZE=0

	ARCH = $(JAMEXE_PREFIX) $(ARM_IAR7_DIR)/arm/bin/iarchive.exe
	AS = $(JAMEXE_PREFIX) $(ARM_IAR7_DIR)/arm/bin/iasmarm.exe
	CC = $(JAMEXE_PREFIX) $(ARM_IAR7_DIR)/arm/bin/iccarm.exe
	ELFTOOL = $(JAMEXE_PREFIX) $(ARM_IAR7_DIR)/arm/bin/ielftool.exe
	LD = $(JAMEXE_PREFIX) $(ARM_IAR7_DIR)/arm/bin/ilinkarm.exe

	# No archiver arguments needed for IAR.
	ARCHFLAGS =

	ELFTOOLFLAGS_BIN = --bin
	ELFTOOLFLAGS_HEX = --ihex
	ELFTOOLFLAGS_S37 = --srec --srec-s3only

endif

.PHONY: all clean PROLOGUE

all: PROLOGUE $(OUTPUT_DIRS) $(COBJS) $(ASMOBJS) $(ASMOBJS2) $(LIB_FILES)
	@echo 'Linking...'
	@$(LD) $(GROUP_START) $(LDFLAGS) $(COBJS) $(ASMOBJS) $(ASMOBJS2) $(LIB_FILES) $(GROUP_END) -o $(OUTPUT_DIR)/$(TARGET).out
	@$(ELFTOOL) $(OUTPUT_DIR)/$(TARGET).out $(ELFTOOLFLAGS_BIN) $(OUTPUT_DIR)/$(TARGET).bin
	@$(ELFTOOL) $(OUTPUT_DIR)/$(TARGET).out $(ELFTOOLFLAGS_HEX) $(OUTPUT_DIR)/$(TARGET).hex
	@$(ELFTOOL) $(OUTPUT_DIR)/$(TARGET).out $(ELFTOOLFLAGS_S37) $(OUTPUT_DIR)/$(TARGET).s37
	@echo 'Done.'

PROLOGUE:
#	@echo $(COBJS)
#	@echo $(ASMOBJS)
#	@echo $(ASMOBJS2)

$(OUTPUT_DIRS):
	@mkdir -p $@

$(COBJS): %.o:
	@echo 'Building $(notdir $(@:%.o=%.c))...'
	@$(CC) $(CCFLAGS) -o $@ $(filter %$(@:$(OUTPUT_DIR)/%.o=%.c),$(CSOURCES)) > /dev/null \

$(ASMOBJS): %.o:
	@echo 'Building $(notdir $(@:%.o=%.s79))...'
	@$(AS) $(ASMFLAGS) -o $@ $(filter %$(@:$(OUTPUT_DIR)/%.o=%.s79),$(ASMSOURCES)) > /dev/null

$(ASMOBJS2): %.o:
	@echo 'Building $(notdir $(@:%.o=%.s))...'
	@$(AS) $(ASMFLAGS) -o $@ $(filter %$(@:$(OUTPUT_DIR)/%.o=%.s),$(ASMSOURCES2)) > /dev/null

clean:
	$(RM) -r $(COBJS)
	$(RM) -r $(ASMOBJS)
	$(RM) -r $(ASMOBJS2)
	$(RM) -r $(OUTPUT_DIR)
