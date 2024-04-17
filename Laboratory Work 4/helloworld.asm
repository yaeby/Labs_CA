NULL EQU 0            ; Define a constant NULL with a value of 0
STD_OUTPUT_HANDLE EQU -11  ; Define a constant STD_OUTPUT_HANDLE with a value of -11

extern _GetStdHandle@4    ; Declare external functions
extern _WriteFile@20
extern _ExitProcess@4

global start          ; Declare the entry point of the program as 'start'

section .data

    Message db "Hello World", 0Dh, 0Ah  ; Define a string message terminated with carriage return and line feed
    MessageLength EQU $-Message         ; Calculate the length of the message

section .bss

    StandartHandle resd 1   ; Reserve uninitialized memory space to store the standard output handle
    Written resd 1          ; Reserve uninitialized memory space to store the number of bytes written

section .text

    Start:
        push STD_OUTPUT_HANDLE            ; Push STD_OUTPUT_HANDLE onto the stack
        call _GetStdHandle@4              ; Call _GetStdHandle to retrieve the standard output handle
        mov dword [StandartHandle], EAX   ; Move the result (standard output handle) to StandartHandle variable

        push NULL                         ; Push NULL onto the stack
        push Written                      ; Push the address of the Written variable onto the stack
        push MessageLength                ; Push the length of the message onto the stack
        push Message                      ; Push the address of the message onto the stack
        push dword [StandartHandle]       ; Push the standard output handle onto the stack
        call _WriteFile@20                ; Call _WriteFile to write the message to the standard output

        push NULL                         ; Push NULL onto the stack
        call _ExitProcess@4               ; Call _ExitProcess to terminate the program
