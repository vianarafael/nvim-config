# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
+ basic configuration

```bash
# if you ran the commands as root, this uses /root as HOME
mkdir -p ~/.config
# move the repo to the expected path (rename folder to nvim)
mv ~/nvim-config ~/.config/nvim

# on linux
apt install -y build-essential git curl unzip pkg-config lua5.1 liblua5.1-dev luarocks


# on OSX
# install Homebrew if you haven’t yet
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# then install the same development tools
brew install \
  git \
  curl \
  unzip \
  pkg-config \
  lua \
  luarocks \
  make \
  gcc

```
