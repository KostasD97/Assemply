	.data	
str1:   .asciz "\nEisagwgi arithmou sarwsis: "
str2:   .asciz " "
	.text
	
	  	  
	    
main:

	jal node_alloc #klisi tis node_alloc kai desmeysi enos komvou
	
	sw	x0, 0(a0)  #kanw to pedio data 0
	sw	x0 , 4(a0) #kanw to pedio nxptr 0
	
	add	s0, a0, x0 #to kefali dixnei ston dummy komvo
	add	s1, s0, x0 #i oura dixnei sto dummy komvo
	
loop_1:
	
	jal read_int #klisi tis read int kia anagnwsi arithmou
	
	add	t1, x0, a0 #metaferw ton arithmo sto t1
	
	bge	x0, t1, cont_1
	
	jal node_alloc #klisi tis node_alloc kai desmeysi enos komvou
	
	sw	t1, 0(a0) # vazw ton arithmo pou diavasa sto data tou neou komvou
	
	sw 	a0, 4(s1) #syndesi me tin oura tis lista
	add 	s1, a0, x0 #metafereis to deikti tis ouras ston neo komvo
	
	j loop_1
	
cont_1:

	addi	x17, x0 , 4 #ektypwsi minimatos
	la   	x10, str1
	ecall 
	
	
	jal read_int
		
	add	s1, x10, x0 #vazw ton arithmo ston s1 opws leei i ekfwnisi	
	
	bge	s1, x0, loop #an o arithmos einia >= 0 synexizw alliws termatizw
	
	addi	x17, x0, 10 # termatismos programmatos me to system call 10
	ecall						
	
loop:#sunexizw	

	add a0, s0, x0 #prwto arisma i arxi tis listas
	add a1, s1, x0 #deytero orisma o arithmos tou xristi
	jal search_list
	
	j cont_1
	
#functions
read_int:
		addi	x17, x0, 5
		ecall
		jr 	ra, 0
		
node_alloc:
		addi	x17, x0, 9
		addi	x10, x0, 8
		ecall
		jr	ra, 0

#i function ayti exei prwto orisma ena komvo kai deytero orisma ton arithmo tou xristi
print_node:
		
		lw	t3, 0(a0) # fernw ta data tou a0 ston kataxwriti t3
	
		bge  	a1, t3, skip # o arithmos poy diavasame einai >= apo ayton tis listas kanw skip tin ektypwsi
	
		addi	x17, x0, 1 #ektipwsi tou t3 tou arithmou data tis listas
		add	x10, t3, x0
		ecall
	
		addi	x17, x0 , 4 #ektipwsi kenou
		la   	x10, str2
		ecall 
skip:
		
		jr	ra, 0	
	
#i function ayti exei prwto orisma tin arxi tis listas kai deytero orisma ton arithmo tou xristi
search_list:

		add	s2, a0, x0 #arxikopoiisi s2 kataxoriti me to kefali tis listas
loop_2:	
		beq	x0, s2, cont_2  #an to s2 einai null to loop teliwnei	
	 
	 	addi sp,sp, -8 #desmevw stin stoiva 8 bytes
	 	sw a1, 0(sp) #swzw ton a1 epeidi mporei i print_node na ton allazei
	 	sw ra, 4(sp) #swzw kai to return address tis search_list
	 
		add	a0, x0, s2 #prwto orisma tis print_node i dieythinsi tou trexontos komvou
		add	a1, x0, a1 #deytero orisma o arithmo tous xrist
 		jal print_node
		
		lw a1, 0(sp) #epanaferw tis times apo tin stoiva
	 	lw ra, 4(sp)
	 	addi sp,sp, 8 # apodesmeysi tou xwrou
	  
		lw	s2, 4(s2) #paei ston epomeno komvo
	
		j loop_2
cont_2:
		jr ra,0
	
	
	
