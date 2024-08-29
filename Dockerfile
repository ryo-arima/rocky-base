FROM rockylinux:9.3

WORKDIR /root
RUN dnf update -y
RUN dnf groupinstall -y "Development Tools"
RUN dnf install 'dnf-command(config-manager)' && \
    dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
RUN dnf install -y rpm-build \
                   rpmdevtools \
                   gh

CMD ["echo", "This is Base Image"]
