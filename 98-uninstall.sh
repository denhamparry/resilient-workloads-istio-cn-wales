source 00-common.sh

set +o errexit

set -x
kubectl delete -f istio-$ISTIO_VERSION.yaml
for i in istio-$ISTIO_VERSION/install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl delete -f $i; done
