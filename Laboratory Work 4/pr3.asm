section .data
    hello_msg db 'Hello, World!', 0

section .text
extern printf
global _WinMain@16

_WinMain@16:
    ; Prepare arguments for the call to printf
    push dword hello_msg  ; push the address of the string
    call printf          ; call the printf function
    add esp, 4           ; adjust the stack pointer to clean up

    ; Exit the program
    mov eax, 0
    ret 16
