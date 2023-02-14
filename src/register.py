#!/usr/bin/env python3
import json
import os
import sys

import dotenv

from GithubClient import GithubClient

dotenv.load_dotenv()

github_repo = os.getenv("GITHUB_REPO")
github_username = os.getenv('GITHUB_USERNAME')
github_access_token = os.getenv('GITHUB_ACCESS_TOKEN')

failed = False

if github_repo is None:
    sys.stderr.write("Missing GITHUB_REPO env variable!\n")
    failed = True

if github_username is None:
    sys.stderr.write("Missing GITHUB_USERNAME env variable!\n")
    failed = True

if github_access_token is None:
    sys.stderr.write("Missing GITHUB_ACCESS_TOKEN env variable!\n")
    failed = True

if failed:
    exit(1)


github_client = GithubClient(github_username, github_access_token)

if not github_client.test_access(github_username, github_repo):
    sys.exit(1)

runners = github_client.get_runners(github_username, github_repo)

if runners['total_count'] > 0:

    for runner in runners['runners']:
        if runner["status"] == "offline":
            result = github_client.runner_delete(github_username, github_repo, runner['id'])

registration_token = github_client.runner_create(github_username, github_repo)

print(registration_token)
