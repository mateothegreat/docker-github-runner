GH_RUNNER_VERSION=${GH_RUNNER_VERSION:-$(curl --silent "https://api.github.com/repos/actions/runner/releases/latest" | grep tag_name | sed -E 's/.*"v([^"]+)".*/\1/')}

echo "Installing github runner version ${GH_RUNNER_VERSION}"

curl -L -O https://github.com/actions/runner/releases/download/v${GH_RUNNER_VERSION}/actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz

tar -zxf actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz

rm -f actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz

./bin/installdependencies.sh
