#include <stdio.h>
#include <string.h>

int main(){
    char str[21];

    while(1){
        printf("Enter the password: ");
        gets(str);

        if(strcmp(str, "adrian") == 0) break;
        else printf("Invalid password\n");
    }
    printf("Hello BOSS");


    return 0;
}