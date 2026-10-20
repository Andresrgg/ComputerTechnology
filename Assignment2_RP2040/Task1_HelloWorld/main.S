.syntax unified
.cpu cortex-m0plus
.thumb
.thumb_func
.global main

main:
    MOVS R7, #100
    BL stdio_init_all

loop:
    LDR R0, =helloworld
    MOV R1, R7
    BL printf
    LDR R0, =1000
    BL sleep_ms
    MOVS R6, #0
    SUBS R7, #1
    CMP R7, R6
    BNE loop
    MOVS R7, #100
    B loop

.data
.align 4
helloworld:
    .asciz "Hello World %d\n"
