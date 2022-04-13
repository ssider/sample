# sample-controller

This repository implements a simple controller for watching Foo resources as
defined with a CustomResourceDefinition (CRD).

**Note:** go-get or vendor this package as `k8s.io/sample`.

## Fetch with godep

When NOT using go 1.11 modules, you can use the following commands.

```sh
go get -d k8s.io/sample
cd $GOPATH/src/k8s.io/sample
godep restore
```

### When using go 1.11 modules

When using go 1.11 modules (`GO111MODULE=on`), issue the following
commands --- starting in whatever working directory you like.

```sh
git clone https://github.com/ssider/sample.git
cd sample/cmd
```

Note, however, that if you intend to
generate code then you will also need the
code-generator repo to exist in an old-style location.  One easy way
to do this is to use the command `go mod vendor` to create and
populate the `vendor` directory.

### A Note on kubernetes/kubernetes

If you are developing Kubernetes according to
https://github.com/kubernetes/community/blob/master/contributors/guide/github-workflow.md
then you already have a copy of this demo in
`kubernetes/staging/src/k8s.io/sample-controller` and its dependencies
--- including the code generator --- are in usable locations
(valid for all Go versions).

## Purpose

This is an example of how to build a kube-like controller with a single type.

## Running

**Prerequisite**: Since the sample-controller uses `apps/v1` deployments, the Kubernetes cluster version should be greater than 1.9.

```sh
# assumes you have a working kubeconfig, not required if operating in-cluster
go build -o sample .
./sample -kubeconfig=$HOME/.kube/config

# create a CustomResourceDefinition
kubectl create -f deploy/examples/sample.io_foos.yaml

# create a custom resource of type Foo
kubectl create -f deploy/examples/cr.yaml

# check deployments created through the custom resource
kubectl get deployments
```
