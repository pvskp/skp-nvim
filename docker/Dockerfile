FROM ubuntu:22.04

WORKDIR /workdir

RUN apt update && apt upgrade -y && apt install -y wget curl git gcc

RUN  curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz && \
  tar -xzf nvim-linux64.tar.gz && \
  rm -rf nvim-linux64.tar.gz && \
  ln -fs /nvim-linux64/bin/nvim /usr/local/bin/nvim && \
  mkdir -p /root/.config/nvim

COPY . /root/.config/nvim

ENTRYPOINT ["/usr/local/bin/nvim"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]
