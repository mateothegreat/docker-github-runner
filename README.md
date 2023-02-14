# Self-hosted github action runner docker image

Copy `.env.example` to `.env` and fill in the values or set the environment variables
in docker-compose.yaml **first**.

```bash
$ docker-compose up
...
Recreating docker-github-runner_github-runner_1 ... done
Attaching to docker-github-runner_github-runner_1
github-runner_1  | 
github-runner_1  | --------------------------------------------------------------------------------
github-runner_1  | |        ____ _ _   _   _       _          _        _   _                      |
github-runner_1  | |       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      |
github-runner_1  | |      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     |
github-runner_1  | |      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     |
github-runner_1  | |       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     |
github-runner_1  | |                                                                              |
github-runner_1  | |                       Self-hosted runner registration                        |
github-runner_1  | |                                                                              |
github-runner_1  | --------------------------------------------------------------------------------
github-runner_1  | 
github-runner_1  | # Authentication
github-runner_1  | 
github-runner_1  | √ Connected to GitHub
github-runner_1  | 
github-runner_1  | # Runner Registration
github-runner_1  | 
github-runner_1  | √ Runner successfully added
github-runner_1  | √ Runner connection is good
github-runner_1  | 
github-runner_1  | # Runner settings
github-runner_1  | 
github-runner_1  | √ Settings Saved.
github-runner_1  | √ Connected to GitHub
github-runner_1  | 
github-runner_1  | Current runner version: '2.301.1'
github-runner_1  | 2023-02-14 11:18:57Z: Listening for Jobs
```

Build and deploy your docker image somewhere like kubernetes.
