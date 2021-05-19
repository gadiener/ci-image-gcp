ARG CLOUD_SDK_VERSION=299.0.0-alpine
FROM google/cloud-sdk:${CLOUD_SDK_VERSION}

ARG KUBE_SCORE_VERSION=1.2.1
ARG SOPS_VERSION=3.7.1

LABEL maintainer="Gabriele Diener <g.diener@me.com>, Fabrizio Bellicano <bellicaf@tcd.ie>" \
    image="gdiener/ci-image-gcp" \
    repository="https://github.com/gadiener/ci-image-gcp" \
    vendor="jobtome" \
    description="Docker image with Google Cloud SDK and Kubectl used in CI runners." \
    license="MIT"

RUN apk update && \
    apk add --no-cache \
        coreutils \
        jq \
        gettext

RUN wget -q -O /usr/bin/yq $(wget -q -O - https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.assets[] | select(.name == "yq_linux_amd64") | .browser_download_url') && \
    chmod +x /usr/bin/yq

RUN gcloud components install --quiet kubectl beta

ADD https://github.com/zegl/kube-score/releases/download/v${KUBE_SCORE_VERSION}/kube-score_${KUBE_SCORE_VERSION}_linux_amd64.tar.gz /usr/local/bin/kube-score

ADD https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux /usr/local/bin/sops

RUN chmod +x /usr/local/bin/kube-score && \
    chmod +x /usr/local/bin/sops
