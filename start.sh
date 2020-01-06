#!/bin/sh
if [ "$RPC_SECRET" != "" ]
then
	echo "rpc-secret=$RPC_SECRET">>/root/.aria2/aria2.conf
fi
aria2c && nginx -g "daemon off;"