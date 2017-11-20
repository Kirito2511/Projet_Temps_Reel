################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver.c \
../Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver_HL.c \
../Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver.c \
../Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver_HL.c 

OBJS += \
./Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver.o \
./Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver_HL.o \
./Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver.o \
./Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver_HL.o 

C_DEPS += \
./Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver.d \
./Drivers/BSP/Components/lsm303agr/LSM303AGR_ACC_driver_HL.d \
./Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver.d \
./Drivers/BSP/Components/lsm303agr/LSM303AGR_MAG_driver_HL.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/lsm303agr/%.o: ../Drivers/BSP/Components/lsm303agr/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' -DUSE_STM32L4XX_NUCLEO '-D__packed="__attribute__((__packed__))"' -DUSE_HAL_DRIVER -DSTM32L476xx -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Inc -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/Components/Common" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/Components/lsm303agr" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/Components/lsm6dsl" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/STM32L4xx_Nucleo" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/BSP/X_NUCLEO_IKS01A2" -I../WS2813/LIBS -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Drivers/STM32L4xx_HAL_Driver/Inc -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Drivers/CMSIS/Device/ST/STM32L4xx/Include -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Middlewares/Third_Party/FreeRTOS/Source/include -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I/media/sf_Code/stm/Projets/IMERIR/Drivers/WS2813/Drivers/CMSIS/Include -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Inc" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS" -I"/media/sf_dossier_vm/STM32-WS2813-LEDs-Miniprojet1/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


