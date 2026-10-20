.syntax unified
.cpu cortex-m0plus
.thumb
.global asm_main
.type asm_main, %function
.align 2

asm_main:
    PUSH {lr}
    BL link_init_display

infinite_loop:
    LDR R0, =0b01111101
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01000100
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01111010
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01101110
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01000111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b00101111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b00111111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01100110
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01111111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01101111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    // Cuenta regresiva a cero
    LDR R0, =0b01111111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01100110
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b00111111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b00101111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01000111
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01101110
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01111010
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    LDR R0, =0b01000100
    BL link_gpio_put_all
    LDR R0, =1000
    BL sleep_ms

    B infinite_loop
    POP {pc}
