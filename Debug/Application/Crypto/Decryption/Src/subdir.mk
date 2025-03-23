################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/Crypto/Decryption/Src/Decryption.c 

OBJS += \
./Application/Crypto/Decryption/Src/Decryption.o 

C_DEPS += \
./Application/Crypto/Decryption/Src/Decryption.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Crypto/Decryption/Src/%.o Application/Crypto/Decryption/Src/%.su Application/Crypto/Decryption/Src/%.cyclo: ../Application/Crypto/Decryption/Src/%.c Application/Crypto/Decryption/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_NUCLEO_64 -DUSE_HAL_DRIVER -DSTM32H563xx -c -I../Core/Inc -I../Drivers/STM32H5xx_HAL_Driver/Inc -I../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../Drivers/BSP/STM32H5xx_Nucleo -I../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/USB/Class/CDC/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/USB/Core/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Library/24C256C/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Library/W25Q64JV/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-Crypto-2f-Decryption-2f-Src

clean-Application-2f-Crypto-2f-Decryption-2f-Src:
	-$(RM) ./Application/Crypto/Decryption/Src/Decryption.cyclo ./Application/Crypto/Decryption/Src/Decryption.d ./Application/Crypto/Decryption/Src/Decryption.o ./Application/Crypto/Decryption/Src/Decryption.su

.PHONY: clean-Application-2f-Crypto-2f-Decryption-2f-Src

