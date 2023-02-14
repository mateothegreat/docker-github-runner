#!/bin/sh

TOKEN=$(python3 /home/runner/src/register.py)

./config.sh --unattended --disableupdate --url https://github.com/$GITHUB_USERNAME/$GITHUB_REPO --token $TOKEN --labels $LABELS
./run.sh
