# Kubernetes Resource

## Installing

```
resource_types:
- name: kubernetes
  type: docker-image
  source:
    repository: xodio/concourse-kubernetes-resource
resources:
- name: kubernetes
  type: kubernetes
  source:
    cluster_url: https://hostname:port
    namespace: default
    cluster_ca: _base64 encoded CA pem_
    admin_key: _base64 encoded key pem_
    admin_cert: _base64 encoded certificate_
    resource_type: deployment
    resource_name: some_pod_name
    container_name: some_container
```

## Source Configuration

* `cluster_url`: *Required.* URL to Kubernetes Master API service
* `namespace`: *Required.* Kubernetes namespace.
* `cluster_ca`: *Optional.* Base64 encoded PEM. Required if `cluster_url` is https.
* `admin_key`: *Optional.* Base64 encoded PEM. Required if `cluster_url` is https.
* `admin_cert`: *Optional.* Base64 encoded PEM. Required if `cluster_url` is https.
* `resource_type`: *Required.* Resource type to operate upon (valid values: `deployment`, `replicationcontroller`, `job`).
* `resource_name`: *Required.* Resource name to operate upon.
* `container_name`: *Optional.* For multi-container pods, specify the name of the container being updated. (Default: resource_name)

#### `out`: Begins Kubernetes Deploy Process

Applies a kubectl action.

#### Parameters
* `image_name`: *Required.* Path to file containing docker image name.
* `image_tag`: *Required.* Path to file container docker image tag.

## Example

### Out
```
---
resources:
- name: k8s
  type: kubernetes
  source:
    cluster_url: https://kube-master.domain.example
    namespace: alpha
    resource_type: deployment
    resource_name: myapp
    container_name: mycontainer
    cluster_ca: _base64 encoded CA pem_
    admin_key: _base64 encoded key pem_
    admin_cert: _base64 encoded certificate pem_
```

```
---
- put: k8s
  params:
    image_name: docker/repository
    image_tag: docker/tag
```
