	.file	"lab_5.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Input 'h' for help\0"   # Prompt for help input
LC1:
	.ascii "\12Select command: \0"  # Prompt for command selection
LC2:
	.ascii " %c\0"                  # Format string for reading a character
LC3:
	.ascii "Exiting the program.\0" # Exit message
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
	call	_printf                  # Display help prompt
L18:
	movl	$LC1, (%esp)
	call	_printf                  # Display command selection prompt
	leal	31(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf                   # Read user input
	movzbl	31(%esp), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$65, %eax
	ja	L20                       # Jump to appropriate command
	movl	L4(,%eax,4), %eax
	jmp	*%eax                     # Jump to the selected command
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
	...
	.long	L14
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
	call	_generate_rand          # Command: Generate 10 random numbers
	jmp	L16
L5:
	call	_add_two_numbers        # Command: Add two numbers
	jmp	L16
L6:
	call	_sub_two_numbers        # Command: Subtract two numbers
	jmp	L16
L7:
	call	_mul_two_numbers        # Command: Multiply two numbers
	jmp	L16
L8:
	call	_div_two_numbers        # Command: Divide two numbers
	jmp	L16
L9:
	movl	$1, (%esp)
	call	_generate_rand          # Command: Generate random number
	jmp	L16
L10:
	call	_decimal_to_binary      # Command: Convert decimal to binary
	jmp	L16
L11:
	call	_decimal_to_hexadecimal # Command: Convert decimal to hexadecimal
	jmp	L16
L12:
	call	_concatenate_strings    # Command: Concatenate two strings
	jmp	L16
L13:
	call	_compare_strings        # Command: Compare two strings
	jmp	L16
L14:
	call	_help                   # Command: Display help
	jmp	L16
L15:
	movl	$LC3, (%esp)
	call	_printf                  # Command: Exit program
	movl	$0, %eax
	jmp	L19
L20:
	nop                            # Placeholder for invalid command
L16:
	jmp	L18                       # Loop back to command selection
L19:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
	.align 4
LC4:                               # Array of jump targets for each command
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
	...
	.long	L14
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L20
	.long	L15
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
	call	_puts                    # Display help menu
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
	.ascii "%d \0"                   # Format string for integers
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
	call	_time                    # Seed random number generator with current time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, -12(%ebp)
	jmp	L23
L24:
	call	_rand                    # Generate a random number
	movl	%eax, %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	5(%edx,%eax), %eax
	movl	%eax, -20(%ebp)
	decl	-12(%ebp)
L23:
	cmpl	$0, -12(%ebp)
	jg	L24
	movl	-20(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
	.align 4
LC16:                               # Format string for adding two numbers
	.ascii "%d + %d = %d\12\0"
LC17:                               # Format string for subtracting two numbers
	.ascii "%d - %d = %d\12\0"
LC18:                               # Format string for multiplying two numbers
	.ascii "%d * %d = %d\12\0"
LC19:                               # Format string for dividing two numbers
	.ascii "%d / %d = %d\12\0"
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
	subl	$48, %esp
	leal	20(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf                   # Read first number
	leal	20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf                   # Read second number
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, 12(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC16, %eax
	call	_printf                  # Print the result
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC20:                               # Format string for division by zero error
	.ascii "Error: Division by zero!\12\0"
	.text
	.globl	_div_two_numbers
	.def	_div_two_numbers;	.scl	2;	.type	32;	.endef
_div_two_numbers:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$48, %esp
	leal	20(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_scanf                   # Read first number
	leal	20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_scanf                   # Read second number
	movl	20(%ebp), %edx
	cmpl	$0, %edx
	jne	L27
	movl	$LC20, (%esp)
	call	_puts                    # Handle division by zero error
	jmp	L28
L27:
	movl	16(%ebp), %eax
	cltd
	idivl	%edx
	movl	%eax, 12(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC19, %eax
	call	_printf                  # Print the result
L28:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC21:                               # Format string for binary output
	.ascii "Binary equivalent: %s\12\0"
LC22:                               # Format string for hexadecimal output
	.ascii "Hexadecimal equivalent: %s\12\0"
LC23:                               # Array to store binary digits
	.ascii "0000000000\0"
	.text
	.globl	_decimal_to_binary
	.def	_decimal_to_binary;	.scl	2;	.type	32;	.endef
_decimal_to_binary:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	leal	30(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$10, 4(%esp)
	movl	$0, (%esp)
	call	_scanf                   # Read decimal number
	movl	30(%ebp), %edx
	movl	$10, %ecx
	movl	$0, %ebx
L32:
	xorl	%eax, %eax
	divl	%ecx
	addb	$48, %dl
	movb	%dl, (%ebx,%edx)
	incl	%ebx
	testl	%eax, %eax
	jne	L32
	movb	$0, (%ebx)
	leal	30(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC21, (%esp)
	call	_printf                  # Print binary equivalent
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
LC24:                               # Array to store hexadecimal digits
	.ascii "00000000\0"
	.text
	.globl	_decimal_to_hexadecimal
	.def	_decimal_to_hexadecimal;	.scl	2;	.type	32;	.endef
_decimal_to_hexadecimal:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$48, %esp
	leal	28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$10, 4(%esp)
	movl	$0, (%esp)
	call	_scanf                   # Read decimal number
	movl	28(%ebp), %edx
	movl	$16, %ecx
	movl	$0, %ebx
L36:
	xorl	%eax, %eax
	divl	%ecx
	cmpl	$9, %edx
	jle	L37
	addb	$55, %dl
L37:
	addb	$48, %dl
	movb	%dl, (%ebx,%edx)
	incl	%ebx
	testl	%eax, %eax
	jne	L36
	movb	$0, (%ebx)
	leal	28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC22, (%esp)
	call	_printf                  # Print hexadecimal equivalent
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC25:                               # Error message for negative numbers
	.ascii "Error: Input must be a positive integer\12\0"
	.text
	.globl	_decimal_to_binary
	.globl	_decimal_to_hexadecimal
	.globl	_validate_positive
	.def	_validate_positive;	.scl	2;	.type	32;	.endef
_validate_positive:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	cmpl	$0, %eax
	jg	L41
	movl	$LC25, (%esp)
	call	_puts                    # Handle negative number error
	call	_exit
L41:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
	.align 4
LC26:                               # Format string for menu
	.ascii "Menu\121. Add\12y. Subtract\12/ . Multiply\12/ . Divide\12o. Decimal to binary\12x. Decimal to hexadecimal\12q. Quit\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
L42:
	movl	$LC26, %eax
	movl	%eax, 4(%esp)
	call	_printf                  # Display menu
	leal	-9(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__imp__getch, %eax
	call	_call                    # Read menu option
	movsbl	%al, %eax
	cmpb	$121, %al
	je	L45
	cmpb	$121, %al
	jne	L43
L46:
	leal	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_printf                  # Subtract two numbers
	jmp	L42
L45:
	leal	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_printf                  # Add two numbers
	jmp	L42
L43:
	cmpb	$47, %al
	jne	L47
L49:
	leal	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC18, (%esp)
	call	_printf                  # Multiply two numbers
	jmp	L42
L47:
	cmpb	$47, %al
	jne	L50
L52:
	leal	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_printf                  # Divide two numbers
	jmp	L42
L50:
	cmpb	$111, %al
	jne	L53
L55:
	leal	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__imp__system, %eax
	call	_call                    # Convert decimal to binary
	jmp	L42
L53:
	cmpb	$120, %al
	jne	L56
L58:
	leal	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__imp__system, %eax
	call	_call                    # Convert decimal to hexadecimal
	jmp	L42
L56:
	cmpb	$113, %al
	jne	L59
L61:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
L59:
	cmpb	$113, %al
	jne	L42
	jmp	L46
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC27:                               # Format string for "getch" function call
	.ascii "%c\0"
	.section	.pdata
	.align 4
	.rva	.LP37
	.rva	.LP38
	.rva	.LP39
	.rva	.LP40
	.text
	.align 4
.LP37:
	.def	_call;	.scl	2;	.type	32;	.endef
	call:
LFB38:
	.cfi_startproc
	movl	8(%esp), %ecx
	jmp	*%ecx
	.cfi_endproc
LFE38:
	.align 4
.LP38:
	.def	_puts;	.scl	2;	.type	32;	.endef
	puts:
LFB39:
	.cfi_startproc
	movl	8(%esp), %ecx
	jmp	*%ecx
	.cfi_endproc
LFE39:
	.align 4
.LP39:
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
_scanf:
LFB40:
	.cfi_startproc
	movl	8(%esp), %ecx
	jmp	*%ecx
	.cfi_endproc
LFE40:
	.align 4
.LP40:
	.def	_exit;	.scl	2;	.type	32;	.endef
	exit:
LFB41:
	.cfi_startproc
	movl	8(%esp), %ecx
	jmp	*%ecx
	.cfi_endproc
LFE41:
	.section .eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0x0
	.byte	0x1
	.string	""
	.byte	0x1
	.long	.LASF1-.Lframe1
	.byte	0xc
	.byte	0x4
	.byte	0x88
	.byte	0x4
	.byte	0x8
	.byte	0x8
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 4
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.long	.LFB18
	.long	.LFE18-.LFB18
	.byte	0x4
	.long	.LCFI0-.LFB18
	.byte	0xc
	.long	.LCFI1-.LCFI0
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB19
	.long	.LFE19-.LFB19
	.byte	0x4
	.long	.LCFI2-.LFB19
	.byte	0xc
	.long	.LCFI3-.LCFI2
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB20
	.long	.LFE20-.LFB20
	.byte	0x4
	.long	.LCFI4-.LFB20
	.byte	0xc
	.long	.LCFI5-.LCFI4
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB21
	.long	.LFE21-.LFB21
	.byte	0x4
	.long	.LCFI6-.LFB21
	.byte	0xc
	.long	.LCFI7-.LCFI6
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB22
	.long	.LFE22-.LFB22
	.byte	0x4
	.long	.LCFI8-.LFB22
	.byte	0xc
	.long	.LCFI9-.LCFI8
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB23
	.long	.LFE23-.LFB23
	.byte	0x4
	.long	.LCFI10-.LFB23
	.byte	0xc
	.long	.LCFI11-.LCFI10
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB24
	.long	.LFE24-.LFB24
	.byte	0x4
	.long	.LCFI12-.LFB24
	.byte	0xc
	.long	.LCFI13-.LCFI12
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB25
	.long	.LFE25-.LFB25
	.byte	0x4
	.long	.LCFI14-.LFB25
	.byte	0xc
	.long	.LCFI15-.LCFI14
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB27
	.long	.LFE27-.LFB27
	.byte	0x4
	.long	.LCFI16-.LFB27
	.byte	0xc
	.long	.LCFI17-.LCFI16
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB38
	.long	.LFE38-.LFB38
	.byte	0x4
	.long	.LCFI18-.LFB38
	.byte	0xc
	.long	.LCFI19-.LCFI18
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB39
	.long	.LFE39-.LFB39
	.byte	0x4
	.long	.LCFI20-.LFB39
	.byte	0xc
	.long	.LCFI21-.LCFI20
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB40
	.long	.LFE40-.LFB40
	.byte	0x4
	.long	.LCFI22-.LFB40
	.byte	0xc
	.long	.LCFI23-.LCFI22
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	.LFB41
	.long	.LFE41-.LFB41
	.byte	0x4
	.long	.LCFI24-.LFB41
	.byte	0xc
	.long	.LCFI25-.LCFI24
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.long	0x0
	.byte	0x0
	.align 4
.LEFDE1:
	.section	.debug_frame
	.long	0xffffffff
	.long	0x0
	.byte	0x0
	.align 4
