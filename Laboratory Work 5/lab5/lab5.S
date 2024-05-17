	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "0. Generate 10 random numbers between 1 and 55\0"
LC1:
	.ascii "1. Add two numbers\0"
LC2:
	.ascii "2. Subtract two numbers\0"
LC3:
	.ascii "3. Multiply two numbers\0"
LC4:
	.ascii "4. Divide two numbers\0"
LC5:
	.ascii "5. Generate random number\0"
LC6:
	.ascii "6. Decimal to binary\0"
LC7:
	.ascii "7. Decimal to hexadecimal\0"
LC8:
	.ascii "8. Concatenate two strings\0"
LC9:
	.ascii "9. Compare two strings\0"
LC10:
	.ascii "q. Exit the program\0"
	.text
	.p2align 4,,15
	.globl	_help
	.def	_help;	.scl	2;	.type	32;	.endef
_help:
	subl	$28, %esp
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_puts
	movl	$LC2, (%esp)
	call	_puts
	movl	$LC3, (%esp)
	call	_puts
	movl	$LC4, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_puts
	movl	$LC6, (%esp)
	call	_puts
	movl	$LC7, (%esp)
	call	_puts
	movl	$LC8, (%esp)
	call	_puts
	movl	$LC9, (%esp)
	call	_puts
	movl	$LC10, (%esp)
	call	_puts
	addl	$28, %esp
	ret
	.section .rdata,"dr"
LC11:
	.ascii "%d \0"
	.text
	.p2align 4,,15
	.globl	_generate_rand
	.def	_generate_rand;	.scl	2;	.type	32;	.endef
_generate_rand:
	pushl	%edi
	pushl	%esi
	xorl	%edi, %edi
	pushl	%ebx
	movl	$-1840700269, %esi
	subl	$16, %esp
	movl	32(%esp), %ebx
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	testl	%ebx, %ebx
	jle	L6
	.p2align 4,,10
L7:
	call	_rand
	movl	%eax, %ecx
	movl	$LC11, (%esp)
	addl	$1, %edi
	imull	%esi
	movl	%ecx, %eax
	sarl	$31, %eax
	addl	%ecx, %edx
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$56, %edx, %edx
	subl	%edx, %ecx
	movl	%ecx, 4(%esp)
	call	_printf
	cmpl	%edi, %ebx
	jne	L7
L6:
	movl	$10, 32(%esp)
	addl	$16, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	jmp	_putchar
	.section .rdata,"dr"
LC12:
	.ascii "Enter the first number: \0"
LC13:
	.ascii "%d\0"
LC14:
	.ascii "Enter the second number: \0"
LC15:
	.ascii "Sum: %d\12\0"
	.text
	.p2align 4,,15
	.globl	_add_two_numbers
	.def	_add_two_numbers;	.scl	2;	.type	32;	.endef
_add_two_numbers:
	subl	$44, %esp
	movl	$LC12, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	$LC14, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	28(%esp), %eax
	addl	24(%esp), %eax
	movl	$LC15, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	addl	$44, %esp
	ret
	.section .rdata,"dr"
LC16:
	.ascii "Difference: %d\12\0"
	.text
	.p2align 4,,15
	.globl	_sub_two_numbers
	.def	_sub_two_numbers;	.scl	2;	.type	32;	.endef
_sub_two_numbers:
	subl	$44, %esp
	movl	$LC12, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	$LC14, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	24(%esp), %eax
	subl	28(%esp), %eax
	movl	$LC16, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	addl	$44, %esp
	ret
	.section .rdata,"dr"
LC17:
	.ascii "Product: %d\12\0"
	.text
	.p2align 4,,15
	.globl	_mul_two_numbers
	.def	_mul_two_numbers;	.scl	2;	.type	32;	.endef
_mul_two_numbers:
	subl	$44, %esp
	movl	$LC12, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	$LC14, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	24(%esp), %eax
	movl	$LC17, (%esp)
	imull	28(%esp), %eax
	movl	%eax, 4(%esp)
	call	_printf
	addl	$44, %esp
	ret
	.section .rdata,"dr"
LC18:
	.ascii "Enter the dividend: \0"
LC19:
	.ascii "Enter the divisor: \0"
LC20:
	.ascii "Quotient: %d\12\0"
LC21:
	.ascii "Error: Division by zero.\0"
	.text
	.p2align 4,,15
	.globl	_div_two_numbers
	.def	_div_two_numbers;	.scl	2;	.type	32;	.endef
_div_two_numbers:
	subl	$44, %esp
	movl	$LC18, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	$LC19, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	28(%esp), %ecx
	testl	%ecx, %ecx
	jne	L22
	movl	$LC21, (%esp)
	call	_puts
	addl	$44, %esp
	ret
	.p2align 4,,10
L22:
	movl	24(%esp), %eax
	movl	$LC20, (%esp)
	cltd
	idivl	%ecx
	movl	%eax, 4(%esp)
	call	_printf
	addl	$44, %esp
	ret
	.section .rdata,"dr"
LC22:
	.ascii "Enter a number in base 10: \0"
LC23:
	.ascii "Binary: 0\0"
LC24:
	.ascii "Binary: \0"
	.text
	.p2align 4,,15
	.globl	_decimal_to_binary
	.def	_decimal_to_binary;	.scl	2;	.type	32;	.endef
_decimal_to_binary:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$160, %esp
	leal	28(%esp), %esi
	movl	$LC22, (%esp)
	call	_printf
	movl	%esi, 4(%esp)
	movl	$LC13, (%esp)
	call	_scanf
	movl	28(%esp), %eax
	cmpl	$0, %eax
	je	L24
	movl	$0, %edx
	jle	L36
	.p2align 4,,10
L31:
	movl	%eax, %ebx
	movl	%edx, %edi
	andl	$1, %ebx
	movl	%ebx, 32(%esp,%edx,4)
	addl	$1, %edx
	sarl	%eax
	jne	L31
	movl	$LC24, (%esp)
	movl	$0, 28(%esp)
	leal	28(%esp,%edi,4), %edi
	call	_printf
	jmp	L30
	.p2align 4,,10
L37:
	movl	(%edi), %ebx
	subl	$4, %edi
L30:
	movl	%ebx, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	cmpl	%edi, %esi
	jne	L37
L29:
	movl	$10, (%esp)
	call	_putchar
	addl	$160, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
L24:
	movl	$LC23, (%esp)
	call	_puts
	addl	$160, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
L36:
	movl	$LC24, (%esp)
	call	_printf
	jmp	L29
	.section .rdata,"dr"
LC25:
	.ascii "Hexadecimal: 0\0"
LC26:
	.ascii "Hexadecimal: \0"
	.text
	.p2align 4,,15
	.globl	_decimal_to_hexadecimal
	.def	_decimal_to_hexadecimal;	.scl	2;	.type	32;	.endef
_decimal_to_hexadecimal:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$80, %esp
	movl	$LC22, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	$LC13, (%esp)
	movl	%eax, 4(%esp)
	call	_scanf
	movl	28(%esp), %eax
	cmpl	$0, %eax
	je	L47
	movl	$858927408, 32(%esp)
	movl	$926299444, 36(%esp)
	movl	$1111570744, 40(%esp)
	movl	$1178944579, 44(%esp)
	jle	L41
	xorl	%edx, %edx
	.p2align 4,,10
L42:
	movl	%eax, %ecx
	sarl	$4, %eax
	movl	%edx, %esi
	andl	$15, %ecx
	movsbl	32(%esp,%ecx), %ebx
	movb	%bl, 48(%esp,%edx)
	addl	$1, %edx
	testl	%eax, %eax
	jne	L42
	movl	$LC26, (%esp)
	movl	$0, 28(%esp)
	leal	47(%esp,%esi), %esi
	call	_printf
	leal	47(%esp), %edi
	jmp	L44
	.p2align 4,,10
L48:
	movsbl	(%esi), %ebx
	subl	$1, %esi
L44:
	movl	%ebx, (%esp)
	call	_putchar
	cmpl	%edi, %esi
	jne	L48
L43:
	movl	$10, (%esp)
	call	_putchar
	addl	$80, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
L47:
	movl	$LC25, (%esp)
	call	_puts
	addl	$80, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
L41:
	movl	$LC26, (%esp)
	call	_printf
	jmp	L43
	.section .rdata,"dr"
LC27:
	.ascii "Enter the first string: \0"
LC28:
	.ascii "%s\0"
LC29:
	.ascii "Enter the second string: \0"
LC30:
	.ascii "Concatenated string: %s\12\0"
	.text
	.p2align 4,,15
	.globl	_concatenate_strings
	.def	_concatenate_strings;	.scl	2;	.type	32;	.endef
_concatenate_strings:
	pushl	%esi
	pushl	%ebx
	subl	$228, %esp
	leal	24(%esp), %ebx
	movl	$LC27, (%esp)
	leal	74(%esp), %esi
	call	_printf
	movl	%ebx, 4(%esp)
	movl	$LC28, (%esp)
	call	_scanf
	movl	$LC29, (%esp)
	call	_printf
	movl	%esi, 4(%esp)
	movl	$LC28, (%esp)
	call	_scanf
	movl	%ebx, 4(%esp)
	leal	124(%esp), %ebx
	movl	%ebx, (%esp)
	call	_strcpy
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	_strcat
	movl	%ebx, 4(%esp)
	movl	$LC30, (%esp)
	call	_printf
	addl	$228, %esp
	popl	%ebx
	popl	%esi
	ret
	.section .rdata,"dr"
LC31:
	.ascii "%s > %s\0"
LC32:
	.ascii "%s < %s\0"
LC33:
	.ascii "Strings are equal\0"
	.text
	.p2align 4,,15
	.globl	_compare_strings
	.def	_compare_strings;	.scl	2;	.type	32;	.endef
_compare_strings:
	pushl	%esi
	pushl	%ebx
	subl	$132, %esp
	leal	28(%esp), %ebx
	movl	$LC27, (%esp)
	leal	78(%esp), %esi
	call	_printf
	movl	%ebx, 4(%esp)
	movl	$LC28, (%esp)
	call	_scanf
	movl	$LC29, (%esp)
	call	_printf
	movl	%esi, 4(%esp)
	movl	$LC28, (%esp)
	call	_scanf
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	_strcmp
	cmpl	$0, %eax
	jg	L56
	jne	L57
	movl	$LC33, (%esp)
	call	_printf
	addl	$132, %esp
	popl	%ebx
	popl	%esi
	ret
	.p2align 4,,10
L56:
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	addl	$132, %esp
	popl	%ebx
	popl	%esi
	ret
	.p2align 4,,10
L57:
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	$LC32, (%esp)
	call	_printf
	addl	$132, %esp
	popl	%ebx
	popl	%esi
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC34:
	.ascii "Input 'h' for help\0"
LC35:
	.ascii "\12Select command: \0"
LC36:
	.ascii " %c\0"
LC37:
	.ascii "Exiting the program.\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	andl	$-16, %esp
	subl	$32, %esp
	leal	31(%esp), %ebx
	call	___main
	movl	$LC34, (%esp)
	call	_printf
	.p2align 4,,10
L75:
	movl	$LC35, (%esp)
	call	_printf
	movl	%ebx, 4(%esp)
	movl	$LC36, (%esp)
	call	_scanf
	movzbl	31(%esp), %eax
	subl	$48, %eax
	cmpb	$65, %al
	ja	L75
	movzbl	%al, %eax
	jmp	*L62(,%eax,4)
	.section .rdata,"dr"
	.align 4
L62:
	.long	L61
	.long	L63
	.long	L64
	.long	L65
	.long	L66
	.long	L67
	.long	L68
	.long	L69
	.long	L70
	.long	L71
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L72
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L75
	.long	L73
	.section	.text.startup,"x"
	.p2align 4,,10
L73:
	movl	$LC37, (%esp)
	call	_printf
	xorl	%eax, %eax
	movl	-4(%ebp), %ebx
	leave
	ret
	.p2align 4,,10
L72:
	call	_help
	jmp	L75
	.p2align 4,,10
L71:
	call	_compare_strings
	jmp	L75
	.p2align 4,,10
L70:
	call	_concatenate_strings
	jmp	L75
	.p2align 4,,10
L69:
	call	_decimal_to_hexadecimal
	jmp	L75
	.p2align 4,,10
L68:
	call	_decimal_to_binary
	jmp	L75
	.p2align 4,,10
L67:
	movl	$1, (%esp)
	call	_generate_rand
	jmp	L75
	.p2align 4,,10
L66:
	call	_div_two_numbers
	jmp	L75
	.p2align 4,,10
L65:
	call	_mul_two_numbers
	jmp	L75
	.p2align 4,,10
L64:
	call	_sub_two_numbers
	jmp	L75
	.p2align 4,,10
L63:
	call	_add_two_numbers
	jmp	L75
	.p2align 4,,10
L61:
	movl	$10, (%esp)
	call	_generate_rand
	jmp	L75
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef