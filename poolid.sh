#!/bin/bash

# define your Azure DevOps personal access token
TOKEN="6sttarlzoikjfr2ycadg24zqtdgl2hoc5nfslidp52u34ojf6l6q"

# define your Azure DevOps organization
ORGANIZATION="furkanakgun81"

# get the list of agent pools
AGENT_POOLS=$(curl -s -u ":$TOKEN" "https://dev.azure.com/$ORGANIZATION/_apis/distributedtask/pools?api-version=6.0-preview")

# check if curl command failed
if [ $? -ne 0 ]; then
  echo "Failed to fetch agent pools"
  exit 1
fi

# parse the agent pools
POOL_IDS_AND_NAMES=$(echo $AGENT_POOLS | jq -r '.value[] | "\(.id) \(.name)"')

echo "Pool IDs and Names:"
echo "$POOL_IDS_AND_NAMES"