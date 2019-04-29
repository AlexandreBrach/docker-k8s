FROM debian:stretch
RUN apt-get update \
    && apt-get install -y \
    apt-transport-https \
    curl \
    gnupg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install -y kubectl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/

RUN curl -sL https://github.com/kubernetes/kops/releases/download/1.11.1/kops-linux-amd64 -o /usr/local/bin/kops \
    && chmod +x /usr/local/bin/kops
