FROM rockylinux:9.3

WORKDIR /root
RUN dnf update -y
RUN dnf groupinstall -y "Development Tools"
RUN dnf install 'dnf-command(config-manager)' && \
    dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
RUN dnf install -y rpm-build \
                   rpmdevtools \
                   wget \
                   gh

# Install Go
RUN wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"

CMD ["echo", "This is Base Image"]
