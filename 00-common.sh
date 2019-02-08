set -o errexit
set -o errtrace
set -o pipefail
set -o nounset
shopt -s nullglob

export ISTIO_VERSION=1.1.0-snapshot.5

export Z=europe-west1-b
export C=cnwales1

export HELM_VERSION=2.12.3
export HELM=./darwin-amd64/helm
