#	Desenvolvido_por: Rafael Nascimento 15200084
#	O Programa eh bem intuitivo. E tem as seguintes funcoes:
# 	Habilitar pseudo-instruções


.data
	# 19.190.000-X
	stringMenuPrincipal:	.asciiz "Validador & Crack\n\nEscolha uma opção:\n1- RG\n2- CPF\n3- CNPJ\n\n"
	erroDeEntrada1:	.asciiz "Entrada inválida"
	erroDeEntrada2: .asciiz "Escolha uma opção"
	erroDeEntrada3: .asciiz "Entre com um valor"
	fimDaConsulta:	.asciiz "Fim da Consulta"
	stringMenuRG:	.asciiz "RG - Validador & Crack\n\nEscolha uma opção:\n1- Verificar RG\n2- Gerar RG válido\n3- Gerar código verificador\n\n"
	stringMenuCPF:	.asciiz "CPF - Validador & Crack\n\nEscolha uma opção:\n1- Verificar CPF\n2- Gerar CPF válido\n3- Gerar código verificador\n\n"
	stringMenuCNPJ:	.asciiz "CNPJ - Validador & Crack\n\nEscolha uma opção:\n1- Verificar CNPJ\n2- Gerar CNPJ válido\n3- Gerar código verificador\n\n"
	entreRG:	.asciiz "Entre com o RG:\n\n"
	entreRG8:	.asciiz "Entre com 8 digitos:\n\n"
	erroRG:	.asciiz "O RG deve ter 9 digítos\n"
	erroRG8:	.asciiz "A entrada deve ter 8 digitos\n"
	textoRg8:.asciiz "RG: "
	textoRg:.asciiz "O RG: "
	rgValido:.asciiz " é válido"
	rgInvalido:.asciiz " é inválido"
	ponto: .asciiz "."
	traco: .asciiz "-"
	barraZero: .asciiz "\0"
	RG: .space 16
	RGNum: .space 16
	RGString: .space 32
	RGString8: .space 32
	entreCPF:	.asciiz "Entre com o CPF:\n\n"
	entreCPF9: .asciiz "Entre com 9 digitos:\n\n"
	erroCPF:.asciiz "A entrada deve ter 11 digitos\n"
	erroCPF9:.asciiz "A entrada deve ter 9 digitos\n"
	textoCPF:.asciiz "O CPF: "
	textoCPF9:.asciiz "CPF: "
	CPFString: .space 128
	CPFString9: .space 32
	CPF: .space 16
	barra: .asciiz "/"
	CPFNum:	.space 32
	regiao1: .asciiz "\n\nEmitido em: Distrito Federal, Goiás,\nMato Grosso do Sul ou Tocantins\n "
	regiao2: .asciiz "\n\nEmitido em: Pará, Amazonas,\n     Acre, Amapá, Rondônia\n              ou Roraima\n "
	regiao3: .asciiz "\n\nEmitido em: Ceará, Maranhão\n                 ou Piauí\n "
	regiao4: .asciiz "\n\n   Emitido em: Pernambuco,\nRio Grande do Norte, Paraíba\n               ou Alagoas\n "
	regiao5: .asciiz "\n\n Emitido em: Bahia ou Sergipe\n "
	regiao6: .asciiz "\n\n     Emitido em: Minas Gerais\n "
	regiao7: .asciiz "\n\n  Emitido em: Rio de Janeiro\n         ou Espírito Santo\n "
	regiao8: .asciiz "\n\n      Emitido em: São Paulo\n "
	regiao9: .asciiz "\n\n  Emitido em: Paraná ou Santa\n                 Catarina\n "
	regiao0: .asciiz "\n\nEmitido em: Rio Grande do Sul\n "
	CNPJ: .space 16
	entreCNPJ: .asciiz "Entre com o CNPJ:\n\n"
	textoCNPJ:.asciiz "O CNPJ: "
	textoCNPJ9:.asciiz "CNPJ: "
	entreCNPJ9: .asciiz "Entre com 12 digitos:\n\n"
	erroCNPJ:.asciiz "A entrada deve ter 14 digitos\n"
	erroCNPJ9:.asciiz "A entrada deve ter 12 digitos\n"
	CNPJString:	.space 32
	CNPJString9: 	.space 32
	CNPJNum:	.space 32
.text

menuPrincipal:	la $a0, stringMenuPrincipal
		li $v0, 51
		syscall

		beq $a1, -1, erro1 	#Entrada incorreta
		nop
		beq $a1, -2, Fim 	#Clicou no cancelar
		nop
		beq $a1, -3, erro2 	#Clicou em ok, mas não entrou com nada
		nop
	
		bgt $a0, 3, erro1 	#Usuário entrou com valor maior que 3
		nop
		ble $a0, 0, erro1 	#Usuário entrou com valor menor que 0
		nop
		
		beq $a0, 1, menuRG
		nop
		beq $a0, 2, menuCPF
		nop
		beq $a0, 3, menuCNPJ
		nop

		erro1:	la $a0, erroDeEntrada1 #Entrada inválida
			li $a1, 0
			li $v0, 55
			syscall
			j menuPrincipal
			nop

		erro2:	la $a0, erroDeEntrada2 #Usuário não escolheu nenhuma opção e deu 'Ok'
			li $a1, 0
			li $v0, 55
			syscall
			j menuPrincipal
			nop
					
			
	menuRG:		la $a0, stringMenuRG
			li $v0, 51
			syscall

			beq $a1, -1, erro3 		#Entrada incorreta
			nop
			beq $a1, -2, menuPrincipal 	#Clicou no cancelar
			nop
			beq $a1, -3, erro4 		#Clicou em ok, mas não entrou com nada
			nop
	
			bgt $a0, 3, erro3 		#Usuário entrou com valor maior que 3
			nop
			ble $a0, 0, erro3 		#Usuário entrou com valor menor que 0
			nop
		
			beq $a0, 1, verificarRG		#Verificar Validade de RG
			nop
			
			beq $a0, 2, gerAutomatico	#Gerador de RG Válido
			nop
			
			beq $a0, 3, verificarRG8
			nop

			erro3:	la $a0, erroDeEntrada1 	#Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
				j menuRG
				nop

			erro4:	la $a0, erroDeEntrada2 	#Usuário não escolheu nenhuma opção e deu 'Ok'
				li $a1, 0
				li $v0, 55
				syscall
				j menuRG
				nop
			
						
			
			
	menuCPF:	la $a0, stringMenuCPF
			li $v0, 51
			syscall

			beq $a1, -1, erro5 		#Entrada incorreta
			nop
			beq $a1, -2, menuPrincipal 	#Clicou no cancelar
			nop
			beq $a1, -3, erro6 		#Clicou em ok, mas não entrou com nada
			nop
	
			bgt $a0, 3, erro5 		#Usuário entrou com valor maior que 3
			nop
			ble $a0, 0, erro5 		#Usuário entrou com valor menor que 0
			nop
			
			beq $a0, 1, verificarCPF		#Verificar Validade de RG
			nop
			
			beq $a0, 2, gerAutomaticoCPF	#Gerador de RG Válido
			nop
			
			beq $a0, 3, verificarCPF9
			nop
		
			j Fim
			nop
	
			erro5:	la $a0, erroDeEntrada1 	#Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
				j menuCPF
				nop

			erro6:	la $a0, erroDeEntrada2 	#Usuário não escolheu nenhuma opção e deu 'Ok'
				li $a1, 0
				li $v0, 55
				syscall
				j menuCPF
				nop
			
			
						
	menuCNPJ:	la $a0, stringMenuCNPJ
			li $v0, 51
			syscall

			beq $a1, -1, erro7 		#Entrada incorreta
			nop
			beq $a1, -2, menuPrincipal 	#Clicou no cancelar
			nop
			beq $a1, -3, erro8 		#Clicou em ok, mas não entrou com nada
			nop
	
			bgt $a0, 3, erro7 		#Usuário entrou com valor maior que 3
			nop
			ble $a0, 0, erro7 		#Usuário entrou com valor menor que 0
			nop
			
			beq $a0, 1, verificarCNPJ		#Verificar Validade de CNPJ
			nop
			
			beq $a0, 2, gerAutomaticoCNPJ
			nop
			
			beq $a0, 3, verificarCNPJ9		#Verificar Validade de CNPJ
			nop
			
			j Fim
			nop

			erro7:	la $a0, erroDeEntrada1 	#Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
				j menuCNPJ
				nop

			erro8:	la $a0, erroDeEntrada2 	#Usuário não escolheu nenhuma opção e deu 'Ok'
				li $a1, 0
				li $v0, 55
				syscall
				j menuCNPJ
				nop

############################################################# RG ###################################################################################
############################################################# parte 1 ##############################################################################
############################################################# verificar validade RG ################################################################			

#Verifica se tem nove digitos	
verificarRG:	la $a0, entreRG
		la $a1,	RG
		li $a2, 10 #Número máximo a ser lido
		li $v0, 54
		syscall
		
		beq $a1, -2, menuRG #O usuário clicou em cancelar, então volta
		nop
		beq $a1, -3, erro9 #O usuário clicou em ok, mas não entrou com nenhum valor
		nop
		beq $a1, -4, erro10 #O usuário entrou com um valor acima de 9 digitos
		nop
		
		la $a0, RG
		li $v1, 0
		jal contCaracter
		nop
		move $t1, $v1
		
		beq $t1, 9, calcDigito
		nop
			j erro10
			nop
		
		calcDigito:	li $a0, 0
				jal calcRG #Calcular digito verificador
				nop
				
				move $a0, $v0 #Movendo digito calculo do digito verificar para $a0
				jal verifValRG
				nop
				
				move $a1, $v0
				jal colocaResultadoRG
				nop
				
				move $a1, $v0
				la $a0, RGString
				jal imprimeResultado
				nop
				
				j menuRG
				nop
				
		erro9:	la $a0, erroDeEntrada3 	#Entrada inválida
			li $a1, 0
			li $v0, 55
			syscall
			j verificarRG
			nop
			
		erro10:		la $a0, erroRG 	#Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
			
				j verificarRG
				nop

#Subrotina
contCaracter:	lbu $t0, 0($a0)
		beq $t0, 10, return #Se caracter == '\n'
		nop
			beq $t0, $zero, return #Se caracter == '\0'
			nop
				addi $v1, $v1, 1
				addi $a0, $a0, 1
				j contCaracter
			nop
		return:	jr $ra
		nop	
	
#Calcular digito verificador
calcRG:		li $t2, 0 #inicializa resultado
		li $s0, 2 #inicializa peso da casa
		li $s1, 10 #inicializa 
		la $t0, RG #carrega endereço do RG em $t0
		la $t4, RGNum #Carrega endereço do RGNum em $t4
		
		for:	beq $s0, $s1, continue1
			nop
				lbu $t1, 0($t0)
				addi $t1, $t1, -48 #ASCII em numérico
				sb $t1, 0($t4) #Reescreve na memória em numero
				mult $t1, $s0 #Multiplica pelo peso da casa
				mflo $t1 
				add $t2, $t2, $t1 #soma:=soma+calculo
		
				addi $t0, $t0, 1
				addi $t4, $t4, 1
				addi $s0, $s0, 1
		
				j for
				nop	
				
		continue1:	beq $a0, 1, sairCalcRG
				nop
					lbu $t1, 0($t0) #Transformando o último digito em decimal
					################# Verifica se o ultimo digito é x ou X
					beq $t1, 88, transfDigitoX
					nop
						beq $t1, 120, transfDigitoX
						nop
							j continue0
							nop
						
					transfDigitoX:	li $t1, 10
							j continue3
							nop
					################# Verifica de o ultimo digito é 0
					continue0:	beq $t1, 48, transfDigito11
							nop
								j continue2
								nop		
					transfDigito11:	li $t1, 11
							j continue3
							nop
					################# Transforma ASCII em numero e escreve na memória		
					continue2:	addi $t1, $t1, -48
					continue3:	sb $t1, 0($t4) #Reescreve na memória em numero
				
			sairCalcRG:	li $s1, 11 #Carrega 11 em $s1
					div $t2, $s1 #Divide resultado por 11
					mfhi $t3 #Escreve o resto em $t3
					nop
					subu $v0, $s1, $t3 #Resultado do digito verificador
					jr $ra
			nop		
nop

verifValRG:	la $t0, RG
		lbu $t0, 8($t0)
		
		############################# verifica se o ultimo digito é x ou X
		beq $t0, 88, digitoX
		nop
			beq $t0, 120, digitoX
			nop
				j continue4
				nop	
		digitoX:	li $t0, 10
				j continueDigitoX
				nop
		############################## verifica de o ultimo digito é 0
		continue4:	beq $t0, 48, digito11 
				nop
					j continueVerifVal
					nop	
		digito11:	li $t0, 11
				j continueDigitoX
				nop
		##############################
		continueVerifVal:	addi $t0, $t0, -48 #transforma ASCII em numero e escreve na memória 
		continueDigitoX:	beq $a0, $t0, valido
					nop
						li $v0, 0
						jr $ra
						nop		
					valido:	li $v0, 1
		jr $ra
nop

#Exibe PopUP mostrando a validade
colocaResultadoRG: 	
	li $s0, 6
	li $s1, 0
	
	li $s2, 2
	li $s3, 0
	li $s4, 8
	
	la $t0, textoRg
	la $t1, RGString
	la $t2, RG
	la $t3, ponto
	la $t4, traco
	
	lacoTextoRg:	beq $s0, $s1, lacoNumRg
			nop
				lb $t6, 0($t0)
				sb $t6, 0($t1)
				
				addi $t0, $t0, 1
				addi $t1, $t1, 1
				addi $s1, $s1, 1
				
				j lacoTextoRg
				nop
				
				
	lacoNumRg:	beq $s2, $s3, colocaPonto
			nop
				lb $t6, 0($t2)
				sb $t6, 0($t1)
				
				addi $t2, $t2, 1
				addi $t1, $t1, 1
				addi $s3, $s3, 1
				
				j lacoNumRg
				nop
				
	colocaPonto:	beq $s4, $s3, colocaTraco
			nop
				lb $t7, 0($t3)
				sb $t7, 0($t1)
				addi $s2, $s2, 3
				addi $t1, $t1, 1
				j lacoNumRg
				nop
	
	colocaTraco:	lb $t8, 0($t4)
			sb $t8, 0($t1)
			
			addu $t1, $t1, 1
			lb $t6, 0($t2)
			sb $t6, 0($t1)	
			
			addi $t1, $t1, 1
			nop
	
	li $s0, 0
	li $s1,	10
	li $s2, 12
	
	la $t2, rgValido
	la $t3, rgInvalido
	
	beq $a1, 0, colocaInvalido
	nop
		loopValidade:	beq $s0, $s1, sairColocaRG
				nop
					lb $t0, 0($t2)
					sb $t0, 0($t1)
					addi $t1, $t1, 1
					addi $t2, $t2, 1
					addi $s0, $s0, 1
					li $v0, 1
					j loopValidade
					nop
					
		colocaInvalido:	beq $s0, $s2, sairColocaRG
				nop
					lb $t0, 0($t3)
					sb $t0, 0($t1)
					addi $t1, $t1, 1
					addi $t3, $t3, 1
					addi $s0, $s0, 1
					li $v0, 0
					j colocaInvalido
					nop
	sairColocaRG:	jr $ra
			nop
		
		
imprimeResultado:	li $v0, 55
			syscall 
			jr $ra
			nop
			
			
############################################################# RG ###################################################################################
############################################################# parte 2 ##############################################################################	
############################################################# gerar digito validador ###############################################################		
#Verifica se tem nove digitos	
verificarRG8:	la $a0, entreRG8
		la $a1,	RG
		li $a2, 9 #Número máximo a ser lido
		li $v0, 54
		syscall
		
		beq $a1, -2, menuRG #O usuário clicou em cancelar, então volta
		nop
		beq $a1, -3, erro9a #O usuário clicou em ok, mas não entrou com nenhum valor
		nop
		beq $a1, -4, erro10a #O usuário entrou com um valor acima de 9 digitos
		nop
		
		la $a0, RG
		li $v1, 0
		jal contCaracter
		nop
		move $t1, $v1
		
		beq $t1, 8, calcDigito8
		nop
			j erro10a
			nop
		
		calcDigito8:	li $a0, 1
				jal calcRG #Calcular digito verificador
				nop
				
				move $a0, $v0
				jal digitoVerificador
				nop
				
				jal colocaResultadoRG8
				nop
				
				la $a0, RGString8
				li $a1, 1 
				jal imprimeResultado
				nop
				
				j menuRG
				nop
				
		erro9a:	la $a0, erroDeEntrada3 	#Entrada inválida
			li $a1, 0
			li $v0, 55
			syscall
			j verificarRG8
			nop
			
		erro10a:	la $a0, erroRG8 	#Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
			
				j verificarRG8
				nop	
														
digitoVerificador:	la $t0, RG
			############################# verifica se o ultimo digito é x ou X
			beq $a0, 10, digX
			nop
				beq $a0, 11, dig11
				nop
					j contDigVerif
					nop
					
			digX:	li $a0, 88
				j escreveDigito
				nop
				
			dig11: 	li $a0, 48
				j escreveDigito
				nop
			##############################
			
			contDigVerif:	addi $a0, $a0, 48
			escreveDigito:	sb $a0, 8($t0)	
					nop																																									
																												
			jr $ra
nop		

colocaResultadoRG8: 	
	li $s0, 4
	li $s1, 0
	
	li $s2, 2
	li $s3, 0
	li $s4, 8
	
	la $t0, textoRg8
	la $t1, RGString8
	la $t2, RG
	la $t3, ponto
	la $t4, traco
	
	lacoTextoRg8:	beq $s0, $s1, lacoNumRg8
			nop
				lb $t6, 0($t0)
				sb $t6, 0($t1)
				
				addi $t0, $t0, 1
				addi $t1, $t1, 1
				addi $s1, $s1, 1
				
				j lacoTextoRg8
				nop
				
				
	lacoNumRg8:	beq $s2, $s3, colocaPonto8
			nop
				lb $t6, 0($t2)
				sb $t6, 0($t1)
				
				addi $t2, $t2, 1
				addi $t1, $t1, 1
				addi $s3, $s3, 1
				
				j lacoNumRg8
				nop
				
	colocaPonto8:	beq $s4, $s3, colocaTraco8
			nop
				lb $t7, 0($t3)
				sb $t7, 0($t1)
				addi $s2, $s2, 3
				addi $t1, $t1, 1
				j lacoNumRg8
				nop
	
	colocaTraco8:	lb $t8, 0($t4)
			sb $t8, 0($t1)
			
			addiu $t1, $t1, 1
			lb $t6, 0($t2)
			sb $t6, 0($t1)	
	jr $ra
nop										
			

															
																														
############################################################# RG ###################################################################################
############################################################# parte 3 ##############################################################################
############################################################# gerar rgs válidos ####################################################################

gerAutomatico:	la $t0, RG
		li $s0, 0
	
		gerad:	beq $s0, 8, fimGerad
			nop	
				li $a0, 0 #de 0
				li $a1, 9 #até 9
				li $v0, 42 #random
				syscall 
			
				addiu $a0, $a0, 48
	
				sb $a0, 0($t0) #escreve
				addiu $t0, $t0, 1
				addiu $s0, $s0, 1
				j gerad
				nop
		fimGerad: 	li $a0, 1
				j calcDigito8 #calcula digito validador
				nop
				
				  


																				

																																																									
																					
																						



																																																																																																																																																																																								
																								
																									
																										
############################################################# CPF ###################################################################################
############################################################# parte 1 ##############################################################################
############################################################# verificar validade CPF ################################################################			
verificarCPF:	la $a0, entreCPF
		la $a1,	CPF
		li $a2, 12 #Número máximo a ser lido
		li $v0, 54
		syscall
		
		beq $a1, -2, menuCPF #O usuário clicou em cancelar, então volta
		nop
		beq $a1, -3, erro9c #O usuário clicou em ok, mas não entrou com nenhum valor
		nop
		beq $a1, -4, erro10c #O usuário entrou com um valor acima de 9 digitos
		nop
		
		la $a0, CPF
		li $v1, 0
		jal contCaracter
		nop
		move $t1, $v1
		
		beq $t1, 11, calcDigito9Cpf2
		nop
			j erro10c
			nop
		
		calcDigito9Cpf2:	li $a0, 1
					jal calcCPF #Calcular digito verificador
					nop
				
					move $a0, $v0 #Movendo digito calculo do digito verificar para $a0
					move $a1, $v1
					jal verifValCPF
					nop
				
					move $a1, $v0
					jal colocaResultadoCPF
					nop
					
					beq $v0, 0, continueCPFString
					nop 
						jal regiao
						nop
					nop
				
					continueCPFString:	move $a1, $v0
								la $a0, CPFString
								jal imprimeResultado
								nop
				
					j menuCPF
		nop
				
		erro9c:	la $a0, erroDeEntrada3 	#Entrada inválida
			li $a1, 0
			li $v0, 55
			syscall
			j verificarCPF
			nop
			
		erro10c:	la $a0, erroCPF #Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
			
				j verificarCPF
				nop
		
					
calcCPF:	li $t2, 0 #inicializa resultado
		li $s0, 10 #inicializa peso da casa
		li $s1, 1 #ultima peso de casa
		la $t0, CPF #carrega endereço do CPF em $t0
		#la $t4, CPFNum #Carrega endereço do CPFNum em $t4
		
		forCPF:	beq $s0, $s1, continue1CPF
			nop
				lbu $t1, 0($t0)
				addi $t1, $t1, -48 #ASCII em numérico
				#sb $t1, 0($t4) #Escreva na memória em numero
				mult $t1, $s0 #Multiplica pelo peso da casa
				mflo $t1
				addu $t2, $t2, $t1 #soma:=soma+calculo
				
				addi $t0, $t0, 1
				#addi $t4, $t4, 1
				addi $s0, $s0, -1
				
				j forCPF
				nop
		
		continue1CPF:	li $s2, 11 #Carregando 11
				div $t2, $s2 #Dividindo por 11
				mfhi $t3
				
				subu $t8, $s2, $t3
				
				bgt $t8, 9, verifZero
				nop
					j continue2CPF
					nop
				verifZero:	li $t8, 0 #Guarda primeiro digito
				
		continue2CPF:	li $s0, 11 #inicializa peso da casa
				li $s1, 2  #ultima peso de casa
				la $t0, CPF #carrega endereço do CPF em $t0
				li $t2, 0 #Resultado
				la $t4, CPFNum #Carrega endereço do CPFNum em $t4
				
				
				forCPF2:	beq $s0, $s1, continue3CPF
						nop
							lbu $t1, 0($t0)
							addi $t1, $t1, -48 #ASCII em numérico
							sb $t1, 0($t4) #Escreva na memória em numero
							mult $t1, $s0 #Multiplica pelo peso da casa
							mflo $t1
							addu $t2, $t2, $t1 #soma:=soma+calculo
				
							addi $t0, $t0, 1
							addi $t4, $t4, 1
							addi $s0, $s0, -1
				
							j forCPF2
							nop
				
		continue3CPF:	mult $t8, $s0 #multiplica ultimo peso da casa pelo digito
				mflo $t9 
				addu $t2, $t2, $t9 #soma:=soma+calculo
				
				li $s2, 11 #Carregando 11
				div $t2, $s2 #Dividindo por 11
				mfhi $t9
				
				subu $t9, $s2, $t9
				
				bgt $t9, 9, verifZero1
				nop
					j continue4CPF
					nop
				verifZero1:	li $t9, 0 #Guarda primeiro digito
		continue4CPF:	move $v0, $t8
				move $v1, $t9	
				nop
				
	jr $ra
	nop
nop	

verifValCPF:	la $t0, CPF

		lbu $t1, 9($t0)
		lbu $t2, 10($t0)

		addi $t1, $t1, -48
		addi $t2, $t2, -48
		
		bne $a0, $t1, sair
		nop
			bne $a1, $t2, sair
			nop
				li $v0, 1
				jr $ra
				nop
		sair:	li $v0, 0
			jr $ra
			nop
nop
			
colocaResultadoCPF: 	
	li $s0, 7
	li $s1, 0
	
	li $s2, 3
	li $s3, 0
	li $s4, 9
	
	la $t0, textoCPF
	la $t1, CPFString
	la $t2, CPF
	la $t3, ponto
	la $t4, traco
	la $t5, barra
	
	lacoTextoCpf:	beq $s0, $s1, lacoNumCpf
			nop
				lb $t6, 0($t0)
				sb $t6, 0($t1)
				
				addi $t0, $t0, 1
				addi $t1, $t1, 1
				addi $s1, $s1, 1
				
				j lacoTextoCpf
				nop
				
				
	lacoNumCpf:	beq $s2, $s3, colocaPontoCpf
			nop
				lb $t6, 0($t2)
				sb $t6, 0($t1)
				
				addi $t2, $t2, 1
				addi $t1, $t1, 1
				addi $s3, $s3, 1
				
				j lacoNumCpf
				nop
				
	colocaPontoCpf:	beq $s4, $s3, colocaTracoCpf
			nop
				lb $t7, 0($t3)
				sb $t7, 0($t1)
				addi $s2, $s2, 3
				addi $t1, $t1, 1
				j lacoNumCpf
				nop
	
	colocaTracoCpf:	lb $t8, 0($t4)
			sb $t8, 0($t1)
			addu $t1, $t1, 1
			
			lb $t6, 0($t2)
			sb $t6, 0($t1)	
			addi $t1, $t1, 1
			addi $t2, $t2, 1
			
			lb $t6, 0($t2)
			sb $t6, 0($t1)
			addi $t1, $t1, 1
			nop
	
	li $s0, 0
	li $s1,	10
	li $s2, 12
	
	la $t2, rgValido
	la $t3, rgInvalido
	
	beq $a1, 0, colocaInvalidoCpf
	nop
		loopValidadeCpf:	beq $s0, $s1, sairColocaCPF
				nop
					lb $t0, 0($t2)
					sb $t0, 0($t1)
					addi $t1, $t1, 1
					addi $t2, $t2, 1
					addi $s0, $s0, 1
					li $v0, 1
					j loopValidadeCpf
					nop
					
		colocaInvalidoCpf:	beq $s0, $s2, sairColocaCPF
					nop
					lb $t0, 0($t3)
					sb $t0, 0($t1)
					addi $t1, $t1, 1
					addi $t3, $t3, 1
					addi $s0, $s0, 1
					li $v0, 0
					j colocaInvalidoCpf
					nop
	sairColocaCPF:	jr $ra
nop





















############################################################# CPF ###################################################################################
############################################################# parte 2 ##############################################################################	
############################################################# gerar digito validador ###############################################################		
#Verifica se tem nove digitos	
verificarCPF9:	la $a0, entreCPF9
		la $a1,	CPF
		li $a2, 10 #Número máximo a ser lido
		li $v0, 54
		syscall
		
		beq $a1, -2, menuCPF #O usuário clicou em cancelar, então volta
		nop
		beq $a1, -3, erro9b #O usuário clicou em ok, mas não entrou com nenhum valor
		nop
		beq $a1, -4, erro10b #O usuário entrou com um valor acima de 9 digitos
		nop
		
		la $a0, CPF
		li $v1, 0
		jal contCaracter
		nop
		move $t1, $v1
		
		beq $t1, 9, calcDigito9Cpf
		nop
			j erro10b
			nop
		
		calcDigito9Cpf:	li $a0, 1
				jal calcCPF #Calcular digito verificador
				nop
				
				move $a0, $v0
				move $a1, $v1
				jal digitoVerificadorCpf
				nop
				
				jal colocaResultadoCPF9
				nop
				
				la $a0, CPFString9
				li $a1, 1 
				jal imprimeResultado
				nop
				
				j menuCPF
				nop
				
		erro9b:	la $a0, erroDeEntrada3 	#Entrada inválida
			li $a1, 0
			li $v0, 55
			syscall
			j verificarCPF9
			nop
			
		erro10b:	la $a0, erroCPF9 	#Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
			
				j verificarCPF9
				nop	
														
digitoVerificadorCpf:	la $t0, CPF
			
			addi $a0, $a0, 48 #Transformando em ASCII
			addi $a1, $a1, 48 #Transformando em ASCII
			sb $a0, 9($t0)
			sb $a1, 10($t0)
				
			nop																																									
																												
			jr $ra
nop		

colocaResultadoCPF9: 	
	li $s0, 5
	li $s1, 0
	
	li $s2, 3
	li $s3, 0
	li $s4, 9
	
	la $t0, textoCPF9
	la $t1, CPFString9
	la $t2, CPF
	la $t3, ponto
	la $t4, traco
	la $t5, barra
	
	lacoTextoCpf9:		beq $s0, $s1, lacoNumCpf9
				nop
				lb $t6, 0($t0)
				sb $t6, 0($t1)
				
				addi $t0, $t0, 1
				addi $t1, $t1, 1
				addi $s1, $s1, 1
				
				j lacoTextoCpf9
				nop
				
				
	lacoNumCpf9:		beq $s2, $s3, colocaPontoCpf9
				nop
				lb $t6, 0($t2)
				sb $t6, 0($t1)
				
				addi $t2, $t2, 1
				addi $t1, $t1, 1
				addi $s3, $s3, 1
				
				j lacoNumCpf9
				nop
				
	colocaPontoCpf9:	beq $s4, $s3, colocaTracoCpf9
				nop
				lb $t7, 0($t3)
				sb $t7, 0($t1)
				addi $s2, $s2, 3
				addi $t1, $t1, 1
				j lacoNumCpf9
				nop
	
	colocaTracoCpf9:	lb $t8, 0($t4)
				sb $t8, 0($t1)
				addu $t1, $t1, 1
			
				lb $t6, 0($t2)
				sb $t6, 0($t1)	
				addi $t1, $t1, 1
				addi $t2, $t2, 1
			
				lb $t6, 0($t2)
				sb $t6, 0($t1)
				addi $t1, $t1, 1
				nop
	jr $ra
nop	
	
############################################################# CPF ###################################################################################
############################################################# parte 3 ##############################################################################
############################################################# gerar CPFs válidos ####################################################################
gerAutomaticoCPF:	la $t0, CPF
			li $s0, 0
	
			geradCPF:	beq $s0, 9, fimGeradCPF
			nop	
				li $a0, 0 #de 0
				li $a1, 9 #até 9
				li $v0, 42 #random
				syscall 
			
				addiu $a0, $a0, 48
	
				sb $a0, 0($t0) #escreve
				addiu $t0, $t0, 1
				addiu $s0, $s0, 1
				j geradCPF
				nop
		fimGeradCPF: 	li $a0, 1
				j calcDigito9Cpf #calcula digito validador
				nop	
				
						
############################################################# Regiao CPF ####################################################################								
regiao:
	la $s0, CPFString #Carrega endereço do CPF
	lb $t0, 17($s0) #Carrega o novo dígito do cpf
	addiu $t0, $t0, -48 #Convertendo pra ASCII
	addiu $s0, $s0, 30 #Apontando para o último espaço na memória

	beq $t0, 0, reg0
	nop
	beq $t0, 1, reg1
	nop
	beq $t0, 2, reg2
	nop
	beq $t0, 3, reg3
	nop
	beq $t0, 4, reg4
	nop
	beq $t0, 5, reg5
	nop
	beq $t0, 6, reg6
	nop
	beq $t0, 7, reg7
	nop
	beq $t0, 8, reg8
	nop
		j reg9
	nop

	reg0: 	li $t2, 0 #inicializa $t2
		li $t1, 33 #Quantidade de caracter
		la $t3, regiao0
	
		lacoReg0:	beq $t2, $t1, fimReg0
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg0
				nop
		fimReg0:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop


	reg1: 	li $t2, 0 #inicializa $t2
		li $t1, 73 #Quantidade de caracter
		la $t3, regiao1
	
		lacoReg1:	beq $t2, $t1, fimReg1
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg1
				nop
		fimReg1:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop


	reg2: 	li $t2, 0 #inicializa $t2
		li $t1, 85 #Quantidade de caracter
		la $t3, regiao2
	
		lacoReg2:	beq $t2, $t1, fimReg2
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg2
				nop
		fimReg2:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop

	reg3: 	li $t2, 0 #inicializa $t2
		li $t1, 57 #Quantidade de caracter
		la $t3, regiao3
	
		lacoReg3:	beq $t2, $t1, fimReg3
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg3
				nop
		fimReg3:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop

	reg4: 	li $t2, 0 #inicializa $t2
		li $t1, 85 #Quantidade de caracter
		la $t3, regiao4
	
		lacoReg4:	beq $t2, $t1, fimReg4
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg4
				nop
		fimReg4:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop

	reg5: 	li $t2, 0 #inicializa $t2
		li $t1, 33 #Quantidade de caracter
		la $t3, regiao5
	
		lacoReg5:	beq $t2, $t1, fimReg5
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg5
				nop
		fimReg5:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop

	reg6: 	li $t2, 0 #inicializa $t2
		li $t1, 33 #Quantidade de caracter
		la $t3, regiao6
	
		lacoReg6:	beq $t2, $t1, fimReg6
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg6
				nop
		fimReg6:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop

	reg7: 	li $t2, 0 #inicializa $t2
		li $t1, 60 #Quantidade de caracter
		la $t3, regiao7
	
		lacoReg7:	beq $t2, $t1, fimReg7
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg7
				nop
		fimReg7:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop

	reg8: 	li $t2, 0 #inicializa $t2
		li $t1, 32 #Quantidade de caracter
		la $t3, regiao8
	
		lacoReg8:	beq $t2, $t1, fimReg8
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg8
				nop
		fimReg8:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop

	reg9: 	li $t2, 0 #inicializa $t2
		li $t1, 59 #Quantidade de caracter
		la $t3, regiao9
	
		lacoReg9:	beq $t2, $t1, fimReg9
				nop
					lb $t4, 0($t3)
					sb $t4, 0($s0)
					addiu $t2, $t2, 1
					addiu $t3, $t3, 1
					addiu $s0, $s0, 1
					j lacoReg9
				nop
		fimReg9:	la $t3, barraZero
				lb $t4, 0($t3)
				sb $t4, 0($s0)
				jr $ra
				nop
	nop
nop		

																										
																																																																																																																																																																																														

																																																								
																													

############################################################# CNPJ ###################################################################################
############################################################# parte 1 ##############################################################################
############################################################# verificar validade CNPJ ################################################################			
verificarCNPJ:	la $a0, entreCNPJ
		la $a1,	CNPJ
		li $a2, 15 #Número máximo a ser lido
		li $v0, 54
		syscall
		
		beq $a1, -2, menuCNPJ #O usuário clicou em cancelar, então volta
		nop
		beq $a1, -3, erro9d #O usuário clicou em ok, mas não entrou com nenhum valor
		nop
		beq $a1, -4, erro10d #O usuário entrou com um valor acima de 9 digitos
		nop
		
		la $a0, CNPJ
		li $v1, 0
		jal contCaracter
		nop
		move $t1, $v1
		
		beq $t1, 14, calcDigito9CNPJ2
		nop
			j erro10d
			nop
		
		calcDigito9CNPJ2:	li $a0, 1
					jal calcCNPJ #Calcular digito verificador
					nop
				
					move $a0, $v0 #Movendo digito calculo do digito verificar para $a0
					move $a1, $v1
					jal verifValCNPJ
					nop
				
					move $a1, $v0
					jal colocaResultadoCNPJ
					nop
					
					move $a1, $v0
					la $a0, CNPJString
					jal imprimeResultado
					nop
				
					j menuCNPJ
		nop
				
		erro9d:	la $a0, erroDeEntrada3 	#Entrada inválida
			li $a1, 0
			li $v0, 55
			syscall
			j verificarCNPJ
			nop
			
		erro10d:	la $a0, erroCNPJ #Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
			
				j verificarCNPJ
				nop
nop				

calcCNPJ:	li $t2, 0 #inicializa resultado
		li $s0, 5 #inicializa peso da casa 1
		li $s1, 1 #inicializa peso da ultima casa 1
		li $s2, 9 #inicializa peso da casa 2
		li $s3, 1 #inicializa peso da ultima casa 2
		la $t0, CNPJ #Carrega endereço de CNPJ
		
		forCNPJ:	beq $s0, $s1, continue1CNPJ
				nop
					lbu $t1, 0($t0) #carrega primeiro digito
					addi $t1, $t1, -48 #converte ASCII para numero
					mult $t1, $s0
					mflo $t1
					nop
					addu $t2, $t2, $t1 #soma:=soma+calculo
					
					addiu $t0, $t0, 1
					addiu $s0, $s0, -1
					
					j forCNPJ
					nop
					
		continue1CNPJ:	beq $s2, $s3, continue2CNPJ
				nop
					lbu $t1, 0($t0)
					addiu $t1, $t1, -48 #converte ASCII para numero
					mult $t1, $s2 
					mflo $t1
					nop
					add $t2, $t2, $t1 #soma:=soma+calculo
					
					addiu $t0, $t0, 1
					addiu $s2, $s2, -1
					
					j continue1CNPJ
				nop
					
		continue2CNPJ:	li $s4, 11 #carrega 11
				div $t2, $s4
				mfhi $t3
				
				blt $t3, 2, digZeroCNPJ1 #se o resto for menor que 2
				nop
					j continue3CNPJ
					nop
				digZeroCNPJ1:	li $t8, 0
						j continue4CNPJ
						nop
		continue3CNPJ:	subu $t8, $s4, $t3 #PRIMEIRO DIGITO
				nop
				
				
	
		continue4CNPJ:	li $t2, 0 #inicializa resultado
				li $s0, 6 #inicializa peso da casa 1
				li $s1, 1 #inicializa peso da ultima casa 1
				li $s2, 9 #inicializa peso da casa 2
				li $s3, 2 #inicializa peso da ultima casa 2
				la $t0, CNPJ #Carrega endereço de CNPJ
				la $s7, CNPJNum #Carrega endereço de CNPJNum em $s7
				
				forCNPJ1:	beq $s0, $s1, continue5CNPJ
						nop
							lbu $t1, 0($t0) #carrega primeiro digito
							addi $t1, $t1, -48 #converte ASCII para numero
							sb $t1, 0($s7) #escreve na memória
							mult $t1, $s0
							mflo $t1
							nop
							addu $t2, $t2, $t1 #soma:=soma+calculo
					
							addiu $t0, $t0, 1
							addiu $s7, $s7, 1
							addiu $s0, $s0, -1
					
							j forCNPJ1
						nop
						
				continue5CNPJ:	beq $s2, $s3, continue6CNPJ
						nop
							lbu $t1, 0($t0) #carrega primeiro digito
							addiu $t1, $t1, -48 #converte ASCII para numero
							sb $t1, 0($s7) #escreve na memória
							mult $t1, $s2 
							mflo $t1
							nop
							add $t2, $t2, $t1 #soma:=soma+calculo
					
							addiu $t0, $t0, 1
							addiu $s2, $s2, -1
					
							j continue5CNPJ
							nop
						nop
				continue6CNPJ:	mult $t8, $s2
						mflo $t1
						nop
						add $t2, $t2, $t1 #soma:=soma+calculo
				continue7CNPJ:	li $s4, 11 #carrega 11
						div $t2, $s4
						mfhi $t3
				
						blt $t3, 2, digZeroCNPJ2 #se o resto for menor que 2
						nop
							j continue8CNPJ
						nop
						digZeroCNPJ2:	li $t9, 0
								j continue9CNPJ
								nop
				continue8CNPJ:	subu $t9, $s4, $t3 #SEGUNDO DIGITO
						nop
				continue9CNPJ:	move $v0, $t8 #valores de retorno
						move $v1, $t9 #valores de retorno
						nop
		nop
		jr $ra
		nop
nop

verifValCNPJ:	la $t0, CNPJ

		lbu $t1, 12($t0)
		lbu $t2, 13($t0)

		addi $t1, $t1, -48
		addi $t2, $t2, -48
		
		bne $a0, $t1, sairCNPJ
		nop
			bne $a1, $t2, sairCNPJ
			nop
				li $v0, 1
				jr $ra
				nop
				
		sairCNPJ:	li $v0, 0
				jr $ra
				nop
nop

colocaResultadoCNPJ: 	
	li $s0, 8
	li $s1, 0
	
	li $s2, 2
	li $s3, 0
	li $s4, 8
	
	la $t0, textoCNPJ
	la $t1, CNPJString
	la $t2, CNPJ
	la $t3, ponto
	la $t4, traco
	la $t5, barra
	
	lacoTextoCNPJ:	beq $s0, $s1, lacoNumCNPJ
			nop
				lb $t6, 0($t0)
				sb $t6, 0($t1)
				
				addi $t0, $t0, 1
				addi $t1, $t1, 1
				addi $s1, $s1, 1
				
				j lacoTextoCNPJ
				nop
				
				
	lacoNumCNPJ:	beq $s2, $s3, colocaPontoCNPJ
			nop
				lb $t6, 0($t2)
				sb $t6, 0($t1)
				
				addi $t2, $t2, 1
				addi $t1, $t1, 1
				addi $s3, $s3, 1
				
				j lacoNumCNPJ
				nop
				
	colocaPontoCNPJ:	beq $s4, $s3, colocaBarraCNPJ
				nop
					lb $t7, 0($t3)
					sb $t7, 0($t1)
					addi $s2, $s2, 3
					addi $t1, $t1, 1
					j lacoNumCNPJ
				nop
	
	colocaBarraCNPJ:	lb $t8, 0($t5)
				sb $t8, 0($t1)
				addiu $t1, $t1, 1
				
				
				li $t6, 0
				li $t7, 4
				
				loopBarra:	beq $t6, $t7, colocaTracoCNPJ 
						nop
							lb $t8, 0($t2)
							sb $t8, 0($t1)
							addiu $t1, $t1, 1 
							addiu $t2, $t2, 1
							addiu $t6, $t6, 1
							j loopBarra
						nop
				nop
				
	colocaTracoCNPJ:	lb $t8, 0($t4)
				sb $t8, 0($t1)
				addiu $t1, $t1, 1 
				
				#Primeiro Digito Verificador
				lb $t8, 0($t2)
				sb $t8, 0($t1)
				addiu $t1, $t1, 1 
				addiu $t2, $t2, 1
				
				#Segundo Digito Verificador
				lb $t8, 0($t2)
				sb $t8, 0($t1)
				addiu $t1, $t1, 1 
				addiu $t2, $t2, 1
				
	
	li $s0, 0
	li $s1,	10
	li $s2, 12
	la $t2, rgValido
	la $t3, rgInvalido
	
	beq $a1, 0, colocaInvalidoCNPJ
	nop
		loopValidadeCNPJ:	beq $s0, $s1, sairColocaCNPJ
					nop
						lb $t0, 0($t2)
						sb $t0, 0($t1)
						addi $t1, $t1, 1
						addi $t2, $t2, 1
						addi $s0, $s0, 1
						li $v0, 1
						j loopValidadeCNPJ
					nop
					
		colocaInvalidoCNPJ:	beq $s0, $s2, sairColocaCNPJ
					nop
						lb $t0, 0($t3)
						sb $t0, 0($t1)
						addi $t1, $t1, 1
						addi $t3, $t3, 1
						addi $s0, $s0, 1
						li $v0, 0
						j colocaInvalidoCNPJ
					nop
	sairColocaCNPJ:	jr $ra
			nop
nop	

																																																											
																																																																																																																																							
																															

############################################################# CNPJ ###################################################################################
############################################################# parte 2 ##############################################################################	
############################################################# gerar digito validador ###############################################################		
	
verificarCNPJ9:	la $a0, entreCNPJ9
		la $a1,	CNPJ
		li $a2, 13 #Número máximo a ser lido
		li $v0, 54
		syscall
		
		beq $a1, -2, menuCNPJ #O usuário clicou em cancelar, então volta
		nop
		beq $a1, -3, erro9e #O usuário clicou em ok, mas não entrou com nenhum valor
		nop
		beq $a1, -4, erro10e #O usuário entrou com um valor acima de 12 digitos
		nop
		
		la $a0, CNPJ
		li $v1, 0
		jal contCaracter
		nop
		move $t1, $v1
		
		beq $t1, 12, calcDigito9CNPJ
		nop
			j erro10e
			nop
		
		calcDigito9CNPJ:	li $a0, 1
					jal calcCNPJ #Calcular digito verificador
					nop
				
					move $a0, $v0
					move $a1, $v1
					jal digitoVerificadorCNPJ
					nop
				
					jal colocaResultadoCNPJ9
					nop
				
					la $a0, CNPJString9
					li $a1, 1 
					jal imprimeResultado
					nop
				
					j menuCNPJ
					nop
				
		erro9e:	la $a0, erroDeEntrada3 	#Entrada inválida
			li $a1, 0
			li $v0, 55
			syscall
			j verificarCNPJ9
			nop
			
		erro10e:	la $a0, erroCNPJ9 	#Entrada inválida
				li $a1, 0
				li $v0, 55
				syscall
			
				j verificarCNPJ9
				nop	
														
digitoVerificadorCNPJ:	la $t0, CNPJ
			
			addi $a0, $a0, 48 #Transformando em ASCII
			addi $a1, $a1, 48 #Transformando em ASCII
			sb $a0, 12($t0)
			sb $a1, 13($t0)
				
			nop																																									
																												
			jr $ra
nop		


colocaResultadoCNPJ9: 	
	li $s0, 6
	li $s1, 0
	
	li $s2, 2
	li $s3, 0
	li $s4, 8
	
	la $t0, textoCNPJ9
	la $t1, CNPJString9
	la $t2, CNPJ
	la $t3, ponto
	la $t4, traco
	la $t5, barra
	
	lacoTextoCNPJ9:	beq $s0, $s1, lacoNumCNPJ9
			nop
				lb $t6, 0($t0)
				sb $t6, 0($t1)
				
				addi $t0, $t0, 1
				addi $t1, $t1, 1
				addi $s1, $s1, 1
				
				j lacoTextoCNPJ9
				nop
				
				
	lacoNumCNPJ9:	beq $s2, $s3, colocaPontoCNPJ9
			nop
				lb $t6, 0($t2)
				sb $t6, 0($t1)
				
				addi $t2, $t2, 1
				addi $t1, $t1, 1
				addi $s3, $s3, 1
				
				j lacoNumCNPJ9
				nop
				
	colocaPontoCNPJ9:	beq $s4, $s3, colocaBarraCNPJ9
				nop
					lb $t7, 0($t3)
					sb $t7, 0($t1)
					addi $s2, $s2, 3
					addi $t1, $t1, 1
					j lacoNumCNPJ9
				nop
	
	colocaBarraCNPJ9:	lb $t8, 0($t5)
				sb $t8, 0($t1)
				addiu $t1, $t1, 1
				
				
				li $t6, 0
				li $t7, 4
				
				loopBarra9:	beq $t6, $t7, colocaTracoCNPJ9 
						nop
							lb $t8, 0($t2)
							sb $t8, 0($t1)
							addiu $t1, $t1, 1 
							addiu $t2, $t2, 1
							addiu $t6, $t6, 1
							j loopBarra9
						nop
				nop
				
	colocaTracoCNPJ9:	lb $t8, 0($t4)
				sb $t8, 0($t1)
				addiu $t1, $t1, 1 
				
				#Primeiro Digito Verificador
				lb $t8, 0($t2)
				sb $t8, 0($t1)
				addiu $t1, $t1, 1 
				addiu $t2, $t2, 1
				
				#Segundo Digito Verificador
				lb $t8, 0($t2)
				sb $t8, 0($t1)
				addiu $t1, $t1, 1 
				addiu $t2, $t2, 1
	jr $ra
nop	

																																																														
																																	
																																		
																																			
																																				
																																						





############################################################# CPF ###################################################################################
############################################################# parte 3 ##############################################################################
############################################################# gerar CPFs válidos ####################################################################
gerAutomaticoCNPJ:	la $t0, CNPJ
			li $s0, 0
	
			geradCNPJ:	beq $s0, 8, fimGeradCNPJ
					nop	
						li $a0, 0 #de 0
						li $a1, 9 #até 9
						li $v0, 42 #random
						syscall 
			
						addiu $a0, $a0, 48
	
						sb $a0, 0($t0) #escreve
						addiu $t0, $t0, 1
						addiu $s0, $s0, 1
						j geradCNPJ
					nop
			
			fimGeradCNPJ:	li $a0, 0
					addiu $a0, $a0, 48
					sb $a0, 0($t0)
					addiu $t0, $t0, 1
					
					li $a0, 0
					addiu $a0, $a0, 48
					sb $a0, 0($t0)
					addiu $t0, $t0, 1
					
					li $a0, 0
					addiu $a0, $a0, 48
					sb $a0, 0($t0)
					addiu $t0, $t0, 1
					
					li $a0, 0 #de 0
					li $a1, 9 #até 9
					li $v0, 42 #random
					syscall
					addiu $a0, $a0, 48
					sb $a0, 0($t0)
					
					li $a0, 1
					j calcDigito9CNPJ #calcula digito validador
					nop


Fim:	la $a0, fimDaConsulta
	li $a1, 1
	li $v0, 55
	syscall
	nop
