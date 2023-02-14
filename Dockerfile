FROM ubuntu

ENV HELM_BASE_URL="https://get.helm.sh"
ENV HELM_3_FILE="helm-v3.11.1-linux-amd64.tar.gz"
ENV PYTHONPATH "/usr/bin/python3"

RUN apt -qq update && \
    apt install -y python3 ca-certificates jq curl bash nodejs > /dev/null && \
    # Install helm version 3:
    curl -Ls ${HELM_BASE_URL}/${HELM_3_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm3 && \
    chmod +x /usr/bin/helm3 && \
    rm -rf linux-amd64 && \
    # Cleanup
    apt -qq clean

COPY . /usr/src/

ENTRYPOINT ["node", "/usr/src/index.js"]