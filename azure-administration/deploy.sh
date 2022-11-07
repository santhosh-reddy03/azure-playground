#!/usr/bin/env bash

# to login if before you perform deployments
az login
# we can also automate the deployment of the vms for testing using bash 

export RESOURCE_GROUP="resource group name"
export AZURE_REGION=centralindia
# $RANDOM - generate a random 5 digit integer
export AZURE_APP_PLAN=popupappplan-$RANDOM
export AZURE_WEB_APP=popupwebapp-$RANDOM

# lists the resource groups available in the subscription
az group list --output table

# to search for particular resource group, use json query params
# formattes according to JMESPath more info -> http://jmespath.org/
az group list --query "[?name == '$RESOURCE_GROUP']"
az appservice plan create --name $AZURE_APP_PLAN --resource-group $RESOURCE_GROUP --location $AZURE_REGION --sku FREE
# to check list of available plans
az appservice plan list --output table

az webapp create --name $AZURE_WEB_APP --resource-group $RESOURCE_GROUP --plan $AZURE_APP_PLAN
az webapp list --output table

# to deploy the github application into webapp service
az webapp deployment source config --name $AZURE_WEB_APP \
 --resource-group $RESOURCE_GROUP --repo-url "https://github.com/Azure-Samples/php-docs-hello-world" \
 --branch master --manual-integration