source 00-common.sh

# SEE: https://preliminary.istio.io/docs/setup/kubernetes/helm-install/#option-1-install-with-helm-via-helm-template

set -x

yq d -i istio-$ISTIO_VERSION/install/kubernetes/helm/istio/requirements.yaml 'dependencies[15]' # remove istio-cni in >=snapshot.3
$HELM repo add istio.io https://storage.googleapis.com/istio-release/releases/$ISTIO_VERSION/charts
$HELM dep update istio-$ISTIO_VERSION/install/kubernetes/helm/istio

for i in istio-$ISTIO_VERSION/install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done
echo 1
cat istio-$ISTIO_VERSION/install/kubernetes/namespace.yaml > istio-$ISTIO_VERSION.yaml
echo 2
$HELM template \
    istio-$ISTIO_VERSION/install/kubernetes/helm/istio \
    --name istio \
    --namespace istio-system \
    >> istio-$ISTIO_VERSION.yaml
    # --set tracing.enabled=true \
    # --set grafana.enabled=true \
    # --set prometheus.enabled=true \
    # --set servicegraph.enabled=true \
    # --set global.mTLS.enabled=true \
    # --set kiali.enabled=true \
echo 3
kubectl apply -f istio-$ISTIO_VERSION.yaml
echo 4
kubectl label namespace default istio-injection=enabled
