.data
random:
        .word 42      
tries:
        .word 0                          
start:
        .asciz "Guess the number: "  
format:
        .asciz "%d"                             
guess:
        .word 0                           
high:
        .asciz "Too high Guess again. "              
low:
        .asciz "Too low. Guess again. "           
win:
        .asciz "You guessed correctly in %d tries! \n"  
return:
        .word 0                             
.text
.global main
main:
        ldr r6, address_of_return                     
        str lr, [r6]                            

        ldr r4, address_of_random                     
        ldr r4, [r4]                               

        ldr r0, address_of_start                
        bl printf                     


increase_tries:
        ldr r7, address_of_tries                      
        ldr r8, [r7]                                  
        add r8, r8, #1                 
        str r8, [r7]                            

guess_number:
        ldr r0, address_of_format                    
        ldr r1, address_of_guess                  
        bl scanf                       
        ldr r1, address_of_guess                     
        ldr r1, [r1]                       

compare_guess:
        cmp r1, #42                               
        blt toolow                      
        bgt toohigh                                 
        beq guess_equals                

toolow:
        ldr r0, address_of_low                  
        bl printf                     
        b increase_tries                

toohigh:
        ldr r0, address_of_high                  
        bl printf                       
        b increase_tries                         

guess_equals:
        ldr r0, address_of_win                      
        ldr r1, address_of_tries                    
        ldr r1, [r1]                     
        bl printf                 

end:         
        ldr r6, address_of_return                  
        ldr lr, [r6]                       
        bx lr                     
    
address_of_random: .word random
address_of_tries: .word tries
address_of_start: .word start
address_of_format: .word format 
address_of_guess: .word guess
address_of_high: .word high
address_of_low: .word low
address_of_win: .word win
address_of_return: .word return
.global printf
.global scanf