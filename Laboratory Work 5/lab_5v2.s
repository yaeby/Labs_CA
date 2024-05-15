# Define section for read-only data
.section .rodata

# String constants
LC_HELP_PROMPT:
    .ascii "Input 'h' for help\0"
LC_COMMAND_PROMPT:
    .ascii "\12Select command: \0"
LC_COMMAND_INPUT:
    .ascii " %c\0"
LC_EXIT_MESSAGE:
    .ascii "Exiting the program.\0"

# Help menu strings
HELP_MENU:
    .ascii "0. Generate 10 random numbers between 1 and 55\0"
    .ascii "1. Add two numbers\0"
    .ascii "2. Subtract two numbers\0"
    .ascii "3. Multiply two numbers\0"
    .ascii "4. Divide two numbers\0"
    .ascii "5. Generate random number\0"
    .ascii "6. Decimal to binary\0"
    .ascii "7. Decimal to hexadecimal\0"
    .ascii "8. Concatenate two strings\0"
    .ascii "9. Compare two strings\0"
    .ascii "q. Exit the program\0"

# Format strings
FMT_DECIMAL_INPUT:
    .ascii "%d \0"
FMT_DECIMAL_OUTPUT:
    .ascii "%d\0"
FMT_SUM_OUTPUT:
    .ascii "Sum: %d\12\0"
FMT_DIFFERENCE_OUTPUT:
    .ascii "Difference: %d\12\0"
FMT_PRODUCT_OUTPUT:
    .ascii "Product: %d\12\0"
FMT_QUOTIENT_OUTPUT:
    .ascii "Quotient: %d\12\0"
FMT_DIVIDE_BY_ZERO_ERROR:
    .ascii "Error: Division by zero.\0"
FMT_BINARY_OUTPUT:
    .ascii "Binary: \0"
FMT_HEXADECIMAL_OUTPUT:
    .ascii "Hexadecimal: \0"
FMT_CONCATENATED_STRING_OUTPUT:
    .ascii "Concatenated string: %s\12\0"
FMT_STRING_COMPARISON_OUTPUT:
    .ascii "%s > %s\0"
    .ascii "%s < %s\0"
    .ascii "Strings are equal\0"

.section .text

# Entry point
.globl _main
_main:
    # Function prologue
    pushl %ebp
    movl %esp, %ebp
    subl $32, %esp
    
    # Display help prompt
    movl $LC_HELP_PROMPT, %eax
    call _printf
    
    # Display command prompt
    movl $LC_COMMAND_PROMPT, %eax
    call _printf
    
main_loop:
    # Read command input
    leal 31(%esp), %eax
    movl %eax, 4(%esp)
    movl $LC_COMMAND_INPUT, (%esp)
    call _scanf
    
    # Convert input character to index
    movzbl 31(%esp), %eax
    movsbl %al, %eax
    subl $48, %eax
    
    # Jump table for commands
    cmpl $65, %eax
    ja unknown_command
    jmp *L4(,%eax,4)

unknown_command:
    nop
    jmp main_loop
    
# Function to display help menu
_help:
    # Display help menu
    movl $HELP_MENU, %eax
    call _display_menu
    ret

# Function to generate 10 random numbers
_generate_rand:
    # Generate and display random numbers
    call _display_random_numbers
    ret

# Function to add two numbers
_add_two_numbers:
    # Add two numbers and display the result
    call _perform_addition
    ret

# Function to subtract two numbers
_sub_two_numbers:
    # Subtract two numbers and display the result
    call _perform_subtraction
    ret

# Function to multiply two numbers
_mul_two_numbers:
    # Multiply two numbers and display the result
    call _perform_multiplication
    ret

# Function to divide two numbers
_div_two_numbers:
    # Divide two numbers and display the result
    call _perform_division
    ret

# Function to convert decimal to binary
_decimal_to_binary:
    # Convert decimal to binary and display the result
    call _convert_to_binary
    ret

# Function to convert decimal to hexadecimal
_decimal_to_hexadecimal:
    # Convert decimal to hexadecimal and display the result
    call _convert_to_hexadecimal
    ret

# Function to concatenate two strings
_concatenate_strings:
    # Concatenate two strings and display the result
    call _perform_string_concatenation
    ret

# Function to compare two strings
_compare_strings:
    # Compare two strings and display the result
    call _perform_string_comparison
    ret

# Helper functions...

# Function to display a menu
_display_menu:
    pushl %ebp
    movl %esp, %ebp
    subl $24, %esp
    
    # Loop through menu items and display each
    movl %eax, %ecx
    .menu_loop:
        movl (%ecx), %eax
        call _puts
        addl $4, %ecx
        cmpl $LC14, %eax
        jne .menu_loop
    
    nop
    leave
    ret

# Function to display 10 random numbers
_display_random_numbers:
    pushl %ebp
    movl %esp, %ebp
    subl $40, %esp
    
    # Generate and display 10 random numbers
    movl $10, (%esp)
    call _generate_and_display_random_numbers
    
    movl $10, (%esp)
    call _putchar
    
    nop
    leave
    ret

# Function to generate and display 10 random numbers
_generate_and_display_random_numbers:
    pushl %ebp
    movl %esp, %ebp
    subl $12, %esp
    
    # Seed the random number generator
    call _seed_random_number_generator
    
    # Loop to generate and display 10 random numbers
    movl $0, -4(%ebp)
    .rand_loop:
        call _generate_random_number
        movl %eax, %ecx
        call _format_and_display_random_number
        incl -4(%ebp)
        cmpl $10, -4(%ebp)
        jl .rand_loop
    
    nop
    leave
    ret

# Function to seed the random number generator
_seed_random_number_generator:
    pushl %ebp
    movl %esp, %ebp
    subl $8, %esp
    
    # Seed the random number generator with current time
    call _time
    movl %eax, (%esp)
    call _srand
    
    nop
    leave
    ret

# Function to generate a random number
_generate_random_number:
    pushl %ebp
    movl %esp, %ebp
    subl $16, %esp
    
    # Generate a random number and return it
    call _rand
    movl %eax, -4(%ebp)
    
    nop
    leave
    ret

# Function to format and display a random number
_format_and_display_random_number:
    pushl %ebp
    movl %esp, %ebp
    subl $8, %esp
    
    # Format and display the random number
    movl -4(%ebp), %eax
    imull $56, %eax
    addl $1, %eax
    movl %eax, 4(%esp)
    movl $FMT_DECIMAL_OUTPUT, (%esp)
    call _printf
    
    nop
    leave
    ret

# Other helper functions...

# End of the program
_exit_program:
    pushl %ebp
    movl %esp, %ebp
    subl $8, %esp
    
    # Display exit message and return
    movl $LC_EXIT_MESSAGE, (%esp)
    call _puts
    
    movl $0, %eax
    leave
    ret