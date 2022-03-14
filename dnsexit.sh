#!/bin/bash

MYIP="None"

function updateIP() {
	if [ -v $APIKEY ]
		then
		RESULT=$(curl -s -k "https://api.dnsexit.com/dns/ud/?apikey=${APIKEY}" -d host="{$HOST}")
		else
		RESULT=$(curl -s "https://www.dnsexit.com/RemoteUpdate.sv?login=${LOGIN}&password=${PASSWORD}&host=${HOST}")
	fi
	RESULT=$(echo $RESULT)
	echo $RESULT;
	if [ "$RESULT" == "HTTP/1.1 200 OK 0=Success" ] || [ "$RESULT" == "HTTP/1.1 200 OK 4=IP not changed. To save our system resources, please don't post updates unless the IP got changed." ]; then
		MYIP=${IP}
	fi
}

function checkIP() {
	IP=$(curl -s "http://ip.dnsexit.com/")
	IP=$(echo $IP)

	if [ "$IP" != "$MYIP" ]; then
		echo "IP has changed from '$MYIP' to '$IP'";
		updateIP $IP
	else
		echo "IP is still '$MYIP'";
	fi
	echo "Waiting ${SLEEP}..."
	sleep ${SLEEP}
}

while true; do
	checkIP;
done;
