Trabalho final da disciplina de AOC1 em 2016/2

# Programa 1: Jukebox

O programa reproduz músicas conforme a escolha do usuário, assim como o instrumento e velocidade de reprodução. O programa é muito intuitivo, o usuário escolhe a música que deseja tocar, a velocidade (foi criado com várias velocidades, por causa do delay do processador que pode variar em cada máquina) e depois escolhe o instrumento musical.

# Programa 2: Validador de RG, CPF e CNPJ

O programa tem as seguintes funções:

1- Verifica se o RG, CPF ou CNPJ é válido: 
O usuário escolhe no menu qual verificação quer fazer e entra com o número. Então o programa irá fazer o cálculo de validade e dizer se é válido ou inválido.
- Observação 1: funciona com RG de todos os estados, menos do Rio Grande do Sul, porque este tem 10 dígitos no RG. Só funciona com 9 dígitos ou menos e caso tenha menos, deve ser preenchido com zero no começo para completar os nove.
- Observação 2: No caso do CPF também é exibido o estado que foi emitido, baseado no nono digito, que é o digito que representa o estado que foi emitido.

2- Gera RG, CPF ou CNPJ é válido: 
Faz um random dos primeiros dígitos e baseado nos números gerados é realizado o cálculo do(s) dígito(s) verificador (es).

3- Gera código verificador: 
Nessa opção o usuário irá entrar com qualquer número e o programa irá gerar o(s) código(s) verificador(es).
