Instru�oes de uso:

1. Correr prototype.m
2. Dever� aparecer um janela GUI onde se selecciona
	- Speaker: 	ID do participante
	- Noise:	nenhum ou qual tipo
	- Position:	na sala
3. Clicar no bot�o verde "Next"
4. No ecr� onde se v� "Ol�!", ir� aparecer uma contagem decrescente. Permanecer em sil�ncio, o background est� a ser gravado
5. Ler frase que aparece de seguida no ecr� e carregar em ENTER
6. Durante "Aguarde...", est� novamente a ocorrer a grava��o, pelo que se deve permanecer em sil�ncio
7. Clicar em "Next" para avan�ar. Antes de avan�ar, certificar-se de que a informa��o de speaker, noise e position n�o tem de ser atualizada.

O output do programa consiste em tr�s ficheiros:
	1. Sil�ncio inicial
	2. Frase lida
	3. Sil�ncio final
Cada qual corresponde a um speaker, um tipo de noise, uma position e uma certa sentence, indicados no nome do ficheiro.

Tenha em aten��o para n�o gravar por cima de ficheiros anteriormente gravados.

Posteriormente, ser� feito outro script para concatenar os ficheiros de audio .wav da forma mais conveniente.