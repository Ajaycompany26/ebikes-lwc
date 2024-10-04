#!/bin/bash

# Load environment variables
source .env

# Determine which org to deploy to based on the current branch
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

if [[ "$BRANCH_NAME" == "develop" ]]; then
    # Deploy to Development Org 1
    sfdx force:source:deploy -p ./src --targetusername $DEV_ORG1_USERNAME
elif [[ "$BRANCH_NAME" == "staging" ]]; then
    # Deploy to Staging Org
    sfdx force:source:deploy -p ./src --targetusername $STAGING_ORG_USERNAME
elif [[ "$BRANCH_NAME" == "preprod" ]]; then
    # Deploy to Pre-Production Org
    sfdx force:source:deploy -p ./src --targetusername $PREPROD_ORG_USERNAME
elif [[ "$BRANCH_NAME" == "master" ]]; then
    # Deploy to Production Org
    sfdx force:source:deploy -p ./src --targetusername $PROD_ORG_USERNAME
fi
