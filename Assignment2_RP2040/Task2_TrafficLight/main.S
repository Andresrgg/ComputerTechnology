.syntax unified
.cpu cortex-m0plus
.thumb
.global mains
.type mains, %function
.align 2

.equ LED_GREEN, 0
.equ LED_YELLOW, 1
.equ LED_RED, 2
.equ GPIO_OUT, 1

mains:
    PUSH {lr}
    MOVS R0, #LED_GREEN
    MOVS R1, #GPIO_OUT
    BL link_gpio_set_dir

    MOVS R0, #LED_YELLOW
    MOVS R1, #GPIO_OUT
    BL link_gpio_set_dir

    MOVS R0, #LED_RED
    MOVS R1, #GPIO_OUT
    BL link_gpio_set_dir

traffic_loop:
    // Estado Rojo
    MOVS R0, #LED_RED
    MOVS R1, #1
    BL link_gpio_put
    MOVS R0, #LED_YELLOW
    MOVS R1, #0
    BL link_gpio_put
    MOVS R0, #LED_GREEN
    MOVS R1, #0
    BL link_gpio_put
    LDR R0, =5000
    BL sleep_ms

    // Estado Amarillo
    MOVS R0, #LED_RED
    MOVS R1, #0
    BL link_gpio_put
    MOVS R0, #LED_YELLOW
    MOVS R1, #1
    BL link_gpio_put
    MOVS R0, #LED_GREEN
    MOVS R1, #0
    BL link_gpio_put
    LDR R0, =5000
    BL sleep_ms

    // Estado Verde
    MOVS R0, #LED_RED
    MOVS R1, #0
    BL link_gpio_put
    MOVS R0, #LED_YELLOW
    MOVS R1, #0
    BL link_gpio_put
    MOVS R0, #LED_GREEN
    MOVS R1, #1
    BL link_gpio_put
    LDR R0, =5000
    BL sleep_ms

    B traffic_loop
    POP {pc}
