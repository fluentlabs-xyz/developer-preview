#!/bin/bash
[ ! -d "/root/.acme.sh/rpc.${DOMAIN_NAME}" ] && ~/.acme.sh/acme.sh --issue --standalone \
  -d rpc.${DOMAIN_NAME} \
  -d blockscout.${DOMAIN_NAME} \
  -d genesis-config.${DOMAIN_NAME} \
  -d config.${DOMAIN_NAME} \
  -d explorer.${DOMAIN_NAME} \
  -d staking.${DOMAIN_NAME} \
  -d faucet.${DOMAIN_NAME} || true