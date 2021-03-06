#!/bin/bash

# Create instance profile

# export AWS_PROFILE=cogini-dev

set -e

# IAM role name
ROLE=$1
# Instance profile name
INSTANCE_PROFILE=${2:-$ROLE}

echo "Creating instance profile: $INSTANCE_PROFILE"
aws iam create-instance-profile --instance-profile-name "$INSTANCE_PROFILE"

echo "Adding role to instance profile: $ROLE"
aws add-role-to-instance-profile --instance-profile-name "$INSTANCE_PROFILE" --role-name "$ROLE"
