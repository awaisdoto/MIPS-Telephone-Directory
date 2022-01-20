.data
UserCompareString: .space 50

notFoundString: .asciiz "The User does not exist in the telephone directory !" 

AskUserToInputPrompt: .asciiz "Please enter the name of the user you want to find :"

mainMenuPrompt: .asciiz "Welcome to Telephone Directory ! \n 1) SearchByName() \n 2) DeleteById() \n 3) EditById() \n Please enter the relevant number for function call :"

Name1: .space 50
Name2: .space 50
Name3: .space 50
Name4: .space 50
Name5: .space 50
Name6: .space 50 # user can input max 50 characters
 
IdArray: .space 24

nextLine: .asciiz "\n"

ContactNumberArray: .space 24

Address1: .space 20 
Address2: .space 20 
Address3: .space 20 
Address4: .space 20 
Address5: .space 20 
Address6: .space 20 

NamePrompt: .asciiz "Name :"
IdPrompt: .asciiz "ID :"
AddressPrompt: .asciiz "Address :"
ContactPrompt: .asciiz "Contact :"




















.text
.macro DeleteById()
.end_macro
.macro AddedById()


.end_macro
.macro HomeMenu
li $v0,4
la $a0,mainMenuPrompt
syscall

li $v0,5
syscall

beq $v0,1,first

first:
SearchByName

j exit
.end_macro

.macro SearchByName


li $v0,4
la $a0,AskUserToInputPrompt
syscall

li $v0,8
la $a0,UserCompareString
li $a1,50
syscall


li $t0,1 # register will be used for index of names
li $t1,0 # register $t1 will be used as an index for the characters

firstName:
lb $t2,UserCompareString($t1)
lb $t3,Name1($t1)
add $t1,$t1,1

beqz $t2,missmatch
beqz $t3,setIndexOfName


beq $t2,$t3,firstName
bne $t2,$t3,setIndexOfName


missmatch:
bnez $t3,setIndexOfName
foundMatch


setIndexOfName:
li $t1,0
beq $t0,1,secondName
beq $t0,2,thirdName
beq $t0,3,fourthName
beq $t0,4,fifthName
beq $t0,5,sixthName
notFound

secondName:
lb $t2,UserCompareString($t1)
lb $t3,Name2($t1)
add $t1,$t1,1
beqz $t2,missmatch
beqz $t3,setIndexOfName
beq $t2,$t3,firstName
bne $t2,$t3,setIndexOfName

thirdName:
lb $t2,UserCompareString($t1)
lb $t3,Name3($t1)
add $t1,$t1,1
beqz $t2,missmatch
beqz $t3,setIndexOfName
beq $t2,$t3,firstName
bne $t2,$t3,setIndexOfName

fourthName:
lb $t2,UserCompareString($t1)
lb $t3,Name4($t1)
add $t1,$t1,1
beqz $t2,missmatch
beqz $t3,setIndexOfName
beq $t2,$t3,fourthName
bne $t2,$t3,setIndexOfName

fifthName:
lb $t2,UserCompareString($t1)
lb $t3,Name5($t1)
add $t1,$t1,1
beqz $t2,missmatch
beqz $t3,setIndexOfName
beq $t2,$t3,fifthName
bne $t2,$t3,setIndexOfName

sixthName:
lb $t2,UserCompareString($t1)
lb $t3,Name6($t1)
add $t1,$t1,1
beqz $t2,missmatch
beqz $t3,setIndexOfName
beq $t2,$t3,sixthName
notFound

.end_macro 


# t1 this is index register used for ContactArray
# t2 this is index register used for IdArray



#	Rules:  . Contact number must be max 11 numbers  
#		. Address can be max 20 characters and cannot contain a number 
#       Size of an int is 4 bytes        
#	Make sure all the indexes move together when reading or deleting or inputing etc
.macro notFound
li $v0,4
la $a0,notFoundString
syscall
.end_macro

.macro foundMatch
# $t0 is the index register for the number of the user that was found 
beq $t0,1,found1st
beq $t0,2,found2nd
beq $t0,3,found3rd
beq $t0,4,found4th
beq $t0,5,found5th
beq $t0,6,found6th

found1st:
li $v0,4
la $a0,NamePrompt
syscall

li $v0,4
la $a0,Name1
syscall

li $v0,4
la $a0,nextLine
syscall

li $v0,4
la $a0,AddressPrompt
syscall

li $v0,4
la $a0,Address1
syscall

li $v0,4
la $a0,nextLine
syscall
li $t0,0
j showRest

found2nd:
li $v0,4
la $a0,NamePrompt
syscall

li $v0,4
la $a0,Name2
syscall

li $v0,4
la $a0,nextLine
syscall

li $v0,4
la $a0,AddressPrompt
syscall

li $v0,4
la $a0,Address2
syscall

li $v0,4
la $a0,nextLine
syscall
li $t0,4
j showRest

found3rd:
li $v0,4
la $a0,NamePrompt
syscall

li $v0,4
la $a0,Name3
syscall

li $v0,4
la $a0,nextLine
syscall

li $v0,4
la $a0,AddressPrompt
syscall

li $v0,4
la $a0,Address3
syscall

li $v0,4
la $a0,nextLine
syscall
li $t0,8
j showRest

found4th:
li $v0,4
la $a0,NamePrompt
syscall

li $v0,4
la $a0,Name4
syscall

li $v0,4
la $a0,nextLine
syscall

li $v0,4
la $a0,AddressPrompt
syscall

li $v0,4
la $a0,Address4
syscall

li $v0,4
la $a0,nextLine
syscall
li $t0,12
j showRest

found5th:
li $v0,4
la $a0,NamePrompt
syscall

li $v0,4
la $a0,Name5
syscall

li $v0,4
la $a0,nextLine
syscall

li $v0,4
la $a0,AddressPrompt
syscall

li $v0,4
la $a0,Address5
syscall

li $v0,4
la $a0,nextLine
syscall
li $t0,16
j showRest

found6th:
li $v0,4
la $a0,NamePrompt
syscall

li $v0,4
la $a0,Name6
syscall

li $v0,4
la $a0,nextLine
syscall

li $v0,4
la $a0,AddressPrompt
syscall

li $v0,4
la $a0,Address6
syscall

li $v0,4
la $a0,nextLine
syscall
li $t0,20

showRest:
li $v0,4
la $a0,IdPrompt
syscall

li $v0,1
lw $a0,IdArray($t0)
syscall

li $v0,4
la $a0,nextLine
syscall

li $v0,4
la $a0,ContactPrompt
syscall

li $v0,1
lw $a0,ContactNumberArray($t0)
syscall

li $v0,4
la $a0,nextLine
syscall

j main
.end_macro


main:
HomeMenu


exit:
li $v0,10
syscall
