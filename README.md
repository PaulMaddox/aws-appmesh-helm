### Installation

## Install Helm

```bash
$ brew install kubernetes-helm
$ kubectl apply -f <>
$ helm init --service-account tiller
```

## Install AWS App Mesh

```bash
$ git clone 
$ cd aws-appmesh-helm
$ helm install -n aws-appmesh --namespace appmesh-system aws-appmesh-helm
```

## Deploy the demo application

```bash
$ helm install -n aws-appmesh-demo --namespace appmesh-demo aws-appmesh-helm/charts/aws-appmesh-demo
```

## View the AWS App Mesh dashboards

```

```