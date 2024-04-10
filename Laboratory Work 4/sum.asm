section .text
global _start

extern GetStdHandle
extern WriteFile
extern ExitProcess

_start:
    ; Get the standard output handle
    push -11
    call GetStdHandle
    mov dword [StandardHandle], eax

    ; Calculate the sum
    mov     eax, [x]
    sub     eax, '0'
    mov     ebx, [y]
    sub     ebx, '0'
    add     eax, ebx
    add     eax, '0'
    mov     [sum], eax

    ; Print "sum of x and y is "
    mov     ecx, msg
    mov     edx, len
    mov     ebx, dword [StandardHandle]
    call    PrintString

    ; Print the sum
    mov     ecx, sum
    mov     edx, 1
    mov     ebx, dword [StandardHandle]
    call    PrintString

    ; Exit the program
    push    0
    call    ExitProcess

; PrintString function for writing a null-terminated string to the console
PrintString:
    push    esi
    push    edi

    mov     esi, ecx          ; esi = msg pointer
    mov     edi, edx          ; edi = len or 1 (number of characters to write)
    mov     ecx, dword [StandardHandle]   ; file handle (stdout)
    mov     eax, 4            ; function code for WriteFile
    mov     ebx, 0            ; reserved, must be zero
    call    WriteFile

    pop     edi
    pop     esi
    ret

section .data
    x db '5'
    y db '3'
    msg db  "sum of x and y is ", 0
    len equ $ - msg
    StandardHandle dd 0  ; Define StandardHandle as a DWORD

section .bss
    sum resb 1
