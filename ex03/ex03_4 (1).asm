	.data
	
	.align 2 	# eythigramizoume tiin mnimi se 4 ades epeidi tha apothikeysw arithmous 4 bytes o kathenas
a: 			# to onoma tou pinaka
	.space 32 	# o pinakas exei 32 bytes are 8 arithmous
	
str_n:  .asciz "\nDwse mou 8 arithmous:\n" 

str_x:  .asciz  "\n----------------------------\n"


str_tab: .asciz "\t"
		
	.text

main:

	la 	x5 , a #fortwnw sto x5 tin dieythinsi tou pinaka a
	addi 	x17 , x0, 4 #kwdikos gia printstring 
	la   	x10, str_n  #dinw orisma to string p thelw na ektipwsw
	ecall		    #klisi tou system call
	
	addi 	x25, x0, 8 #sto x25 vazw 8
	addi 	x26, x0, 0 #to x26 einai to i = 0

	
loop:	
	addi	x17, x0, 5
	ecall
	add	x27, x0, x10 #diavasa ton arithmo kai ton evala sto x27

	sw 	x27, 0(x5)   #vazw ton arithmo p diavasa mesa ston pinaka
	addi	x5 , x5, 4   #paw stin epomeni thesi tou pinaka
	 	
	addi	x26, x26, 1 #i++
	bne	x25, x26, loop 

	addi	x17, x0, 4
	la	x10, str_x
	ecall
	
	addi 	x26, x0, 0 #to x26 einai to i = 0
	la 	x5 , a #fortwnw sto x5 tin dieythinsi tou pinaka a
	addi    x5, x5, 28
loop_2:
			
	lw	x27, 0(x5)
	
	add x27,x27,x27 # eksaplasiazw
	add x28,x27,x27
	add x28,x27,x28
	
	addi	x17 , x0, 1
	addi    x10, x28, 0
	ecall
	
	addi	x17, x0, 4
	la	x10, str_tab
	ecall

	addi    x5,x5,-4			
	addi	x26, x26, 1
	bne	x25, x26, loop_2
	
	j main
	
	
	