FROM fedora:latest

# Ensure scripts are available for use in next command
COPY ./container/root/scripts/* /scripts/

# - Symlink variant-specific scripts to default location
# - Upgrade base security packages, then clean packaging leftover
# - Add S6 for zombie reaping, boot-time coordination, signal transformation/distribution: @see https://github.com/just-containers/s6-overlay#known-issues-and-workarounds
# - Add goss for local, serverspec-like testing
RUN ln -s /scripts/clean_fedora.sh /clean.sh && \
    ln -s /scripts/security_updates_fedora.sh /security_updates.sh && \
    /bin/bash -e /security_updates.sh && \
    /bin/bash -e /clean.sh && \
    /bin/bash -e /scripts/install_goss.sh && \
    dnf install -y make ShellCheck findutils && \
    dnf clean dbcache

# Overlay the root filesystem from this repo
COPY ./container/root /
COPY . /dotfiles

WORKDIR /dotfiles

RUN make shellcheck && make install

RUN goss --vars /goss_vars.yaml -g /goss.base.yaml validate
