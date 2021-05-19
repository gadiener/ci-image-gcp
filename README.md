# Google cloud sdk with kubectl

Docker image with Google Cloud SDK and Kubectl. For use with [CI templates](https://github.com/jobtome-labs/ci-templates/).


It also includes:

 - [kube-score](https://github.com/zegl/kube-score) (v1.2.1) not built from source.
 - [sops](https://github.com/mozilla/sops) (v3.7.1) not built from source.

### Versions
|||
|-|-|
| cloud sdk | 299.0.0-alpine |
| kube-score | 1.2.1 |
| sops | 3.7.1 |

To override these default versions:

`docker build -t gdiener/ci-image-gcp --build-arg CLOUD_SDK_VERSION=v9000 --build-arg KUBE_SCORE_VERSION=v1000 --build-arg SOPS_VERSION=v4000 .`

