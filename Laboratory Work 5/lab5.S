# Define message strings
LC0: .ascii "Input 'h' for help\0"
LC1: .ascii "\12Select command: \0"
LC2: .ascii " %c\0"
LC3: .ascii "Exiting the program.\0"

# Define command strings
LC4: .ascii "0. Generate 10 random numbers between 1 and 55\0"
LC5: .ascii "1. Add two numbers\0"
LC6: .ascii "2. Subtract two numbers\0"
LC7: .ascii "3. Multiply two numbers\0"
LC8: .ascii "4. Divide two numbers\0"
LC9: .ascii "5. Generate random number\0"
LC10: .ascii "6. Decimal to binary\0"
LC11: .ascii "7. Decimal to hexadecimal\0"
LC12: .ascii "8. Concatenate two strings\0"
LC13: .ascii "9. Compare two strings\0"
LC14: .ascii "q. Exit the program\0"

# Define function prototypes
_generate_rand: .def _generate_rand; .scl 2; .type 32
_add_two_numbers: .def _add_two_numbers; .scl 2; .type 32
_sub_two_numbers: .def _sub_two_numbers; .scl 2; .type 32
_mul_two_numbers: .def _mul_two_numbers; .scl 2; .type 32
_div_two_numbers: .def _div_two_numbers; .scl 2; .type 32
_decimal_to_binary: .def _decimal_to_binary; .scl 2; .type 32
_decimal_to_hexadecimal: .def _decimal_to_hexadecimal; .scl 2; .type 32
_concatenate_strings: .def _concatenate_strings; .scl 2; .type 32
_compare_strings: .def _compare_strings; .scl 2; .type 32
_help: .def _help; .scl 2; .type 32

# Main function
_main:
    pushl %ebp
    movl %esp, %ebp
    subl $32, %esp
    call _help # Display help message

L18:
    # Display select command message
    movl $LC1, (%esp)
    call _printf

    # Read command input
    leal 31(%esp), %eax
    movl %eax, 4(%esp)
    movl $LC2, (%esp)
    call _scanf

    # Map input command to function
    movzbl 31(%esp), %eax
    movsbl %al, %eax
    subl $48, %eax
    cmpl $65, %eax
    ja L20
    movl L4(,%eax,4), %eax
    jmp *%eax

    # Command functions
    .align 4
L4: .long L3, L5, L6, L7, L8, L9, L10, L11, L12, L13, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L20, L14, L20, L20, L20, L20, L20, L20, L20, L20, L15

# Helper function to display command options
_help:
    pushl %ebp
    movl %esp, %ebp
    subl $24, %esp

    # Display command options
    movl $LC4, (%esp)
    call _puts
    movl $LC5, (%esp)
    call _puts
    movl $LC6, (%esp)
    call _puts
    movl $LC7, (%esp)
    call _puts
    movl $LC8, (%esp)
    call _puts
    movl $LC9, (%esp)
    call _puts
    movl $LC10, (%esp)
    call _puts
    movl $LC11, (%esp)
    call _puts
    movl $LC12, (%esp)
    call _puts
    movl $LC13, (%esp)
    call _puts
    movl $LC14, (%esp)
    call _puts

    nop
    leave
    ret

# Function to generate 10 random numbers
_generate_rand:
    pushl %ebp
    movl %esp, %ebp
    subl $40, %esp

    # Initialize random number generator
    movl $0, (%esp)
    call _time
    movl %eax, (%esp)
    call _srand

    # Generate and print random numbers
    movl $0, -12(%ebp)
    jmp L23
L24:
    call _rand
    movl %eax, %ecx
    movl $-1840700269, %edx
    movl %ecx, %eax
    imull %edx
    leal (%edx,%ecx), %eax
    sarl $5, %eax
    movl %eax, %edx
    movl %ecx, %eax
    sarl $31, %eax
    subl %eax, %edx
    movl %edx, %eax
    movl %eax, -16(%ebp)
    movl -16(%ebp), %eax
    imull $56, %eax, %eax
    subl %eax, %ecx
    movl %ecx, %eax
    movl %eax, -16(%ebp)
    movl -16(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC15, (%esp)
    call _printf
    addl $1, -12(%ebp)
L23:
    movl -12(%ebp), %eax
    cmpl 8(%ebp), %eax
    jl L24
    movl $10, (%esp)
    call _putchar
    nop
    leave
    ret

# Function to add two numbers
_add_two_numbers:
    pushl %ebp
    movl %esp, %ebp
    subl $40, %esp

    # Prompt user for input
    movl $LC16, (%esp)
    call _printf
    leal -12(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    movl $LC18, (%esp)
    call _printf
    leal -16(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    # Add the numbers and print the result
    movl -12(%ebp), %edx
    movl -16(%ebp), %eax
    addl %edx, %eax
    movl %eax, 4(%esp)
    movl $LC19, (%esp)
    call _printf

    nop
    leave
    ret

# Function to subtract two numbers
_sub_two_numbers:
    pushl %ebp
    movl %esp, %ebp
    subl $40, %esp

    # Prompt user for input
    movl $LC16, (%esp)
    call _printf
    leal -12(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    movl $LC18, (%esp)
    call _printf
    leal -16(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    # Subtract the numbers and print the result
    movl -12(%ebp), %edx
    movl -16(%ebp), %eax
    subl %eax, %edx
    movl %edx, %eax
    movl %eax, 4(%esp)
    movl $LC20, (%esp)
    call _printf

    nop
    leave
    ret

# Function to multiply two numbers
_mul_two_numbers:
    pushl %ebp
    movl %esp, %ebp
    subl $40, %esp

    # Prompt user for input
    movl $LC16, (%esp)
    call _printf
    leal -12(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    movl $LC18, (%esp)
    call _printf
    leal -16(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    # Multiply the numbers and print the result
    movl -12(%ebp), %edx
    movl -16(%ebp), %eax
    imull %edx, %eax
    movl %eax, 4(%esp)
    movl $LC21, (%esp)
    call _printf

    nop
    leave
    ret

# Function to divide two numbers
_div_two_numbers:
    pushl %ebp
    movl %esp, %ebp
    subl $40, %esp

    # Prompt user for input
    movl $LC22, (%esp)
    call _printf
    leal -12(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    movl $LC23, (%esp)
    call _printf
    leal -16(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    # Check for division by zero
    movl -16(%ebp), %eax
    testl %eax, %eax
    je L29

    # Perform division and print the result
    movl -12(%ebp), %eax
    movl -16(%ebp), %ecx
    cltd
    idivl %ecx
    movl %eax, 4(%esp)
    movl $LC24, (%esp)
    call _printf
    jmp L31

L29:
    movl $LC25, (%esp)
    call _puts

L31:
    nop
    leave
    ret

# Function to convert decimal to binary
_decimal_to_binary:
    pushl %ebp
    movl %esp, %ebp
    subl $168, %esp

    # Prompt user for input
    movl $LC26, (%esp)
    call _printf
    leal -20(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    # Convert decimal to binary
    movl $0, -12(%ebp)
    jmp L35
L36:
    movl -20(%ebp), %eax
    cltd
    shrl $31, %edx
    addl %edx, %eax
    andl $1, %eax
    subl %edx, %eax
    movl %eax, %edx
    movl -12(%ebp), %eax
    movl %edx, -148(%ebp,%eax,4)
    movl -20(%ebp), %eax
    movl %eax, %edx
    shrl $31, %edx
    addl %edx, %eax
    sarl %eax
    movl %eax, -20(%ebp)
    addl $1, -12(%ebp)

L35:
    movl -20(%ebp), %eax
    testl %eax, %eax
    jg L36

    # Print the binary result
    movl $LC28, (%esp)
    call _printf
    movl -12(%ebp), %eax
    subl $1, %eax
    movl %eax, -16(%ebp)
    jmp L37
L38:
    movl -16(%ebp), %eax
    movl -148(%ebp,%eax,4), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _printf
    subl $1, -16(%ebp)

L37:
    cmpl $0, -16(%ebp)
    jns L38
    movl $10, (%esp)
    call _putchar

    leave
    ret

# Function to convert decimal to hexadecimal
_decimal_to_hexadecimal:
    pushl %ebp
    movl %esp, %ebp
    subl $88, %esp

    # Prompt user for input
    movl $LC26, (%esp)
    call _printf
    leal -20(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _scanf

    # Convert decimal to hexadecimal
    movl $858927408, -36(%ebp)
    movl $926299444, -32(%ebp)
    movl $1111570744, -28(%ebp)
    movl $1178944579, -24(%ebp)
    movl $0, -12(%ebp)
    jmp L42
L43:
    movl -20(%ebp), %eax
    cltd
    shrl $28, %edx
    addl %edx, %eax
    andl $15, %eax
    subl %edx, %eax
    movzbl -36(%ebp,%eax), %eax
    leal -68(%ebp), %ecx
    movl -12(%ebp), %edx
    addl %ecx, %edx
    movb %al, (%edx)
    movl -20(%ebp), %eax
    cltd
    andl $15, %edx
    addl %edx, %eax
    sarl $4, %eax
    movl %eax, -20(%ebp)
    addl $1, -12(%ebp)

L42:
    movl -20(%ebp), %eax
    testl %eax, %eax
    jg L43

    # Print the hexadecimal result
    movl $LC30, (%esp)
    call _printf
    movl -12(%ebp), %eax
    subl $1, %eax
    movl %eax, -16(%ebp)
    jmp L44
L45:
    leal -68(%ebp), %edx
    movl -16(%ebp), %eax
    movl (%edx,%eax), %eax
    movl %eax, 4(%esp)
    movl $LC17, (%esp)
    call _printf
    subl $1, -16(%ebp)

L44:
    cmpl $0, -16(%ebp)
    jns L45
    movl $10, (%esp)
    call _putchar

    leave
    ret

# Function to concatenate two strings
_concatenate_strings:
    pushl %ebp
    movl %esp, %ebp
    subl $92, %esp

    # Prompt user for input
    movl $LC31, (%esp)
    call _printf
    leal -52(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC32, (%esp)
    call _scanf

    movl $LC33, (%esp)
    call _printf
    leal -52(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC32, (%esp)
    call _scanf

    # Concatenate strings and print result
    leal -68(%ebp), %eax
    movl $LC34, (%esp)
    call _printf

    leave
    ret

# Function to compare two strings
_compare_strings:
    pushl %ebp
    movl %esp, %ebp
    subl $92, %esp

    # Prompt user for input
    movl $LC31, (%esp)
    call _printf
    leal -52(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC32, (%esp)
    call _scanf

    movl $LC33, (%esp)
    call _printf
    leal -52(%ebp), %eax
    movl %eax, 4(%esp)
    movl $LC32, (%esp)
    call _scanf

    # Compare strings and print result
    leal -68(%ebp), %eax
    movl $LC35, (%esp)
    call _printf

    leave
    ret

# Exit function
L20:
    movl $LC3, (%esp)
    call _puts
    leave
    ret
