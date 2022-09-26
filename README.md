# Simulação Fórum Publico

O objetivo dessa simulação é criar um fórum onde as pessoas poderiam falar de músicas e de seus assuntos de interesse, no primeira parte da simulação, alguns conceitos foram postos em prática, como as regras do freechains e como ele botava em prática seus conceitos, e por isso alguns testes foram feitos, como o de double-spend, sincronização de nós, usuários trolls tentando entrar no fórum, distribuição de likes, dislikes e outros comandos. Foram usados 10 nós e 15 usuários para a simulação.

A primeira parte da simulação consistiu em dez dias de postagens, com alguns usuários a fim de conseguir reputação para continuar as postagens, testes foram feitos como:
O pioneiro postando e verificando a reputação (que permanece a mesma)
Um usuário entra por meio de um outro nó com perfil de moderador e o pioneiro oferece mais likes para ele continuar se comunicando na rede;
Usuários newbies entram na rede;
Alguns usuários entram na rede e começam a ter conversas em diferentes nós;
Um usuário  tenta fazer um double spend em dois nós separados, mas não tem sucesso nisso;
Trolls constantemente tentam realizar publicações na rede, mas suas mensagens são descartadas;

Após esse período de 10 dias algumas coisas começam a entrar na normalidade, ou seja, as postagens começam a ter alguma espécie de constância e acontece o seguinte caso:
    
Sabrina e Pedro são amigos e gostam dos seus conteúdos, então eles sempre curtem as postagens um do outro;
Maria José algumas vezes da dislike no usuário “fa-da-maria-jose”, por não gostar do conteúdo dele;
Persans distribui um pouco de likes entre os usuários, com o objetivo de incentivar as postagens e também posta para continuar com reputação.
Pamela diversas vezes curte o conteúdo da Tuane e do Guilherme
Guilherme curte o conteúdo da Maria José, e algumas vezes dá dislike no fa-da-maria-jose;
Antonio e Tuane normalmente curtem as mensagens da Maria José
Francisco tem interesse nas mensagens de guilherme.
Eduardo e Ana Maria não costumam curtir muitas publicações.
José Adora o conteúdo de Luiz.
Letícia não costuma curtir postagens, mas sim criar as suas próprias.
Algumas mensagens da Maria José Cururu são mensagens virais, já que ela é uma grande personalidade no fórum
As mensagens do seu “fã” diversas vezes costuma ser ofensiva, então os usuários do fórum decidem dar dislike nessas mensagens.

Após rodar três meses, temos o seguinte resultado:
FORUM FINISHED RUNNING AFTER THREE MONTHS --> Reputations
Maria José REPS
30
anthonio reps:
14
anamariabraga reps:
30
 reps eduardo:
26
 reps jose:
15
 reps francisco:
13
 reps luiz:
30
 reps guilherme: 
26
 reps pamela:
27
 reps tuane:
14
 reps fa-da-maria-jose:
-1
Reps sabrina:
30
Reps samara:
2
Reps persans:
7
Reps Leticia123:
30
Reps Pedro:
30
REPS pioneer:
11

# Conclusão da Simulação

<p>Augustinho carrara permaneceu com 3 reps, mesmo após tentando fazer um double spend para tentar ganhar duas reps a mais. OBS.: Ele ficou inativo após perceber que teria essa dificuldade com o double spend. Reps que ele gostaria de obter no final da iteração: 5 reps; Reps ao final da iteração: 3</p>
<p>Pedro e Sabrina com as reps máximas, já que eles eram usuários ativos no fórum e ambos trocavam likes</p>
<p>Letícia e Luiz com a rep máxima, já que eles eram usuários ativos, mesmo sem curtir publicações de outros usuários</p>
<p> Maria José deve estar com rep máxima, por ser uma usuária ativa e ter bastante curtidas em suas postagens </p>
<p> Antonio, Franciso, José e Tuane são usuários que distribuem likes ativamente, a reputação deles deve estar entre 13-16, que é o número de iterações onde eles ativamente gastaram alguma reputação, e ao mesmo tempo criaram conteúdos novos. </p>
<p>Fã da maria josé deve estar com reputação negativa pelos dislikes que aconteceram com suas publicações, já que eram ofensivas a Maria José</p>
<p> Persans começou com 8 de reputação no inicio da iteração, porém a cada iteração ele criava um novo conteúdo, ganhava reputação e distribuia parte de sua reputação entre os usuários </p>
<p> Apesar de Pamela sempre curtir o conteúdo do Guilherme ou da Tuane, o moderador sempre dava likes em sua publicação para que ela continuasse sendo ativa no fórum</p>
<p> Samara ficou inativa no fórum, então ela não poderia ter aumentado sua reputação </p>
<p> Após os 10 dias de criação do fórum, o pioneiro ficou inativo no fórum e deixou de fazer qualquer operação, e assim
<p> Eduardo e Guilherme sempre curtiam alguma publicação, mas ao mesmo tempo criavam conteúdos relevantes para o fórum, e portanto ambos terminaram com uma reputação de 26</p>
<p> O troll permaneceu sem reputação, já que ele não tinha reputação para postar no fórum </p>

OBS.: Para testar a simulação, basta rodar o arquivo ex.sh
