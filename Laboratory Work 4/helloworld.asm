NULL EQU 0
STD_OUTPUT_HANDLE EQU -11

extern _GetStdHandle@4
extern _WriteFile@20
extern _ExitProcess@4

global start

section .data

    Message db "Hello World", 0Dh, 0Ah
    MessageLength EQU $-Message

section .bss

    StandartHandle rest 1
    Written rest 1

section .text

    Start:
        push STD_OUTPUT_HANDLE
        call _GetStdHandle@4
        mov dword [StandartHandle], EAX 

        push NULL
        push Written
        push MessageLength
        push Message
        push dword [StandartHandle]
        call _WriteFile@20

        push NULL
        call _ExitProcess@4