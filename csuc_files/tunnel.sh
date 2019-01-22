#!/bin/bash

# # # # # # # Creación del tunnel
#
# Se necesita copiar la clave publica en el remoto y despues desde el remoto:
# cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
#
#
# Source.
# https://geekland.eu/montar-sistema-archivos-remoto-con-sshfs/


#VARIABLES GLOBALES
EQUIPO=$1
DIRECTORIO=/mnt/$1

#funcion que busca puertos disponibles en local
puerto_disponible(){
	i=4000
    START=4000
	END=4100	
	
	P_DISPO=""
	while [[ $i -le $END ]]
	do
	    #echo "$i" Comprobar si esta ocupado
	    #checkea el puerto en local
	    if lsof -Pi :$i -sTCP:LISTEN -t >/dev/null ; then
	        #echo "running"
	        ((i = i + 1))
	    else
	        #echo "not running"
	        P_DISPO=$i
            ssh-keygen -f "/home/jfarinos/.ssh/known_hosts" -R "[localhost]:$i"
	        #echo $P_DISPO
	        break;
	    fi
	done

}

main(){
	#si empieza por - para el -help o --help
	if [[ "$EQUIPO" == "-"* ]]; then 
		help
		exit 1;
	fi
	#si no se le pasa parametro
	if [ -z "$EQUIPO" ];
	then
           echo "Necesita un parametro: (host) "
                help
	        exit 1;
	fi

    puerto_disponible
    crear_tunnel      
    
}

crear_tunnel(){
    TMPDIR=$DIRECTORIO
    if [ -d "$TMPDIR" ]
    then
        echo "El directorio ${TMPDIR} existe"
    else
        mkdir $TMPDIR
    fi

    LOCALPORT=$P_DISPO
    MAQUINA=$EQUIPO
    REMOTEPORT="2122"
    echo "Puerto utilizado para: "$EQUIPO ": "$LOCALPORT
    #sshpass -p "$contrasena" ssh -o "ServerAliveInterval 60" -fN -L $LOCALPORT:$EQUIPO:$REMOTEPORT -p40022 porta.xgm.cesca.cat 
    ssh -fN -L "$LOCALPORT":"$EQUIPO":"$REMOTEPORT" -p40022 porta.xgm.csuc.cat 
    #se puede debuguear con -odebug
    sshfs -p ${LOCALPORT} jfarinos@localhost:/home/jfarinos/ $DIRECTORIO -o StrictHostKeyChecking=no
    nautilus $DIRECTORIO &
}


help(){
    echo "" 
    echo ""
    echo "###Funcionamiento"
    echo "   arg = 1 -> maquina a la que quieres conectar:"
    echo "   ./tunnel.sh roadmap-pre "
    echo ""
    echo "- - - - - - - - - - -"
    echo ""
    echo "###Para los errores:"
    echo "ssh-keygen -f "/home/jfarinos/.ssh/known_hosts" -R '[localhost]:4000' "

}

main
