FROM google/cloud-sdk:299.0.0-alpine

LABEL maintainer="Gabriele Diener <g.diener@me.com>" \
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

ADD https://github.com/zegl/kube-score/releases/download/v1.2.1/kube-score_1.2.1_linux_amd64.tar.gz /usr/local/bin/kube-score

RUN chmod +x /usr/local/bin/kube-score
