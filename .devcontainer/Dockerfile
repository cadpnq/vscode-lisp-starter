FROM debian:stable-slim

ENV USERNAME=vscode
ENV HOME=/home/${USERNAME}
ENV QUICKLISP_HOME=${HOME}/quicklisp

# --- Base OS packages ---
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y --no-install-recommends sbcl curl git rlwrap build-essential ca-certificates gnupg wget unzip
RUN rm -rf /var/lib/apt/lists/*

# --- Install just ---
RUN mkdir -p /usr/local/bin
RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh -o /tmp/install-just.sh
RUN bash /tmp/install-just.sh --to /usr/local/bin
RUN rm /tmp/install-just.sh

# --- Create user ---
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd --gid ${USER_GID} ${USERNAME}
RUN useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}
RUN chown -R ${USERNAME}:${USERNAME} ${HOME}

USER ${USERNAME}
WORKDIR ${HOME}

# --- Install Quicklisp ---
RUN curl -O https://beta.quicklisp.org/quicklisp.lisp
RUN sbcl --non-interactive \
    --load quicklisp.lisp \
    --eval '(quicklisp-quickstart:install :path "/home/vscode/quicklisp")' \
    --eval '(ql-util:without-prompting (ql:add-to-init-file))' \
    --quit
RUN rm quicklisp.lisp

WORKDIR /workspace