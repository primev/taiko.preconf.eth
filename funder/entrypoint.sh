#!/bin/sh

while [ 1 ]
do
    sleep 10
    BIDDER_ADDRESS=$(curl -s bidder:13523/topology| jq -r '.self."Ethereum Address"')
    PROVIDER_ADDRESS=$(curl -s provider:13523/topology| jq -r '.self."Ethereum Address"')

    if [ ! -z $BIDDER_ADDRESS ] && [ ! -z $PROVIDER_ADDRESS ];then
	echo "BIDDER_ADDRESS $BIDDER_ADDRESS"
	echo "PROVIDER_ADDRESS $PROVIDER_ADDRESS"
	cast send --rpc-url ${SETTLEMENT_RPC_ENDPOINT} --private-key ${FUNDER_PRIVATE_KEY} ${BIDDER_ADDRESS} --value=2000ether; if [ $? -ne 0 ];then continue; fi
	cast send --rpc-url ${SETTLEMENT_RPC_ENDPOINT} --private-key ${FUNDER_PRIVATE_KEY} ${PROVIDER_ADDRESS} --value=2000ether ; if [ $? -ne 0 ];then continue; fi

	break
    fi
done
