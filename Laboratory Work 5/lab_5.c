#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

void generate_rand();
void add_two_numbers();
void sub_two_numbers();
void mul_two_numbers();
void div_two_numbers();
void decimal_to_binary();
void decimal_to_hexadecimal(); 
void concatenate_strings();
void compare_strings();
void help();

int main(){
    char command;
    printf("Input 'h' for help");
    while(1){
        printf("\nSelect command: ");
        scanf(" %c", &command);
        switch (command)
        {
        case '0':
            generate_rand(10);
            break;
        case '1':
            add_two_numbers();
            break;
        case '2':
            sub_two_numbers();
            break;
        case '3':
            mul_two_numbers();
            break;
        case '4':
            div_two_numbers();
            break;
        case '5':
            generate_rand(1);
            break;
        case '6':
            decimal_to_binary();
            break;
        case '7':
            decimal_to_hexadecimal();
            break;
        case '8':
            concatenate_strings();
            break;
        case '9':
            compare_strings();
            break;
        case 'h':
            help();
            break;
        case 'q':
            printf("Exiting the program.");
            return 0;
        default:
            break;
        }
    }

    return 0;
}
void help(){
    printf("0. Generate 10 random numbers between 1 and 55\n");
    printf("1. Add two numbers\n");
    printf("2. Subtract two numbers\n");
    printf("3. Multiply two numbers\n");
    printf("4. Divide two numbers\n");
    printf("5. Generate random number\n");
    printf("6. Decimal to binary\n");
    printf("7. Decimal to hexadecimal\n");
    printf("8. Concatenate two strings\n");
    printf("9. Compare two strings\n");
    printf("q. Exit the program\n");
}

void generate_rand(int count){
    srand(time(NULL));
    
    for (int i = 0; i < count; ++i) {
        int random_number = rand() % 56;
        printf("%d ", random_number);
    }
    printf("\n");
}

void add_two_numbers(){
    int x, y;
    printf("Enter the first number: ");
    scanf("%d", &x);
    printf("Enter the second number: ");
    scanf("%d", &y);
    printf("Sum: %d\n",x+y);
}

void sub_two_numbers(){
    int x, y;
    printf("Enter the first number: ");
    scanf("%d", &x);
    printf("Enter the second number: ");
    scanf("%d", &y);
    printf("Difference: %d\n", x - y);
}

void mul_two_numbers(){
    int x, y;
    printf("Enter the first number: ");
    scanf("%d", &x);
    printf("Enter the second number: ");
    scanf("%d", &y);
    printf("Product: %d\n", x * y);
}

void div_two_numbers(){
    int x, y;
    printf("Enter the dividend: ");
    scanf("%d", &x);
    printf("Enter the divisor: ");
    scanf("%d", &y);
    if (y != 0) {
        printf("Quotient: %d\n", x / y);
    } else {
        printf("Error: Division by zero.\n");
    }
}

void decimal_to_binary(){
    int n;
    printf("Enter a number in base 10: ");
    scanf("%d", &n);

    int binary[32];
    int i = 0;

    if (n == 0) {
        printf("Binary: 0\n");
        return;
    }

    while (n > 0) {
        binary[i] = n % 2;
        n /= 2; 
        i++;
    }

    printf("Binary: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binary[j]);
    }
    printf("\n");
}

void decimal_to_hexadecimal(){
    int n;
    printf("Enter a number in base 10: ");
    scanf("%d", &n);

    if (n == 0) {
        printf("Hexadecimal: 0\n");
        return;
    }

    char hex[16] = "0123456789ABCDEF";
    char hexadecimal[32];
    int i = 0;

    while (n > 0) {
        hexadecimal[i] = hex[n % 16];
        n /= 16; 
        i++;
    }

    printf("Hexadecimal: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexadecimal[j]);
    }
    printf("\n");
}

void concatenate_strings(){
    char str1[50], str2[50];
    printf("Enter the first string: ");
    scanf("%s",str1);
    printf("Enter the second string: ");
    scanf("%s",str2);

    char result[100];

    strcpy(result, str1); 
    strcat(result, str2); 
    printf("Concatenated string: %s\n", result);
}

void compare_strings(){
    char str1[50], str2[50];
    printf("Enter the first string: ");
    scanf("%s",str1);
    printf("Enter the second string: ");
    scanf("%s",str2);

    int result = strcmp(str1, str2);
    if(result > 0){
        printf("%s > %s",str1, str2);
    }else if(result < 0){
        printf("%s < %s",str1, str2);
    }else printf("Strings are equal"); 
}