== Observações importantes


1ª
É importante lembrar que para usar o upload do pdf das atas é necessário que instalem no ubuntu o imagemagick, por conta da gem paperclip.
A instalação pode ser feita pela central de programas do ubuntu.

2ª
Ao efetuar o dowload do projeto você deve acessar a pasta do mesmo pelo terminal executar o comando bundle install
 Após isso executar o comando rake db:migrate
 para gerar as tabelas.
Lembrando que para utilizar esses comandos, suponho que já tenham o ruby on rails e  rvm já instalados na máquina.

3ª
Ao efetuar um cadastro no sistema você deve criar uma pessoa, que  será sua representação no sistema, as demais pessoas que criar seram outros usuários ou não, dependendo da permissão que lhes forem atribuidas. 


