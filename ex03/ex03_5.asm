#xaraktiras 	dekaeksadiko 	dyadiko


#0		    30		0110000
#1		    31          0110001 	
#2		    32		0110010
#3		    33		0110011
#4		    34		0110100
#5		    35		0110101
#6		    36		0110111
#7		    37		0111000
#8		    38		0111001
#9		    39          0111010


#A		    41	  	1000001
#B		    42		1000010
#C		    43		1000100
#D		    44		1000101
#E		    45		1000110
#F		    46		1000111
#
#
#
#
#
#Z		    5A		1011010


#a		    51		1100001
#b		    52		1100010
#c		    53		1100011
#d		    54		1100100
#
#
#
#z		    7A		1111010

.data

str_x:	.asciz "xyz"

	.text

main:
	la x5, str_x
	lw x25, 0(x5)
	
	addi	x17 , x0, 1
	addi    x10, x25, 0
	ecall
	

#fortwnw sto x25 ton string diavasmeno san arithmo
#kai epeita to typwnw san arithmo

#an o ypologistis mou einai big endian tha prepei na dw ta parakatw

#x = 78
#y = 79
#z = 7a

#ara exoume 78797a00 (hex) = 2021227008 (dec)

#an o ypologistis mou einai little endian tha prepei na dw ta parakatw

#ara exoume 007a7978 (hex) = 8026488 (dec)

#meta tin ektelesi tou programmatos eida oti o ypologistis mou einai little endian
	




	

