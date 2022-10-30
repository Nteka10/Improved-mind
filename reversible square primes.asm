######################################
# Author:Nteka.M.E
# Date : 29 octeber 2022
# 
#
#
#######################################

.text
main:
	jal ReversiblePrimeSquares
	li $v0,10
	syscall
	
ReversiblePrimeSquares:
	li $s4,2
	li $s1,1
	li $s0,0
	li $t1,1	
	
	jal IsPrime
	move $t0,$v1
	bne  $t0,$t1, Exit
	mul $s2,$s1,$s1
	
	jal reverse
	move $a1,$s2
	move $s3,$a1
	beq $s2,$s3,Exit
	
	For:
		div $s3,$s4
		mflo $t0
		bgt $s5,$t2, Exit
		mul $t3,$s5,$s5
		
		bne $t3,$s3,Exit
		
	jal IsPrime
	move $a0,$s5
	bne $a1,$t1,Exit
	li $v0,1
	move $a0,$s2
	
	addi $s0,$s0,1
	
	IsPrime:
	li	$t3, 2

	for:
		blt	$a1, $t3, false
	
		bge	$t3, $a1, true
	
		div	$a1, $t3
		mfhi	$t2
	
		beqz	$t2, returnZero
		addi	$t3, $t3, 1
		j	for
	        jr	$ra
	
	returnZero:
	           
	        mtc1 $zero, $f3
	        syscall 
	        
	        jr $ra

	true:
		li	$v1, 1
		li $v0,1
		move $a0,$v1
		syscall
		
		jr	$ra
		
		
	false:
		li	$v1, 0
		li $v0,1
		move $a0,$v1
		syscall
		
		jr	$ra
	

	jal reverse
		li $v0,10
		syscall
	reverse:
		#li $s0,49
        	li $t0,0
		li $t1,10
		
        	while:
             	beqz $s0,exit		
             	
             	rem $t2,$s0,$t1 
             	 		
             
            	mul $t0,$t0,$t1		
             	add $t0,$t0,$t2		
             
             	div $s0,$t1
             	mflo $s0
             
             	j while
             	
         
	exit:
		
		li $v0,1
		move $a0,$t0
		syscall
		
		move $v0,$t0
		
		
		li $v0,10
		syscall
		
		jr $ra

	Exit:
		li $v0,1
		syscall
		
	jr $ra
	
.data 
