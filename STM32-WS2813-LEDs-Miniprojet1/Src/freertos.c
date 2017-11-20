/**
 ******************************************************************************
 * File Name          : freertos.c
 * Description        : Code for freertos applications
 ******************************************************************************
 * This notice applies to any and all portions of this file
 * that are not between comment pairs USER CODE BEGIN and
 * USER CODE END. Other portions of this file, whether
 * inserted by the user or by software development tools
 * are owned by their respective copyright owners.
 *
 * Copyright (c) 2017 STMicroelectronics International N.V.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted, provided that the following conditions are met:
 *
 * 1. Redistribution of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. Neither the name of STMicroelectronics nor the names of other
 *    contributors to this software may be used to endorse or promote products
 *    derived from this software without specific written permission.
 * 4. This software, including modifications and/or derivative works of this
 *    software, must execute solely and exclusively on microcontroller or
 *    microprocessor devices manufactured by or for STMicroelectronics.
 * 5. Redistribution and use of this software other than as permitted under
 *    this license is void and will automatically terminate your rights under
 *    this license.
 *
 * THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
 * RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT
 * SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "cmsis_os.h"

/* USER CODE BEGIN Includes */     
#include "../LIBS/WS2813.h"
#include "x_nucleo_iks01a2.h"
#include "x_nucleo_iks01a2_accelero.h"
#include "usart.h"

//#define KARR
/* USER CODE END Includes */

/* Variables -----------------------------------------------------------------*/
osThreadId defaultTaskHandle;

/* USER CODE BEGIN Variables */
#define MAX_BUF_SIZE 40
static char dataOut[MAX_BUF_SIZE];
static void *LSM6DSL_X_0_handle = NULL;
int accelero;
/* USER CODE END Variables */

/* Function prototypes -------------------------------------------------------*/
void StartDefaultTask(void const * argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/* USER CODE BEGIN FunctionPrototypes */
void vLedsTimerCallback(TimerHandle_t* timer);
void vAcquisitionCallback(TimerHandle_t* timer);
/* USER CODE END FunctionPrototypes */

/* Hook prototypes */

/* Init FreeRTOS */

void MX_FREERTOS_Init(void) {
	/* USER CODE BEGIN Init */
	ws2813_init_tim(&htim3, TIM_CHANNEL_1, 8);
	BSP_ACCELERO_Init( LSM6DSL_X_0, &LSM6DSL_X_0_handle );
	BSP_ACCELERO_Sensor_Enable( LSM6DSL_X_0_handle );
	/* USER CODE END Init */

	/* USER CODE BEGIN RTOS_MUTEX */


	/* USER CODE END RTOS_MUTEX */

	/* USER CODE BEGIN RTOS_SEMAPHORES */
	/* add semaphores, ... */
	/* USER CODE END RTOS_SEMAPHORES */

	/* USER CODE BEGIN RTOS_TIMERS */
	/* start timers, add new ones, ... */
	TimerHandle_t tim = xTimerCreate("LEDs", pdMS_TO_TICKS(1000),
			pdTRUE, NULL, vLedsTimerCallback);
	xTimerStart(tim, 10);

	TimerHandle_t acquisitionTime = xTimerCreate("Acquisition",
			pdMS_TO_TICKS(100),
			pdTRUE,
			NULL,
			vAcquisitionCallback);

	xTimerStart(acquisitionTime, pdMS_TO_TICKS(10));

	/* USER CODE END RTOS_TIMERS */

	/* Create the thread(s) */
	/* definition and creation of defaultTask */
	osThreadDef(defaultTask, StartDefaultTask, osPriorityNormal, 0, 128);
	defaultTaskHandle = osThreadCreate(osThread(defaultTask), NULL);

	/* USER CODE BEGIN RTOS_THREADS */
	/* add threads, ... */
	/* USER CODE END RTOS_THREADS */

	/* USER CODE BEGIN RTOS_QUEUES */
	/* add queues, ... */
	/* USER CODE END RTOS_QUEUES */
}

/* StartDefaultTask function */
void StartDefaultTask(void const * argument)
{

	/* USER CODE BEGIN StartDefaultTask */
	/* Infinite loop */
	for(;;)
	{
		osDelay(1);
	}
	/* USER CODE END StartDefaultTask */
}

/* USER CODE BEGIN Application */
void vAcquisitionCallback(TimerHandle_t* timer){

	uint8_t id;
	SensorAxes_t acceleration;
	uint8_t status;


	BSP_ACCELERO_Get_Instance( LSM6DSL_X_0_handle, &id );

	BSP_ACCELERO_IsInitialized( LSM6DSL_X_0_handle, &status );

	if ( status == 1 )
	{
		if ( BSP_ACCELERO_Get_Axes( LSM6DSL_X_0_handle, &acceleration ) == COMPONENT_ERROR )
		{
			acceleration.AXIS_X = 0;
		}
		accelero=(int)acceleration.AXIS_X;
		snprintf( dataOut, MAX_BUF_SIZE, "ACC_X : %d\r\n", (int)acceleration.AXIS_X);

		HAL_UART_Transmit( &huart2, ( uint8_t * )dataOut, strlen( dataOut ), 5000 );


	}
}

/**
 * @brief Fonction d'appel du timer d'animation
 *
 * Cette fonction exécute un chenillard "K2000"
 * #Nostalgie #Annees80
 *
 *
 */
void vLedsTimerCallback(TimerHandle_t* timer)
{
	static int led=0;
	static int leds[8] = {0};
	int i;
	WS2813_COLOR color_on={.rgb={.r=0,.g=0,.b=0}};

	// Pour chaque LED
	for (i=0;i<8;i++) //on construit une boucle afin que les leds s'active ou non en temps réel en fonction de la position relevée
	{
		//on active ou non les leds en fonction de la position rendue par l'accélérometre

		if(accelero < - 400){ //on prendre -400 en valeur min
			led=0; //on définit la led qui correspondra a ces valeurs
			color_on.rgb.r=63; // on allume la led quand la valeur est atteinte en précisant la couleur souhaité
			ws2813_update_led(0, color_on); // on met a jour afin de relevé si la valeur a changer ou non
			color_on.rgb.r=0; //et on l'éteind si la valeur ne correspond plus

			//on fait la même chose pour toute les autres leds.

		}else if(accelero > 400){ // on prendra 400 en valeur max
			led=7;
			color_on.rgb.r=63;
			ws2813_update_led(7, color_on);
			color_on.rgb.r=0;
		}else if(accelero > -400 && accelero < -200){
			led=1;
			color_on.rgb.g=63;
			color_on.rgb.r=63;
			ws2813_update_led(1, color_on);
			color_on.rgb.g=0;
			color_on.rgb.r=0;

		}else if(accelero > 200 && accelero < 400){
			led=6;
			color_on.rgb.g=63;
			color_on.rgb.r=63;
			ws2813_update_led(6, color_on);
			color_on.rgb.g=0;
			color_on.rgb.r=0;
		}else if(accelero > -200 && accelero < -50){
			led=2;
			color_on.rgb.b=63;
			ws2813_update_led(2, color_on);
			color_on.rgb.b=0;
		}else if(accelero > 50 && accelero < 200){
			led=5;
			color_on.rgb.b=63;
			ws2813_update_led(5, color_on);
			color_on.rgb.b=0;
		}else if(accelero > 0 && accelero < 50){
			led=4;
			color_on.rgb.g=63;
			ws2813_update_led(4, color_on);
			color_on.rgb.g=0;
		}else if(accelero > -50 && accelero < 0){
			led=3;
			color_on.rgb.g=63;
			ws2813_update_led(3, color_on);
			color_on.rgb.g=0;
		}

		// Met à jour la LED dans le module WS2813
		if(i!=led)
			ws2813_update_led(i, color_on);

	}


	// Transmet la trame aux LEDS
	ws2813_start_transmission_tim();
}
/* USER CODE END Application */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
