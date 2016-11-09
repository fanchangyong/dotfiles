#!/usr/bin/env bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 user@host upload_to"
	exit 1
fi

if ! [[ $1 =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+ ]]; then
	echo "Invalid param"
	exit 1
fi

if [[ $2 != "pubkey" ]] && [[ $2 != "authorized" ]]; then
	echo "Invalid subcommand type"
	exit 1
fi

USER_HOST=$1
UPLOAD_TO=$2
USER=$( echo $USER_HOST | cut -f1 -d@ )
HOST=$( echo $USER_HOST | cut -f2 -d@ )

set -x

scp ~/.ssh/id_rsa.pub $USER_HOST:/tmp/id_rsa.pub

if [[ $UPLOAD_TO = 'pubkey' ]]; then
ssh  $USER_HOST <<'ENDSSH1'
	mkdir -p $HOME/.ssh
	chmod 600 $HOME/.ssh
	cd $HOME/.ssh
	mv /tmp/id_rsa.pub id_rsa.pub
	chmod 600 id_rsa.pub
ENDSSH1

else
	ssh  $USER_HOST <<'ENDSSH2'
		mkdir -p $HOME/.ssh
		chmod 700 $HOME/.ssh
		cd $HOME/.ssh
		touch authorized_keys
		chmod 600 authorized_keys
		cat /tmp/id_rsa.pub >> authorized_keys
		rm -f /tmp/id_rsa.pub
ENDSSH2

fi
