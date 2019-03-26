# Docker WordPress
Configuração simples do docker compose para WordPress (https://br.wordpress.org)

## Instalação
Clone o projeto do repositório https://github.com/isusalec/docker-wordpress

```
git clone git@github.com:isusalec/docker-wordpress.git
```

```
cd docker-wordpress
```

## Iniciar os contêineres com o compose
No mesmo diretório que seu arquivo _docker-compose.yml_, execute o comando a seguir (dependendo do seu ambiente, talvez seja necessário executar docker-compose usando sudo):

```
docker-compose up -d
```

Esse comando inicia os contêineres do Docker especificados em docker-compose.yml. Leva uns minutos para concluir esta etapa. Você verá uma saída semelhante ao seguinte:

```
WARNING: The MYSQL_USER variable is not set. Defaulting to a blank string.
Pulling db (mysql:5.7)...
5.7: Pulling from library/mysql
...
Pulling db-adm (phpmyadmin/phpmyadmin:4.8.5)...
4.8.5: Pulling from phpmyadmin/phpmyadmin
...
Building web
Step 1/11 : FROM php:7.2.16-apache
7.2.16-apache: Pulling from library/php
```

Para verificar se os contêineres estão ativos, digite ```docker-compose ps```. Você deve ver algo como:

```
     Name                    Command               State                  Ports                
-----------------------------------------------------------------------------------------------
app-demo-db       docker-entrypoint.sh mysqld      Up      127.0.0.11:3306->3306/tcp, 33060/tcp
app-demo-db-adm   /run.sh supervisord -n -j  ...   Up      127.0.0.11:8000->80/tcp, 9000/tcp   
app-demo-web      docker-php-entrypoint /bin ...   Up      127.0.0.11:80->80/tcp
```

Agora você pode conectar o WordPress diretamente na VM na porta 80. Abra um navegador da Web e digite o nome do endereço IP de sua VM. Agora você deve ver a tela inicial do WordPress, na qual você pode concluir a instalação e começar a usar o aplicativo.

![](https://isusalec.files.wordpress.com/2019/03/captura-de-tela-de-2019-03-25-23-41-15.png?w=660)

![](https://isusalec.files.wordpress.com/2019/03/captura-de-tela-de-2019-03-25-23-42-42.png?w=660)

![](https://isusalec.files.wordpress.com/2019/03/captura-de-tela-de-2019-03-25-23-43-57.png?w=660)

![](https://isusalec.files.wordpress.com/2019/03/captura-de-tela-de-2019-03-25-23-44-47.png?w=660)

![](https://isusalec.files.wordpress.com/2019/03/captura-de-tela-de-2019-03-25-23-45-20.png?w=660)

![](https://isusalec.files.wordpress.com/2019/03/captura-de-tela-de-2019-03-25-23-48-28.png?w=660)

![](https://isusalec.files.wordpress.com/2019/03/captura-de-tela-de-2019-03-25-23-49-08.png?w=660)
