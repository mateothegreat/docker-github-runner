import sys

import requests


class GithubClient:

    def __init__(self, username: str, token: str):
        self.auth = (username, token)

    def test_access(self, owner: str, repo: str) -> bool:
        response = requests.get(f'https://api.github.com/repos/{owner}/{repo}',
                                auth=self.auth)

        if response.status_code == 200:
            return True
        else:
            print(f"{response.status_code} error accessing repo {owner}/{repo}, is the token valid? ({response.text}")

    def get_runners(self, owner: str, repo: str):
        response = requests.get(f'https://api.github.com/repos/{owner}/{repo}/actions/runners',
                                auth=self.auth)

        if response.status_code == 200:
            return response.json()
        else:
            print(f"{response.status_code} error listing current runners for {owner}/{repo}, is the token valid? ({response.text}")
            sys.exit(1)

    def runner_create(self, owner: str, repo: str) -> str:
        return requests.post(f'https://api.github.com/repos/{owner}/{repo}/actions/runners/registration-token',
                             auth=self.auth).json()['token']

    def runner_delete(self, owner: str, repo: str, id: str):
        return requests.delete(f'https://api.github.com/repos/{owner}/{repo}/actions/runners/{id}',
                               auth=self.auth)
