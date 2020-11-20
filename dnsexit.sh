#!/bin/bash

MYIP="None"

function updateIP() {
	RESULT=$(curl -s "https://www.dnsexit.com/RemoteUpdate.sv?login=${LOGIN}&password=${PASSWORD}&host=${HOST}&myip=$1")
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
	echo "Waiting ${INTERVAL}..."
	sleep ${INTERVAL}
}

while true; do
	checkIP;
done;
