#!/bin/bash
DOMAIN=()
PATH=
while [[ $# > 0 ]]
do
        key=$1
        case $key in
                -d|--domain)
			DOMAIN+=("$2")
			shift
                ;;
                -p|--path)
	                PATH=$2
        	        shift
                ;;
                esac
                shift
done
if [ "$DOMAIN" == "" ]
then
	echo "Domain must be entered"
	exit 1
fi
if [ "$PATH" == "" ]
then
	echo "Path must be entered"
	exit 1
fi

if [ ! -d "$PATH" ]
then
	echo "This path does not exist. This must be correct"
	exit 1
fi

LEARGS=
for i in "${DOMAIN[@]}"
do
	LEARGS="$LEARGS -d $i"
done

/root/.local/share/letsencrypt/bin/letsencrypt --text certonly --renew-by-default --webroot --webroot-path $PATH $LEARGS
/usr/local/cpanel/3rdparty/bin/perl /root/ssl/installssl.pl ${DOMAIN[0]}
