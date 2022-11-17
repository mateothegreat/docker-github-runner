#!/bin/sh

TOKEN=$(python3.8 /home/runner/src/register.py)

./config.sh --unattended --disableupdate --url https://github.com/moodysanalytics/$GITHUB_REPO --token $TOKEN
./run.sh
