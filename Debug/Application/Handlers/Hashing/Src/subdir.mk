################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/Handlers/Hashing/Src/HashHandler.c 

OBJS += \
./Application/Handlers/Hashing/Src/HashHandler.o 

C_DEPS += \
./Application/Handlers/Hashing/Src/HashHandler.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Handlers/Hashing/Src/%.o Application/Handlers/Hashing/Src/%.su Application/Handlers/Hashing/Src/%.cyclo: ../Application/Handlers/Hashing/Src/%.c Application/Handlers/Hashing/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_NUCLEO_64 -DUSE_HAL_DRIVER -DSTM32H563xx -c -I../Core/Inc -I../Drivers/STM32H5xx_HAL_Driver/Inc -I../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../Drivers/BSP/STM32H5xx_Nucleo -I../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/USB/Class/CDC/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/USB/Core/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Utils/Logger/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Protocol" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Protocol/PacketParser/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Protocol/PacketBuilder/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-Handlers-2f-Hashing-2f-Src

clean-Application-2f-Handlers-2f-Hashing-2f-Src:
	-$(RM) ./Application/Handlers/Hashing/Src/HashHandler.cyclo ./Application/Handlers/Hashing/Src/HashHandler.d ./Application/Handlers/Hashing/Src/HashHandler.o ./Application/Handlers/Hashing/Src/HashHandler.su

.PHONY: clean-Application-2f-Handlers-2f-Hashing-2f-Src

