################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/dma.c \
../Src/freertos.c \
../Src/gpio.c \
../Src/main.c \
../Src/stm32l4xx_hal_msp.c \
../Src/stm32l4xx_hal_timebase_TIM.c \
../Src/stm32l4xx_it.c \
../Src/system_stm32l4xx.c \
../Src/tim.c \
../Src/usart.c 

OBJS += \
./Src/dma.o \
./Src/freertos.o \
./Src/gpio.o \
./Src/main.o \
./Src/stm32l4xx_hal_msp.o \
./Src/stm32l4xx_hal_timebase_TIM.o \
./Src/stm32l4xx_it.o \
./Src/system_stm32l4xx.o \
./Src/tim.o \
./Src/usart.o 

C_DEPS += \
./Src/dma.d \
./Src/freertos.d \
./Src/gpio.d \
./Src/main.d \
./Src/stm32l4xx_hal_msp.d \
./Src/stm32l4xx_hal_timebase_TIM.d \
./Src/stm32l4xx_it.d \
./Src/system_stm32l4xx.d \
./Src/tim.d \
./Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' -DUSE_STM32L4XX_NUCLEO '-D__packed="__attribute__((__packed__))"' -DUSE_HAL_DRIVER -DSTM32L476xx -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Inc -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/Components/Common" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/Components/lsm303agr" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/Components/lsm6dsl" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/STM32L4xx_Nucleo" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/X_NUCLEO_IKS01A2" -I../WS2813/LIBS -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Drivers/STM32L4xx_HAL_Driver/Inc -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Drivers/CMSIS/Device/ST/STM32L4xx/Include -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Middlewares/Third_Party/FreeRTOS/Source/include -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Drivers/CMSIS/Include -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Inc" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


