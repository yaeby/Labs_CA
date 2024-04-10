section .data
    prompt1 db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    result_msg db "The sum is: %d", 10, 0

section .bss
    num1 resd 1
    num2 resd 1

section .text
    extern  printf
    extern  scanf

global _start

_start:
    ; Prompt for the first number
    push    prompt1
    call    printf
    add     esp, 4

    ; Read the first number
    push    dword num1
    push    dword fmt_input
    call    scanf
    add     esp, 8

    ; Prompt for the second number
    push    prompt2
    call    printf
    add     esp, 4

    ; Read the second number
    push    dword num2
    push    dword fmt_input
    call    scanf
    add     esp, 8

    ; Add the numbers
    mov     eax, [num1]
    add     eax, [num2]

    ; Print the result
    push    eax
    push    dword result_msg
    call    printf
    add     esp, 8

    ; Exit the program
    mov     eax, 0
    ret

section .data
    fmt_input db "%d", 0