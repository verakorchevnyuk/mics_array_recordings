Instruçoes de uso:

1. Correr prototype.m
2. Deverá aparecer um janela GUI onde se selecciona
	- Speaker: 	ID do participante
	- Noise:	nenhum ou qual tipo
	- Position:	na sala
3. Clicar no botão verde "Next"
4. No ecrã onde se vê "Olá!", irá aparecer uma contagem decrescente. Permanecer em silêncio, o background está a ser gravado
5. Ler frase que aparece de seguida no ecrã e carregar em ENTER
6. Durante "Aguarde...", está novamente a ocorrer a gravação, pelo que se deve permanecer em silêncio
7. Clicar em "Next" para avançar. Antes de avançar, certificar-se de que a informação de speaker, noise e position não tem de ser atualizada.

O output do programa consiste em três ficheiros:
	1. Silêncio inicial
	2. Frase lida
	3. Silêncio final
Cada qual corresponde a um speaker, um tipo de noise, uma position e uma certa sentence, indicados no nome do ficheiro.

Tenha em atenção para não gravar por cima de ficheiros anteriormente gravados.

Posteriormente, será feito outro script para concatenar os ficheiros de audio .wav da forma mais conveniente.