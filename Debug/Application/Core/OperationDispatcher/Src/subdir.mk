################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/Core/OperationDispatcher/Src/OperationDispatcher.c 

OBJS += \
./Application/Core/OperationDispatcher/Src/OperationDispatcher.o 

C_DEPS += \
./Application/Core/OperationDispatcher/Src/OperationDispatcher.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Core/OperationDispatcher/Src/%.o Application/Core/OperationDispatcher/Src/%.su Application/Core/OperationDispatcher/Src/%.cyclo: ../Application/Core/OperationDispatcher/Src/%.c Application/Core/OperationDispatcher/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_NUCLEO_64 -DUSE_HAL_DRIVER -DSTM32H563xx -c -I../Core/Inc -I../Drivers/STM32H5xx_HAL_Driver/Inc -I../Drivers/STM32H5xx_HAL_Driver/Inc/Legacy -I../Drivers/BSP/STM32H5xx_Nucleo -I../Drivers/CMSIS/Device/ST/STM32H5xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/USB/Class/CDC/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/USB/Core/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Utils/Logger/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Protocol" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Protocol/PacketParser/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Protocol/PacketBuilder/Inc" -I"C:/Users/zalma/Downloads/Workspaces/STM32H5_HAL/HardwareSecurityModule/Application/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-Core-2f-OperationDispatcher-2f-Src

clean-Application-2f-Core-2f-OperationDispatcher-2f-Src:
	-$(RM) ./Application/Core/OperationDispatcher/Src/OperationDispatcher.cyclo ./Application/Core/OperationDispatcher/Src/OperationDispatcher.d ./Application/Core/OperationDispatcher/Src/OperationDispatcher.o ./Application/Core/OperationDispatcher/Src/OperationDispatcher.su

.PHONY: clean-Application-2f-Core-2f-OperationDispatcher-2f-Src

