#!/bin/sh
KEY=`xxd -p -c32 /dev/urandom | head -n1`

if [ ! -f "$EXECFILE" ]; then
	ln -s /usr/bin/fteproxy $EXECFILE
fi

$EXECFILE --mode server \
             --upstream-format $UPSTREAM_FORMAT \
             --downstream-format $DOWNSTREAM_FORMAT \
             --client_ip $CLIENT_IP \
             --client_port $CLIENT_PORT \
             --server_ip $SERVER_IP \
             --server_port $SERVER_PORT \
             --proxy_ip $PROXY_IP \
             --proxy_port $PROXY_PORT \
             --release $RELEASE \
             --key $KEY  &
$EXECFILE --mode client \
             --upstream-format $UPSTREAM_FORMAT \
             --downstream-format $DOWNSTREAM_FORMAT \
             --client_ip $CLIENT_IP \
             --client_port $CLIENT_PORT \
             --server_ip $SERVER_IP \
             --server_port $SERVER_PORT \
             --proxy_ip $PROXY_IP \
             --proxy_port $PROXY_PORT \
             --release $RELEASE \
             --key $KEY

