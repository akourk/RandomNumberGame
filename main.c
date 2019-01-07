// Author       :   Alex Kourkoumelis
// Date         :   3/20/2018
// Title        :   RandomNumberGame
// Description  :   Machine picks a random number.
//              :   It's the users' goal to pick that number.


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    printf("Hello, World!\n");

    int high = 0;
    char temp[255];
    int guess = 0;
    int number;

    printf("Please pick a number for top range.\n");
    scanf("%s", temp);
    high = atoi(temp);


    srand(time(NULL));
    number = rand() % high;
    printf("answer is: %d\n", number);


    printf("Guess the number: ");
    scanf("%s", temp);
    guess = atoi(temp);

    int i = 1;

    while(guess != number){
        if(guess > number) {
            printf("Too high. Guess again. ");
            scanf("%s", temp);
        } else if(guess < number){
            printf("Too low. Guess again. ");
            scanf("%s", temp);
        }
        i++;
        guess = atoi(temp);
    }

    if(guess == number){
        if(i == 1){
            printf("Congratulations! You guessed correctly in one try!");
        } else {
            printf("Congratulations! You guessed correctly in %d tries!", i);
        }
    }

    return 0;
}