.syntax unified
.cpu cortex-m0plus
.thumb
.global asm_main
.type asm_main, %function
.align 2

.equ BIT0, 0 @ LED bit 0
.equ BIT1, 1 @ LED bit 1
.equ BIT2, 2 @ LED bit 2
.equ GPIO_OUT, 1

asm_main:
    PUSH {lr}
    MOVS R0, #BIT0
    MOVS R1, #GPIO_OUT
    BL link_gpio_set_dir

    MOVS R0, #BIT1
    MOVS R1, #GPIO_OUT
    BL link_gpio_set_dir

    MOVS R0, #BIT2
    MOVS R1, #GPIO_OUT
    BL link_gpio_set_dir

    MOVS R4, #0

count_loop:
    // Bit 0
    MOVS R0, #BIT0
    MOVS R1, R4
    MOVS R5, #1
    ANDS R1, R5
    BL link_gpio_put

    // Bit 1
    MOVS R0, #BIT1
    MOVS R1, R4
    LSRS R1, R1, #1
    MOVS R5, #1
    ANDS R1, R5
    BL link_gpio_put

    // Bit 2
    MOVS R0, #BIT2
    MOVS R1, R4
    LSRS R1, R1, #2
    MOVS R5, #1
    ANDS R1, R5
    BL link_gpio_put

    LDR R0, =1000
    BL sleep_ms

    ADDS R4, R4, #1
    MOVS R5, #8
    CMP R4, R5
    BLT count_loop

    MOVS R4, #0
    B count_loop

    POP {pc}
