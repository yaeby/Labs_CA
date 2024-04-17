section .data
    ; Define strings to be displayed as prompts and messages
    prompt1 db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    result_msg db "The sum is: %d", 10, 0

section .bss
    ; Define uninitialized memory space to store the input numbers
    num1 resd 1
    num2 resd 1

section .text
    ; Declare external functions printf and scanf
    extern  printf
    extern  scanf

global _start

_start:
    ; Prompt for the first number
    push    prompt1
    call    printf   ; Call printf to display the prompt
    add     esp, 4   ; Adjust the stack pointer after the call

    ; Read the first number
    push    dword num1
    push    dword fmt_input
    call    scanf    ; Call scanf to read the first number
    add     esp, 8   ; Adjust the stack pointer after the call

    ; Prompt for the second number
    push    prompt2
    call    printf   ; Call printf to display the prompt
    add     esp, 4   ; Adjust the stack pointer after the call

    ; Read the second number
    push    dword num2
    push    dword fmt_input
    call    scanf    ; Call scanf to read the second number
    add     esp, 8   ; Adjust the stack pointer after the call

    ; Add the numbers
    mov     eax, [num1]  ; Move the first number into the eax register
    add     eax, [num2]  ; Add the second number to eax

    ; Print the result
    push    eax          ; Push the result onto the stack
    push    dword result_msg  ; Push the message to be printed onto the stack
    call    printf       ; Call printf to print the result
    add     esp, 8       ; Adjust the stack pointer after the call

    ; Exit the program
    mov     eax, 0       ; Move 0 into the eax register (return value)
    ret                  ; Return from the program

section .data
    fmt_input db "%d", 0  ; Define format string for scanf
