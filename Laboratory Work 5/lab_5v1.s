	.file	"lab_5.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Input 'h' for help\0"
LC1:
	.ascii "\12Select command: \0"
LC2:
	.ascii " %c\0"
LC3:
	.ascii "Exiting the program.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
L18:
	movl	$LC1, (%esp)
	call	_printf
	leal	31(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movzbl	31(%esp), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$65, %eax
	ja	L20
	movl	L4(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L4:
	.long	L3
	.long	L5
	.long	L6
	.long	L7
	.long	L8
	.long	L9
	.long	L10
	.long	L11
	.long	L12
	.long	L13
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L14
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L15
	.text
L3:
	movl	$10, (%esp)
	call	_generate_rand
	jmp	L16
L5:
	call	_add_two_numbers
	jmp	L16
L6:
	call	_sub_two_numbers
	jmp	L16
L7:
	call	_mul_two_numbers
	jmp	L16
L8:
	call	_div_two_numbers
	jmp	L16
L9:
	movl	$1, (%esp)
	call	_generate_rand
	jmp	L16
L10:
	call	_decimal_to_binary
	jmp	L16
L11:
	call	_decimal_to_hexadecimal
	jmp	L16
L12:
	call	_concatenate_strings
	jmp	L16
L13:
	call	_compare_strings
	jmp	L16
L14:
	call	_help
	jmp	L16
L15:
	movl	$LC3, (%esp)
	call	_printf
	movl	$0, %eax
	jmp	L19
L20:
	nop
L16:
	jmp	L18
L19:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
	.align 4
LC4:
	.ascii "0. Generate 10 random numbers between 1 and 55\0"
LC5:
	.ascii "1. Add two numbers\0"
LC6:
	.ascii "2. Subtract two numbers\0"
LC7:
	.ascii "3. Multiply two numbers\0"
LC8:
	.ascii "4. Divide two numbers\0"
LC9:
	.ascii "5. Generate random number\0"
LC10:
	.ascii "6. Decimal to binary\0"
LC11:
	.ascii "7. Decimal to hexadecimal\0"
LC12:
	.ascii "8. Concatenate two strings\0"
LC13:
	.ascii "9. Compare two strings\0"
LC14:
	.ascii "q. Exit the program\0"
	.text
	.globl	_help
	.def	_help;	.scl	2;	.type	32;	.endef
_help:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
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
	movl	$LC11, (%esp)
	call	_puts
	movl	$LC12, (%esp)
	call	_puts
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC15:
	.ascii "%d \0"
	.text
	.globl	_generate_rand
	.def	_generate_rand;	.scl	2;	.type	32;	.endef
_generate_rand:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, -12(%ebp)
	jmp	L23
L24:
	call	_rand
	movl	%eax, %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%edx,%ecx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	imull	$56, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L23:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L24
	movl	$10, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC16:
	.ascii "Enter the first number: \0"
LC17:
	.ascii "%d\0"
LC18:
	.ascii "Enter the second number: \0"
LC19:
	.ascii "Sum: %d\12\0"
	.text
	.globl	_add_two_numbers
	.def	_add_two_numbers;	.scl	2;	.type	32;	.endef
_add_two_numbers:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC16, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$LC18, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC20:
	.ascii "Difference: %d\12\0"
	.text
	.globl	_sub_two_numbers
	.def	_sub_two_numbers;	.scl	2;	.type	32;	.endef
_sub_two_numbers:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC16, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$LC18, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC21:
	.ascii "Product: %d\12\0"
	.text
	.globl	_mul_two_numbers
	.def	_mul_two_numbers;	.scl	2;	.type	32;	.endef
_mul_two_numbers:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC16, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$LC18, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	imull	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
LC22:
	.ascii "Enter the dividend: \0"
LC23:
	.ascii "Enter the divisor: \0"
LC24:
	.ascii "Quotient: %d\12\0"
LC25:
	.ascii "Error: Division by zero.\0"
	.text
	.globl	_div_two_numbers
	.def	_div_two_numbers;	.scl	2;	.type	32;	.endef
_div_two_numbers:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC22, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$LC23, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	-16(%ebp), %eax
	testl	%eax, %eax
	je	L29
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %ecx
	cltd
	idivl	%ecx
	movl	%eax, 4(%esp)
	movl	$LC24, (%esp)
	call	_printf
	jmp	L31
L29:
	movl	$LC25, (%esp)
	call	_puts
L31:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC26:
	.ascii "Enter a number in base 10: \0"
LC27:
	.ascii "Binary: 0\0"
LC28:
	.ascii "Binary: \0"
	.text
	.globl	_decimal_to_binary
	.def	_decimal_to_binary;	.scl	2;	.type	32;	.endef
_decimal_to_binary:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$168, %esp
	movl	$LC26, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	$0, -12(%ebp)
	movl	-20(%ebp), %eax
	testl	%eax, %eax
	jne	L35
	movl	$LC27, (%esp)
	call	_puts
	jmp	L32
L36:
	movl	-20(%ebp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, -148(%ebp,%eax,4)
	movl	-20(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%ebp)
	addl	$1, -12(%ebp)
L35:
	movl	-20(%ebp), %eax
	testl	%eax, %eax
	jg	L36
	movl	$LC28, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	L37
L38:
	movl	-16(%ebp), %eax
	movl	-148(%ebp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	subl	$1, -16(%ebp)
L37:
	cmpl	$0, -16(%ebp)
	jns	L38
	movl	$10, (%esp)
	call	_putchar
L32:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC29:
	.ascii "Hexadecimal: 0\0"
LC30:
	.ascii "Hexadecimal: \0"
	.text
	.globl	_decimal_to_hexadecimal
	.def	_decimal_to_hexadecimal;	.scl	2;	.type	32;	.endef
_decimal_to_hexadecimal:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	$LC26, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	movl	-20(%ebp), %eax
	testl	%eax, %eax
	jne	L40
	movl	$LC29, (%esp)
	call	_puts
	jmp	L39
L40:
	movl	$858927408, -36(%ebp)
	movl	$926299444, -32(%ebp)
	movl	$1111570744, -28(%ebp)
	movl	$1178944579, -24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L42
L43:
	movl	-20(%ebp), %eax
	cltd
	shrl	$28, %edx
	addl	%edx, %eax
	andl	$15, %eax
	subl	%edx, %eax
	movzbl	-36(%ebp,%eax), %eax
	leal	-68(%ebp), %ecx
	movl	-12(%ebp), %edx
	addl	%ecx, %edx
	movb	%al, (%edx)
	movl	-20(%ebp), %eax
	cltd
	andl	$15, %edx
	addl	%edx, %eax
	sarl	$4, %eax
	movl	%eax, -20(%ebp)
	addl	$1, -12(%ebp)
L42:
	movl	-20(%ebp), %eax
	testl	%eax, %eax
	jg	L43
	movl	$LC30, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	L44
L45:
	leal	-68(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_putchar
	subl	$1, -16(%ebp)
L44:
	cmpl	$0, -16(%ebp)
	jns	L45
	movl	$10, (%esp)
	call	_putchar
L39:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC31:
	.ascii "Enter the first string: \0"
LC32:
	.ascii "%s\0"
LC33:
	.ascii "Enter the second string: \0"
LC34:
	.ascii "Concatenated string: %s\12\0"
	.text
	.globl	_concatenate_strings
	.def	_concatenate_strings;	.scl	2;	.type	32;	.endef
_concatenate_strings:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$232, %esp
	movl	$LC31, (%esp)
	call	_printf
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC32, (%esp)
	call	_scanf
	movl	$LC33, (%esp)
	call	_printf
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC32, (%esp)
	call	_scanf
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-208(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcpy
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-208(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcat
	leal	-208(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC34, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC35:
	.ascii "%s > %s\0"
LC36:
	.ascii "%s < %s\0"
LC37:
	.ascii "Strings are equal\0"
	.text
	.globl	_compare_strings
	.def	_compare_strings;	.scl	2;	.type	32;	.endef
_compare_strings:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$136, %esp
	movl	$LC31, (%esp)
	call	_printf
	leal	-62(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC32, (%esp)
	call	_scanf
	movl	$LC33, (%esp)
	call	_printf
	leal	-112(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC32, (%esp)
	call	_scanf
	leal	-112(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-62(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jle	L48
	leal	-112(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-62(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	jmp	L51
L48:
	cmpl	$0, -12(%ebp)
	jns	L50
	leal	-112(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-62(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC36, (%esp)
	call	_printf
	jmp	L51
L50:
	movl	$LC37, (%esp)
	call	_printf
L51:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
