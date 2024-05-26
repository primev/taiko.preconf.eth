#!/bin/sh

if [ -z ${NODE_TYPE} ];then
    exit
fi

echo "Node Type: ${NODE_TYPE}"
if [ "${NODE_TYPE}" != "bootnode" ]; then
    sleep 12
fi

if [ "${NODE_TYPE}" != "bootnode" ]; then
    TOPOLOGY=$(curl -s bootnode:13523/topology)
    UNDERLAY=$(echo ${TOPOLOGY} | jq -r '.self.Underlay')
    BOOTNODEADDRESS=$(echo ${TOPOLOGY}| jq -r '.self.Addresses[] | select(. | contains("127.0.0.1") | not)')
    BOOTNODES=${BOOTNODEADDRESS}/p2p/${UNDERLAY}
    ./mev-commit --peer-type=${NODE_TYPE} \
	--keystore-path=.mev-commit \
	--keystore-password=${KEY_STORE_PASSWORD} \
	--settlement-rpc-endpoint=${SETTLEMENT_RPC_ENDPOINT} \
	--bootnodes=${BOOTNODES}
	#--l1-rpc-url=${L1_RPC_URL} 
else
    ./mev-commit --peer-type=${NODE_TYPE} \
	--settlement-rpc-endpoint=${SETTLEMENT_RPC_ENDPOINT}  
	#--l1-rpc-url=${L1_RPC_URL} 
fi
