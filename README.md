
# SERVEUR COUNTER-STRIKE 1.6

--------------------------------------------------
## UTILISATION DE BASE

### Pour télécharger l'image :

>docker pull sirpixel/cs1.6

### pour exécuter l'image :

>docker run --restart always -p 29005:29005 -p 29015:29015 -p 29015:29015/udp -v /home/docker/cs16:/home/csserver -itd --name cs16 sirpixel/cs1.6

##Bug rencontré lors de la création de l'image

*Il est possible que lors de la première installation le répertoire cstrike ne soit pas complet*
*Pour résoudre ce problème vérifier dans le répertoire "**/home/csserver/serverfiles/steamapps/**" que vous* *avez les fichiers suivant :*

>/home/csserver/serverfiles/steamapps/appmanifest_10.acf
/home/csserver/serverfiles/steamapps/appmanifest_70.acf
/home/csserver/serverfiles/steamapps/appmanifest_90.acf
    
Si ces fichier n'existe pas vous pouvez les télécharger ici

>https://raw.githubusercontent.com/Arkshine/hlds-appmanifest/master/appmanifest_10.acf

*Remplacez la valeur 10 par le chiffre souhaité cela doit correspondre a l'identifiant de l'application fourni par steam ici https://developer.valvesoftware.com/wiki/Steam_Application_IDs.*

Ensuite relancez l'installation autant de fois que nécessaire jusqu’à que vous obteniez la réponse 

>Success! App '90' fully installed.

et que le dossier serverfiles/cstrike contient multiple fichier

### Si vous souhaiter réaliser des modifications (ajouter metamod, etc...) ou vérifier la console vous pouvez exécuter la commande

>docker attach cs16
    
## LISTE DES COMMANDES POSSIBLE

Une fois dans le conteneur vous pouvez utiliser les commandes

> /home/csserver/csserver start   //Pour démarrer le serveur
 /home/csserver/csserver stop    //Pour stoper le serveur
 /home/csserver/csserver restart //Pour redémarrer le server
 /home/csserver/csserver update //Pour mettre a jour le serveur
 /home/csserver/csserver install //Pour installer le serveur
/home/csserver/csserver console  //Pour afficher le serveur

Ou directement en dehors du conteneur

>docker exec cs16 /home/csserver/csserver start   //Pour démarrer le serveur
docker exec cs16 /home/csserver/csserver stop    //Pour stoper le serveur
docker exec cs16 /home/csserver/csserver restart //Pour redémarrer le server
docker exec cs16 /home/csserver/csserver update //Pour mettre a jour le serveur
docker exec cs16 /home/csserver/csserver install //Pour installer le serveur
docker exec cs16 /home/csserver/csserver console  //Pour afficher le serveur

Vous pouvez retrouver la liste complète des commandes et de leur utilité ici
[https://gameservermanagers.com/lgsm/csserver/](https://gameservermanagers.com/lgsm/csserver/)

## Configuration du serveur

Vous pouvez modifier les informations sur le "port, ip, map etc.." ici 

### csserver
>/home/csserver/csserver

### Exemple "server.cfg"
Le fichier server.cfg se trouve dans le dossier "/home/csserver/serverfiles/cstrike"

> // Nom du serveur – Mettez ici le nom de votre serveur hostname "[FR]
> RAGECLIC - CS1.6"
> 
> // Mot de passe rcon (ceci est le mot de passe pour l’administration
> de votre serveur, il ne faut pas le communiquer) rcon_password
> "RageRCon"
> 
> // active le tir-amis mp_friendlyfire 0 // active les les bruits de
> pas mp_footsteps 1 // active l’autoteambalance mp_autoteambalance 1 //
> Ejection automatique du joueur mp_autokick 0 // Autorise la lampe de
> poche mp_flashlight 0 //Punition automatique pour team-killing
> mp_tkpunish 1 //Bloque la caméra des joueurs morts mp_forcecamera 0
> //active la discussion vocal pour les deux équipes sv_alltalk 0
> //Permet de mettre le serveur en pause sv_pausable 0 //Autorise la
> triche sv_cheats 0 //Vérifie l’intégrité des données afin que le
> client et le serveurs aient bien les mêmes fichiers sv_consistency 1
> //Autorise l’upload et le download. (des tags par exemple ou des
> cartes que vous avez ajoutées) sv_allowupload 1 sv_allowdownload 1
> sv_maxspeed 320 // nombre maximum de joueurs en plus ds une team avant
> que l’equilibrage auto de fasse mp_limitteams 2 // nombre maximum
> d’otages tués par un CT avant une punition mp_hostagepenalty 5 //
> active les micros sv_voiceenable 1 // autorise les spectateurs
> mp_allowspectators 1 //Durée de chaque carte (en minute) mp_timelimit
> 25 // durée en secondes laissée aux joueurs pour parler ensemble avant
> un changement de map mp_chattime 10 //Durée avant l’éjection d’un
> joueur qui ne répond plus (en seconde) sv_timeout 65
> 
> // variables de round //Durée ou les joueurs sont immobilisés en début
> de round (en seconde) mp_freezetime 6 //Durée d’un round (en minute)
> mp_roundtime 5 //Montant avec le quelle les joueurs commencent le
> round mp_startmoney 800 //Durée du timer de la bombe mp_c4timer 45
> //Nombre maximum de round avant de changer de carte mp_maxrounds 0
> //Nombre maximum de victoire pour une équipe avant de changer de carte
> mp_winlimit 0 //Durée de protection des joueurs avant le début d’un
> round (en seconde) mp_spawnprotectiontime 5
> 
> // temps minimum entre 2 poses de tag par un même joueur
> decalfrequency 60
> 
> //VARIABLES DE CONNEXION POUR UN TICK 100 //// => A VOUS D’ADAPTER SI
> VOUS SOUHAITEZ UN AUTRE TICK sv_minrate 25000 sv_maxrate 0
> sv_maxupdaterate 101 sv_minupdaterate 50 sv_mincmdrate 50
> sv_maxcmdrate 100
> 
> //VARIABLES DE CONNEXION POUR UN TICK 66 //// => A VOUS D’ADAPTER SI
> VOUS SOUHAITEZ UN AUTRE TICK sv_maxrate 0 sv_minrate 15000
> sv_minupdaterate 30 sv_maxupdaterate 66 sv_mincmdrate 30 sv_maxcmdrate
> 66
> 
> // Logs du serveur //Active l’enregistrement des journaux du serveurs
> (répertoire /logs) variables:on/off log on
> 
> //Enregistre les joueurs bannis sv_logbans 1 sv_logecho 1 sv_logfile 1
> sv_log_onefile 0
> 
> //Divers //Défini si le serveur est un serveur locale ou en ligne
> (Toujours laissé cette variables sur 0) sv_lan 0 //Définis la région
> on se trouve le serveur (Pour l’Europe c’est 3) sv_region 3
> //désactive le système de prix dynamique de valve (très peu de
> serveurs l’utilisent) mp_dynamicpricing 0
> 
> // execute ban files //Le serveur va lire la liste des steam_id bannis
> exec banned_user.cfg //Le serveur va lire la liste des ips bannis exec
> banned_ip.cfg


### SOURCE

Cette image docker a été réalisé avec l'installateur automatique de [https://gameservermanagers.com/](https://gameservermanagers.com/)

Vous pouvez retrouver les informations sur le bug lié au téléchargement de **Counter-Strike** ici

[http://danielgibbs.co.uk/2013/11/hlds-steamcmd-workaround-appid-90/](http://danielgibbs.co.uk/2013/11/hlds-steamcmd-workaround-appid-90/)

### INFORMATION

Vous pouvez nous retrouver sur le forum de la communauté RAGECLIC 

[https://www.rageclic.fr/](https://www.rageclic.fr/)

ou sur le teamspeak 

[ts3.rageclic.fr](ts3server://ts3.rageclic.fr)


