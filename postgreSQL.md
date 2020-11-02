# Installation

pour installer pstgresql :

sudo apt install postgresql

Cela rajoute l'utilisateur postgres à l'OS. 
postgres serait le seul utilisateur capable de lancer psql.
Apparemment il ne serait même pas nécessaire de modifier le mdp (pour un qu'on connait) pour des raisons de sécurité.


Ensuite : 
sudo -i -u postgres
Pour se conecter sous le user postgres en root.

De la :
psql qui est un petit peu l'équivalent de su poyr postgresql.

Dans ce mode : 
        \h pour l'aide-mémoire des commandes SQL
        \? pour l'aide-mémoire des commandes psql
        \g ou point-virgule en fin d'instruction pour exécuter la requête
        \q pour quitter


Pour gérer les méthodes d'authentification il faut toucher à ce fichier : 
sudo nano /etc/postgresql/x.x/main/pg\_hba.conf 

...
# Database administrative login by Unix domain socket
local   all             postgres                                peer

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     md5
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
...

C'est local all all qu'il faut chnager pour md5
Local all postgres peut rester en peer.
Penser a redémarrer le service après modification du fichier : 
sudo service postgresql restart

Ensuite on créé l'utilisateur et 

$ sudo -i -u postgres
$ createuser -P --interactive <nom_utilisateur>
Enter password for new role:
Enter it again:
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) y

Puis on créé la BDD : 
createdb -O <nom_utilisateur> -E UTF8 <ma_database>

En fait il s'agirait plutôt d'un cluster : un groupe de BDD.

Ensuite on peut se connecter à la BDD : 
$ psql -U <nom_utilisateur> <nom_database_de_l_utilisateur>
Mot de passe pour l'utilisateur <nom_utilisateur> :



Pour installer une interface d'administration de la base on peut installer : 
sudo apt install pgadmin3
C'est un logiciel "en dur"...il plante avec avec gtk, Xserver....


Le mieux est de prendre un outil avec interface web :
Mais cela nécessite un serveur http qui supporte le php.

Sur le site d'ubuntu ils recommandent : 
apt install apache2,apache2-doc,mysql-server,php5,libapache2-mod-php5,php5-mysql,phpmyadmin

sudo apt install phppgadmin

Puis ensuite : http://localhost/phppgadmin/ pour acceder à l'interface de configuration de la base.

Il faudra rajouter ici comment installer postgis (traitement de coordonnées GPS)   
