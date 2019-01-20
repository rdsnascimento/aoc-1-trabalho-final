#	RAFAEL NASCIMENTO 15200084
#	JUKEBOX: reproduz m�sicas conforme a escolha do usu�rio.
#	Habilite pseudo-instru��es e delayed branching.
#	O programa � muito intuitivo, o usu�rio escolhe a m�sica que deseja tocar, a velocidade
#	(foi criado com v�rias velocidades, por causa do delay do processador que 
#	pode variar em cada m�quina). 
#	#######  Caso seja necess�rio modificar as velocidades, � s� modificar o valor de "VelocTempo" que fica dentro do .data na linha 23 ##########
#	- Figura de ritmo semim�nima equivale a um tempo no programa (representado por �UmTempo�).
#	- Figura de ritmo colcheia equivale a meio tempo no programa (�MeioTempo�).
#	- Figura de ritmo semicolcheia equivale a meio tempo da colcheia (�MeioTempo2�).
#	- Figura de ritmo m�nima equivale � soma de duas semim�nima, ou seja, representado por dois tempos no programa.
#	- Figura de ritmo semibreve equivale � soma de quatro semim�nima, ou seja, representado por quatro tempos no programa.


.data
	instrumento:	.word 0 #Valor Default para o instrumento.
	stringMenuPrincipal:	.asciiz "JUKEBOX\n\nEscolha a m�sica:\n1- Miss�o Imposs�vel\n2- Asa Branca\n3- Super Mario Bros\n4- Atirei o pau no gato\n5- Flinstones\n6- Pantera Cor de Rosa\n7- Titanic\n8- Esse Cara Sou Eu\n9- Hino Nacional Brasileiro\n10- Hino do Corinthians\n11- Chapeuzinho Vermelho\n12- Aquarela\n13- Jingle Bells\n14- Se essa rua fosse minha\n15- Ciranda, Cirandinha\n16- Marcha Soldado\n17- Nona Sinfonia - Bethoven\n18- Noite Feliz\n19- Twinkle, twinkle, little star\n20- Mucama Bonita (Folclore)\n\n"
	stringMenuInstrumento:	.asciiz "JUKEBOX\n\nEscolha instrumento:\n1- Piano\n2- Organ\n3- Viol�o\n4- Violino\n5- Guitarra\n6- Sinos\n7- Suspense\n8- Flauta\n9- Flauta indigena\n10- Percuss�o\n11- Percuss�o 2\n12- Ninar\n13- Desenho Animado\n14- Brisado\n15- Strings\n16- Passarinhos\n17- Martelo\n18- Panela\n19- Conjunto\n20- Conjunto 2\n21- Guitarra Eletr�nica\n22- Nuvens\n23- Xelophone\n24- Percuss�o 3\n25- Desenho Animado 2\n26- Apito\n\n"
	escolhaVelocidade:	.asciiz "JUKEBOX\n\nEscolha a velocidade:\n1- Normal\n2- R�pido\n3- Muito R�pido\n4- Devagar\n5- Muito devagar\n\n"
	erroDeEntrada1:	.asciiz "Entrada inv�lida"
	erroDeEntrada2: .asciiz "Escolha uma op��o"
	#################################################################################
	VelocTempo:	.word 130000 #CASO SEJA NECESS�RIO MODIFIQUE APENAS ESSE PARAMETRO, QUE IR� MODIFICAR AUTOMATICAMENTE TODAS AS VELOCIDADES DE REPRODU��O.
	#################################################################################
	umtempo:	.word 0 #Valor default para Figura Musical: Seminima
	meiotempo:	.word 0 #Valor default para Figura Musical: Colcheia
	meiotempo2:	.word 0 #Valor default para Figura Musical: Semicolcheia
.text

la $s0, instrumento
li $s1, 0
sw $s1, 0($s0)

jal menuPrincipal
nop

################################################ COMPASSOS ################################################################
###########################################################################################################################
###########################################################################################################################
UmTempo:	
	li $t0, 1
	lw $t1, umtempo #Baseado na escolha do usu�rio no menu principal
	
	Loop:	beq $t0, $t1, sair
		nop
			addi $t0, $t0, 1
			j Loop
		nop
	sair:	jr $ra
	nop
nop


MeioTempo:	
	li $t0, 1
	lw $t1, meiotempo #Baseado na escolha do usu�rio no menu principal
	
	Loop1:	beq $t0, $t1, sair1
		nop
			addi $t0, $t0, 1
			j Loop1
		nop
	sair1:	jr $ra
	nop
nop

MeioTempo2:	
	li $t0, 1
	lw $t1, meiotempo2 #Baseado na escolha do usu�rio no menu principal
	
	Loop5:	beq $t0, $t1, sair5
		nop
			addi $t0, $t0, 1
			j Loop5
		nop
	sair5:	jr $ra
	nop
nop



########################################################### NOTAS MUSICAIS ###################################################
##############################################################################################################################
##############################################################################################################################

DO:
	li $a0, 60 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

DOs:
	li $a0, 61 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

DOs8:
	li $a0, 73 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

DO8:
	li $a0, 72 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

DO16:
	li $a0, 84 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

RE:
	li $a0, 62 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

RE8:
	li $a0, 74 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

REs8:
	li $a0, 75 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

RE16:
	li $a0, 86 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

REs:
	li $a0, 63 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

MI:	#MI
	li $a0, 64 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

MI8:	#MI
	li $a0, 76 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	
	jr $ra
nop

FA:	#FA
	li $a0, 65 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

FA8:	#FA
	li $a0, 77 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

FAs:	#FA
	li $a0, 66 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

FAs8:	#FA
	li $a0, 78 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

SOLm8:	#SOL
	li $a0, 55 # = pitch (0-127)
	li $a1, 700 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

SOL:	#SOL
	li $a0, 67 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

SOL8:	#SOL
	li $a0, 79 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

SOLs:	#SOL
	li $a0, 67 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

LAm8:	#LA8
	li $a0, 57 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall
	jr $ra
nop

	

LA:	#LA8
	li $a0, 69 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

LAs:	#LA8
	li $a0, 70 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

LA8:	#LA8
	li $a0, 81 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

SIm8:	#SI8
	li $a0, 59 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

SI:	#SI8
	li $a0, 71 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

SI8:	#SI8
	li $a0, 83 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop


SIb:	#LA8
	li $a0, 70 # = pitch (0-127)
	li $a1, 1000 # = duration in milliseconds
	lw $a2, instrumento
	li $a3, 127
	li $v0, 31
	syscall

	jr $ra
nop

#################################################################### MENU PRINCIPAL ###############################################
###################################################################################################################################
###################################################################################################################################

menuPrincipal:	
		la $a0, stringMenuPrincipal
		li $v0, 51
		syscall
		
		beq $a1, -1, erro1 	#Entrada incorreta
		nop
		beq $a1, -2, Fim 	#Clicou no cancelar
		nop
		beq $a1, -3, erro2 	#Clicou em ok, mas n�o entrou com nada
		nop
		
		bgt $a0, 20, erro1 	#Usu�rio entrou com valor maior que 4
		nop
		
		ble $a0, 0, erro1 	#Usu�rio entrou com valor menor que 0
		nop
		
		beq $a0, 1, mus1
		nop
		beq $a0, 2, mus2
		nop
		beq $a0, 3, mus3
		nop
		beq $a0, 4, mus4
		nop
		beq $a0, 5, mus5
		nop
		beq $a0, 6, mus6
		nop
		beq $a0, 7, mus7
		nop
		beq $a0, 8, mus8
		nop
		beq $a0, 9, mus9
		nop
		beq $a0, 10, mus10
		nop
		beq $a0, 11, mus11
		nop
		beq $a0, 12, mus12
		nop
		beq $a0, 13, mus13
		nop
		beq $a0, 14, mus14
		nop
		beq $a0, 15, mus15
		nop
		beq $a0, 16, mus16
		nop
		beq $a0, 17, mus17
		nop
		beq $a0, 18, mus18
		nop
		beq $a0, 19, mus19
		nop
		beq $a0, 20, mus20
		nop
		
		erro1:	la $a0, erroDeEntrada1 #Entrada inv�lida
			li $a1, 0
			li $v0, 55
			syscall
			j menuPrincipal
			nop

		erro2:	la $a0, erroDeEntrada2 #Usu�rio n�o escolheu nenhuma op��o e deu 'Ok'
			li $a1, 0
			li $v0, 55
			syscall
			j menuPrincipal
			nop
			
		mus1: 	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal MissaoImpossivel
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus2: 	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal AsaBranca
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
		mus3: 	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal MarioBros
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus4: 	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Atirei
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus5: 	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Flinstones
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus6: 	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Pantera
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
		mus7: 	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Titanic
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus8:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal EsseCara
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
		
		mus9:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal HinoNacional
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus10:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal HinoCorinthians
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus11:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Chapeuzinho
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus12:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Aquarela
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus13:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Jingle
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus14:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal SeEssaRua
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus15:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Ciranda
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus16:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal MarchaSoldado
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus17:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Nona
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus18:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal NoiteFeliz
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus19:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Twinkle
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
			
		mus20:	addi $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal velocidade
			nop
			
			jal menuInstrumento
			nop
			
			jal Mucana
			nop
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			j menuPrincipal
			nop
nop

#################################################################### MENU VELOCIDADE ##############################################
###################################################################################################################################
###################################################################################################################################

velocidade:	la $a0, escolhaVelocidade
		li $v0, 51
		syscall
		
		beq $a1, -1, erro1b 	#Entrada incorreta
		nop
		beq $a1, -2, menuPrincipal 	#Clicou no cancelar
		nop
		beq $a1, -3, erro2b 	#Clicou em ok, mas n�o entrou com nada
		nop
		
		bgt $a0, 5, erro1b 	#Usu�rio entrou com valor maior que 3
		nop
		
		ble $a0, 0, erro1b 	#Usu�rio entrou com valor menor que 0
		nop
		
		beq $a0, 1, normal
		nop
		beq $a0, 2, rapido
		nop
		beq $a0, 3, muitoRapido
		nop
		beq $a0, 4, lento
		nop
		beq $a0, 5, muitoLento
		nop
		
		erro1b:	la $a0, erroDeEntrada1 #Entrada inv�lida
			li $a1, 0
			li $v0, 55
			syscall
			j velocidade
			nop

		erro2b:	la $a0, erroDeEntrada2 #Usu�rio n�o escolheu nenhuma op��o e deu 'Ok'
			li $a1, 0
			li $v0, 55
			syscall
			j velocidade
			nop
			
		normal:			
			lw $s2, VelocTempo
			sw $s2, umtempo #semin�ma
			
			div $s2, $s2, 2 #colcheia
			sw $s2, meiotempo
			
			div $s2, $s2, 2 #semicolcheia
			sw $s2, meiotempo2
			
			jr $ra
			nop
		rapido:	
			lw $s2, VelocTempo
			srl $s2, $s2, 1 #divide por 2
			sw $s2, umtempo #semin�ma
			
			div $s2, $s2, 2
			sw $s2, meiotempo #colcheia
			
			div $s2, $s2, 2
			sw $s2, meiotempo2 #semicolcheia
			
			jr $ra
			nop
		muitoRapido:	
			lw $s2, VelocTempo 
			srl $s2, $s2, 2 #divide por 4
			sw $s2, umtempo #semin�ma
			
			div $s2, $s2, 2
			sw $s2, meiotempo #colcheia
			 
			div $s2, $s2, 2
			sw $s2, meiotempo2 #semicolcheia
			
			jr $ra
			nop
		lento:	
			lw $s2, VelocTempo 
			sll $s2, $s2, 1 #multiplica por 2
			sw $s2, umtempo #semin�ma
			
			div $s2, $s2, 2
			sw $s2, meiotempo #colcheia
			
			div $s2, $s2, 2
			sw $s2, meiotempo2 #semicolcheia
			
			jr $ra
			nop
			
		muitoLento:	
			lw $s2, VelocTempo 
			sll $s2, $s2, 2 #multiplica por 4
			sw $s2, umtempo #semin�ma
			
			div $s2, $s2, 2
			sw $s2, meiotempo #colcheia
			
			div $s2, $s2, 2
			sw $s2, meiotempo2 #semicolcheia
			
			jr $ra
			nop
nop

#################################################################### MENU INSTRUMENTO #############################################
###################################################################################################################################
###################################################################################################################################

menuInstrumento:	
		la $a0, stringMenuInstrumento
		li $v0, 51
		syscall
		
		beq $a1, -1, erro1c 	#Entrada incorreta
		nop
		beq $a1, -2, menuPrincipal 	#Clicou no cancelar
		nop
		beq $a1, -3, erro2c 	#Clicou em ok, mas n�o entrou com nada
		nop
		
		bgt $a0, 26, erro1c 	#Usu�rio entrou com valor maior que 4
		nop
		
		ble $a0, 0, erro1c	#Usu�rio entrou com valor menor que 0
		nop
		
		beq $a0, 1, instr1
		nop
		beq $a0, 2, instr2
		nop
		beq $a0, 3, instr3
		nop
		beq $a0, 4, instr4
		nop
		beq $a0, 5, instr5
		nop
		beq $a0, 6, instr6
		nop
		beq $a0, 7, instr7
		nop
		beq $a0, 8, instr8
		nop
		beq $a0, 9, instr9
		nop
		beq $a0, 10, instr10
		nop
		beq $a0, 11, instr11
		nop
		beq $a0, 12, instr12
		nop
		beq $a0, 13, instr13
		nop
		beq $a0, 14, instr14
		nop
		beq $a0, 15, instr15
		nop
		beq $a0, 16, instr16
		nop
		beq $a0, 17, instr17
		nop
		beq $a0, 18, instr18
		nop
		beq $a0, 19, instr19
		nop
		beq $a0, 20, instr20
		nop
		beq $a0, 21, instr21
		nop
		beq $a0, 22, instr22
		nop
		beq $a0, 23, instr23
		nop
		beq $a0, 24, instr24
		nop
		beq $a0, 25, instr25
		nop
		beq $a0, 26, instr26
		nop
		
		
		erro1c:	la $a0, erroDeEntrada1 #Entrada inv�lida
			li $a1, 0
			li $v0, 55
			syscall
			j menuInstrumento
			nop

		erro2c:	la $a0, erroDeEntrada2 #Usu�rio n�o escolheu nenhuma op��o e deu 'Ok'
			li $a1, 0
			li $v0, 55
			syscall
			j menuInstrumento
			nop
			
		instr1: la $s0, instrumento
			li $s1, 0
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr2: la $s0, instrumento
			li $s1, 16
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr3: la $s0, instrumento
			li $s1, 24
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr4: la $s0, instrumento
			li $s1, 40
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr5: la $s0, instrumento
			li $s1, 29
			sw $s1, 0($s0)
			jr $ra
			nop
		
		instr6: la $s0, instrumento
			li $s1, 14
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr7: la $s0, instrumento
			li $s1, 55
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr8: la $s0, instrumento
			li $s1, 72
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr9: la $s0, instrumento
			li $s1, 75
			sw $s1, 0($s0)
			jr $ra
			nop
		
		instr10: la $s0, instrumento
			li $s1, 8
			sw $s1, 0($s0)
			jr $ra
			nop
		
		instr11: la $s0, instrumento
			li $s1, 12
			sw $s1, 0($s0)
			jr $ra
			nop
		
		instr12: la $s0, instrumento
			li $s1, 10
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr13: la $s0, instrumento
			li $s1, 45
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr14: la $s0, instrumento
			li $s1, 97
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr15: la $s0, instrumento
			li $s1, 44
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr16: la $s0, instrumento
			li $s1, 123
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr17: la $s0, instrumento
			li $s1, 127
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr18: la $s0, instrumento
			li $s1, 47
			sw $s1, 0($s0)
			jr $ra
			nop
		
		instr19: la $s0, instrumento
			li $s1, 53
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr20: la $s0, instrumento
			li $s1, 54
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr21: la $s0, instrumento
			li $s1, 81
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr22: la $s0, instrumento
			li $s1, 86
			sw $s1, 0($s0)
			jr $ra
			nop
		
		instr23: la $s0, instrumento
			li $s1, 88
			sw $s1, 0($s0)
			jr $ra
			nop
		
		instr24: la $s0, instrumento
			li $s1, 108
			sw $s1, 0($s0)
			jr $ra
			nop
		
		instr25: la $s0, instrumento
			li $s1, 115
			sw $s1, 0($s0)
			jr $ra
			nop
			
		instr26: la $s0, instrumento
			li $s1, 111
			sw $s1, 0($s0)
			jr $ra
			nop
nop



########################################################## MUSICAS ################################################################
###################################################################################################################################
###################################################################################################################################
###################################################################################################################################
###################################################################################################################################
################################################# MISS�O IMPOSS�VEL ###############################################################
MissaoImpossivel:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	
	jal UmTempo
	nop

	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
###################################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
####################################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
####################################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
##############################################################################################################################
	jal SI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop

	jal RE
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
##################################	
	jal SI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop

	jal DOs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
##################################
	jal SI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop

	jal RE
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
##################################	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop

	jal UmTempo
	nop
#############################################################################################################
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FAs8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
####################################
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
####################################
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
#####################################
	jal REs8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal UmTempo
	nop
################################################################################################################################
	jal REs8
	nop
	jal MeioTempo
	nop

	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
#####################################
	jal REs8
	nop
	jal MeioTempo
	nop

	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
#####################################
	jal REs8
	nop
	jal MeioTempo
	nop

	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
#####################################
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal UmTempo
	nop
################################################################################################################################
	jal SI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop

	jal RE
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
##################################	
	jal SI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop

	jal DOs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
##################################
	jal SI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop

	jal RE
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
##################################	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop

	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop




###################################################################################################################################
###################################################################################################################################
################################################# ASA BRANCA ######################################################################
AsaBranca:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	
	jal MeioTempo
	nop
	
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
###########################################
	jal SI
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
################################################################3
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
###########################################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop

	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA 
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
#############################################################################################
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
##############################################################################################################################
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop





###################################################################################################################################
###################################################################################################################################
################################################# ATIREI O PAU NO GATO ############################################################
Atirei:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal UmTempo
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
	
	jal LAm8
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
		
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	#ProximaLinha
	jal SIm8
	nop
	jal UmTempo	
	nop
	
	jal SIm8
	nop
	jal UmTempo
	nop
	
	jal SIm8
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop

	jal SOLm8
	nop
	jal MeioTempo
	nop
	
	jal SOLm8
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	#ProximaLinha
	jal RE
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
	
	jal LAm8
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop





###########################################################################################################
###########################################################################################################
Flinstones:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal UmTempo
	nop
	
	jal UmTempo
	nop

	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal DO16
	nop
	jal UmTempo
	nop

	jal LA8
	nop
	jal MeioTempo
	nop
#############	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
#############
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
###############
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
############################################################################################
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal DO16
	nop
	jal UmTempo
	nop

	jal LA8
	nop
	jal MeioTempo
	nop
#############	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
#############
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
###############
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
############################################################################################
	jal SI8
	nop
	jal UmTempo
	nop
	
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop	
	
	jal DO16
	nop
	jal UmTempo
	nop
	
	jal SI8
	nop
	jal MeioTempo
	nop
################
	jal SI8
	nop
	jal MeioTempo
	nop
	
	jal LA8
	nop
	jal MeioTempo
	nop
	
	jal LA8
	nop
	jal MeioTempo
	nop
	
	jal SI8
	nop
	jal MeioTempo
	nop	
	
	jal LA8
	nop
	jal MeioTempo
	nop
	
	#jal SI8
	#nop
	#jal UmTempo
	#nop
	
	jal UmTempo
	nop
##################
	

	jal LA8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SI8
	nop
	jal UmTempo
	nop 
	
	jal LA8
	nop
	jal MeioTempo
	nop
####################
	jal LA8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal LA8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
##############################################################################################
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal DO16
	nop
	jal UmTempo
	nop

	jal LA8
	nop
	jal MeioTempo
	nop
#############	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
###############
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
##################
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
####################
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal DO16
	nop
	jal UmTempo
	nop
	
	jal RE16
	nop
	jal UmTempo
	nop
	
	jal DO16
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop


###################################################################################################################################
###################################################################################################################################
################################################# PANTERA COR DE ROSA #############################################################
Pantera:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal UmTempo
	nop
	
	jal UmTempo
	nop

	jal REs
	nop
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal REs
	nop
	jal MeioTempo2
	nop
########################
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo2
	nop
	
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SI
	nop
	jal MeioTempo2
	nop
#####################################
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
###################################################################################################################3
	jal REs
	nop
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal REs
	nop
	jal MeioTempo2
	nop
########################
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal MI8
	nop
	jal MeioTempo2
	nop
#########################
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
############################################################################################################
	jal REs
	nop
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal REs
	nop
	jal MeioTempo2
	nop
########################
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo2
	nop
	
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SI
	nop
	jal MeioTempo2
	nop
#####################################
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
###############################################################################################################################
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo2
	nop
	
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo2
	nop
########################################
	jal LAs
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	
	jal LAs
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	
	jal LAs
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	
	jal LAs
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
###################
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
########################
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop

###################################################################################################################################
###################################################################################################################################
############################################################# TITANIC #############################################################
Titanic:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
		jal UmTempo
	nop
	
	jal UmTempo
	nop

	jal FA
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	#jal DO
	#nop
	#jal DoisTempo
	#nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	###########################################################
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SIb
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	#################################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SIb
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	#############################################
	#############################################
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SIb
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	######
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SIb
	nop
	jal UmTempo
	nop
	#####
	jal LA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	#####
	jal MI
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	######
	jal MI
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	######
	jal RE
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop




###################################################################################################################################
###################################################################################################################################
################################################### MUCANA - FOLCLORE #############################################################
Mucana:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal UmTempo
	nop
	
	jal UmTempo
	nop

	jal MI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	
	
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop






###################################################################################################################################
###################################################################################################################################
################################################### HINO NACIONAL BRASILEIRO ######################################################
HinoNacional:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo2
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LAs
	nop
	jal MeioTempo2
	nop
############################################################################################ Segunda linha
	jal SI
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop	
	
	#
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FA
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
##########
	jal FAs
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
################################################################################################### Terceira linha
	#
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	#
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	#
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	#
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
#################
	jal DOs8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
###################
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	#
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	#
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LAs
	nop
	jal MeioTempo2
	nop
##################################################################################################################3 Quarta linha
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
#######
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
####################
	jal LA
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
############################################################################################################## Quinta Linha
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
####################
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
###################
	jal LA 
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
################################################################################################3 Sexta linha
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA 
	nop
	jal MeioTempo
	nop
##############
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop

	jal RE
	nop
	jal MeioTempo
	nop
#####################
	jal RE
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
######################################################################################### Setima linha
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop	
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
####################
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo2
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LAs
	nop
	jal MeioTempo2
	nop
############################################################################################ Segunda linha
	jal SI
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop	
	
	#
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FA
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
##########
	jal FAs
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
################################################################################################### Terceira linha
	#
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	#
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	#
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	#
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
#################
	jal DOs8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
###################
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	#
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	#
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LAs
	nop
	jal MeioTempo2
	nop
##################################################################################################################3 Quarta linha
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
#######
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
####################
	jal LA
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
############################################################################################################## Quinta Linha
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
####################
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
###################
	jal LA 
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo2
	nop
################################################################################################3 Sexta linha
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA 
	nop
	jal MeioTempo
	nop
##############
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop

	jal RE
	nop
	jal MeioTempo
	nop
#####################
	jal RE
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
######################################################################################### Setima linha
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop	
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
####################
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop



###################################################################################################################################
###################################################################################################################################
################################################### HINO DO CORINTHIANS ###########################################################
HinoCorinthians:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal UmTempo
	nop
	
	jal UmTempo
	nop

	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOLs
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop

###############################################
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal FAs8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop

	
####################################################
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
############################################################################
	jal LA
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal REs
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal REs
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
########################################################################
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOLs
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
########################################################3
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop


###################################################################################################################################
###################################################################################################################################
################################################### ESSE CARA SOU EU ##############################################################
EsseCara:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
###########################
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal REs
	nop
	jal UmTempo
	nop
#########################	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
#########################
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
############################
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal REs
	nop
	jal UmTempo
	nop
################################################################################################################################# passos, Esta do seu lado
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
######################################
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal UmTempo
	nop
#####################
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
########################################### O Heroi esperado
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal UmTempo
	nop
############################################################################################################################################################### por toda mulher
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
#####################
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
##################### ele encara 
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
########################## o perigo
	jal SOLs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
################################################################################################################################################ Seu melhor amigo
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
#################################################### 
	jal LAs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
##################################################### ESSE CARA SOU EU
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MeioTempo
	nop
##################################################### ESSE CARA SOU EU
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal REs
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LAs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MeioTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop
















###################################################################################################################################
###################################################################################################################################
################################################### Super Mario Bross #############################################################
MarioBros:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal DO8
	nop
	jal MeioTempo
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
#########
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
###########
	jal SOL
	nop
	jal MeioTempo2
	nop
	jal MeioTempo2
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	jal MeioTempo2
	nop
	jal MeioTempo2
	nop
	
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal LA8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
######################################################################### prox linha
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	jal MeioTempo2
	nop
##################
	jal DO8
	nop
	jal MeioTempo
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	jal MeioTempo2
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
#########
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
###########
	jal SOL
	nop
	jal MeioTempo2
	nop
	jal MeioTempo2
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	jal MeioTempo2
	nop
	jal MeioTempo2
	nop
	
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal LA8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
############
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	jal MeioTempo2
	nop
####################################################################### terceira linha
	jal SOL8
	nop
	jal MeioTempo2
	nop
	
	jal FAs8
	nop
	jal MeioTempo2
	nop
	
	jal FA8
	nop
	jal MeioTempo2
	nop
	
	jal REs8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
##################	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo2
	nop
###########	
	jal MeioTempo2
	nop

	jal SOL8
	nop
	jal MeioTempo2
	nop
	
	jal FAs8
	nop
	jal MeioTempo2
	nop
	
	jal FA8
	nop
	jal MeioTempo2
	nop
	
	jal REs8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
#######################
	jal DO16
	nop
	jal MeioTempo
	nop
	
	jal DO16
	nop
	jal MeioTempo2
	nop
	
	jal DO16
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo
	nop
##########################
	jal SOL8
	nop
	jal MeioTempo2
	nop
	
	jal FAs8
	nop
	jal MeioTempo2
	nop
	
	jal FA8
	nop
	jal MeioTempo2
	nop
	
	jal REs8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
###################################################################### Quarta Linha	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo2
	nop
##################################
	jal MeioTempo
	nop
	
	jal REs8
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
##########################
	jal SOL8
	nop
	jal MeioTempo2
	nop
	
	jal FAs8
	nop
	jal MeioTempo2
	nop
	
	jal FA8
	nop
	jal MeioTempo2
	nop
	
	jal REs8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
##################	
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo2
	nop
###################################################################### Quinta Linha
	jal MeioTempo2
	nop

	jal SOL8
	nop
	jal MeioTempo2
	nop
	
	jal FAs8
	nop
	jal MeioTempo2
	nop
	
	jal FA8
	nop
	jal MeioTempo2
	nop
	
	jal REs8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
#######################
	jal DO16
	nop
	jal MeioTempo
	nop
	
	jal DO16
	nop
	jal MeioTempo2
	nop
	
	jal DO16
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo
	nop
########################
	jal SOL
	nop
	jal MeioTempo2
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo2
	nop
##################################
	jal MeioTempo
	nop
	
	jal REs8
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal MeioTempo2
	nop
################################################################################################################ Sexta linha
	jal DO8
	nop
	jal MeioTempo
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
#################
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	jal MeioTempo
	nop
#######################
	jal DO8
	nop
	jal MeioTempo
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
########################
	jal MI8
	nop
	jal MeioTempo
	nop
	jal MeioTempo
	nop
	
	
############################################################################################## Setima linha
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
#################
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo2
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	jal MeioTempo
	nop
#######################
	jal MI8
	nop
	jal MeioTempo2
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo2
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
#######################
	jal SOL8
	nop
	jal MeioTempo
	nop
	jal MeioTempo
	nop
	jal MeioTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop


###################################################################################################################################
###################################################################################################################################
################################################### Chapeuzinho Vermelho ##########################################################
Chapeuzinho:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
######################
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
######################
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
##########################
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
############################################################################################################ Segunda linha
	jal LA
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	
######################### Repete
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
######################
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
######################
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
##########################
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
############################################################################################################ Terceira linha
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
#####################
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop

	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
######################
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
##########################
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
##################################################################### Quarta linha
	jal LA
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
#####################
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop

	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
######################
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
##########################
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
######################################################################### Quinta linha
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop


###################################################################################################################################
###################################################################################################################################
################################################### Aquarela ######################################################################
Aquarela:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
#########
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
###########	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
######################################################################################### Segunda linha
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE 
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
##################
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
#####################
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
################################################################################################## TERCEIRA LINHA
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
###################
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
######################
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
############################################################################################################ Quarta linha
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
########################################
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
#######################################
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
################################################################################################################# Quinta
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
#########################################3
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
############################################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
############################################
	jal LA
	nop
	jal MeioTempo
	nop

	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
###########################################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
############################################
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
################################################################################################################### SEXTA LINHA
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
########################
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
########################
	jal SI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
######################
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
#########################	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FAs
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop

###################################################################################################################################
###################################################################################################################################
################################################### Jingle Bells ##################################################################
Jingle:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
####	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
###
	jal RE
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
####
	jal RE
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
###
	jal MI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
###################################################################################### proxima linha
	jal MI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
##########
	jal FAs
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
########
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
############
	jal SI
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
############	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
############################################################################ terceira linha
	jal RE
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
####
	jal RE
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
###
	jal MI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
######
	jal MI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
######
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
############################################################################################################### Quarta linha
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
#######
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
#######
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
#######
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
#######
	jal SI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
############################################################################################ Quinta linha
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
#######
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
########
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
########
	jal LA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
#######
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
#######
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
#################################################################################### sexta linha
	jal SI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
#########
	jal SI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
#########
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
#########
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
#########
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
#########
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop


###################################################################################################################################
###################################################################################################################################
################################################### Se essa rua fosse minha #######################################################
SeEssaRua:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
###############
	jal LAm8
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
###############
	jal MI
	nop
	jal UmTempo
	nop
	
	jal SIm8
	nop
	jal UmTempo
	nop
####################################################################################################### Segunda linha
	jal UmTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
#############
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
#############
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
##############
	jal LA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
############################################################################################### Terceira linha
	jal UmTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
#############################	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
##############################
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
###############################	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
########################################################################################## Quarta linha
	jal UmTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
################################
	jal MI
	nop
	jal UmTempo
	nop

	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
###############################
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
###############################
	jal LAm8
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	
	
	
	
	


########################################################################################## Quarta linha
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
################################
	jal MI
	nop
	jal UmTempo
	nop

	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOLs
	nop
	jal MeioTempo
	nop
###############################
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal SIm8
	nop
	jal MeioTempo
	nop
###############################
	jal LAm8
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop



###################################################################################################################################
###################################################################################################################################
################################################### Ciranda, cirandinha ###########################################################
Ciranda:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
######################################################################### Proxima linha
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
#################################################################################### Terceira Linha
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	#jal SOL
	#nop
	#jal MeioTempo
	#nop
############################## Repete
	jal DO8
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
######################################################################### Proxima linha
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal SOL8
	nop
	jal MeioTempo
	nop
	
	jal FA8
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal MI8
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal RE8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
#################################################################################### Terceira Linha
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop


###################################################################################################################################
###################################################################################################################################
################################################### Marcha Soldado ################################################################
MarchaSoldado:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
##################################################### segunda linha
	jal FA 
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
############################################ Repete
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
##################################################### segunda linha
	jal FA 
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal FA
	nop
	jal MeioTempo
	nop
	
	jal MI
	nop
	jal MeioTempo
	nop
	
	jal RE
	nop
	jal MeioTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop


###################################################################################################################################
###################################################################################################################################
################################################### Nona Sinfonia #################################################################
Nona:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
############
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
############
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
############
	jal SI
	nop
	jal UmTempo
	nop	
	jal MeioTempo
	nop

	jal LA
	nop
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
#################################################################################################### SEGUNDA LINHA
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
############
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
############
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
############
	jal LA
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
######################################################################################## Terceira Linha
	jal LA
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
##################
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
##################
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal MeioTempo
	nop
	
	jal DO8
	nop
	jal MeioTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
########################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
#################################################################################################### Quarta linha
	jal SI
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
############
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
############
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
############
	jal LA
	nop
	jal UmTempo
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop


###################################################################################################################################
###################################################################################################################################
################################################### Noite FEliz ###################################################################
NoiteFeliz:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
#####
	jal MI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
####
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MeioTempo
	nop
	
	jal LA
	nop
	jal MeioTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
###
	jal MI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
###
	jal RE8
	nop
	jal UmTempo
	nop

	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
########################################################################### segunda linha
	jal DO8
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
#########
	jal LA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal LA 
	nop
	jal UmTempo
	nop
##########
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
###########
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
############
	jal MI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
###################################################################################### Terceira Linha
	jal LA
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
###########
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
	
	jal LA 
	nop
	jal UmTempo
	nop
###########
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
############
	jal MI
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
############
	jal RE8
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
#############
	jal FA8
	nop
	jal UmTempo
	nop
	
	jal RE8
	nop
	jal UmTempo
	nop
	
	jal SI
	nop
	jal UmTempo
	nop
################################################################################ Quarta Linha
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
##################
	jal MI8
	nop
	jal UmTempo
	nop
	
	jal UmTempo
	nop
##################
	jal DO8
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
####################
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop

	jal RE
	nop
	jal UmTempo
	nop
####################
	jal DO
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop







###################################################################################################################################
###################################################################################################################################
################################################### Twinkle %######################################################################
Twinkle:	
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal UmTempo
	nop
	
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
###################### segunda linha
	jal DO
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
########################################################################### Terceira linha
	jal RE
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal LA
	nop
	jal UmTempo
	nop
	
	jal SOL
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal FA
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal MI
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal RE
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
	jal DO
	nop
	jal UmTempo
	nop
	
		
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
nop

Fim:	nop
