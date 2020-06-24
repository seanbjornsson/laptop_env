# dev env build, elementary os hera
# inspired heavily by https://github.com/aditya7iyengar/adify

ELIXIR_VERSION="1.10.3"
ERLANG_VERSION="23.0.1"
RUBY_VERSION="2.7.1"
RAILS_VERSION="6.0.3.2"
ASDF_VERSION="0.7.8"
NODEJS_VERSION="12.18.1"

YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

_announce_step() {
  echo -e """$BLUE
==========================================================
$1.......
==========================================================$NC"""
}

_announce_error(){
  echo -e """
$RED[\u2717] $1 $NC
  """
  exit 1
}

_announce_success() {
  echo -e """
$GREEN[\u2713] $1 $NC
  """
}

_announce_info() {
  echo -e """$BLUE
---> $1 $NC
  """
}

 _announce_step "Update package info"
sudo apt -y update
 _announce_step "Upgrade all packages"
sudo apt -y full-upgrade

# https://github.com/asdf-vm/asdf-erlang#ubuntu-1604-lts-xenial-xerus
 _announce_step "Installing Eerlang Dependencies"
sudo apt -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop

# https://github.com/asdf-vm/asdf-nodejs#linux-debian
 _announce_step "Installing NodeJS Dependencies"
sudo apt -y install dirmngr gpg
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

 _announce_step "Installing git"
sudo apt -y install git-all

 _announce_step "Installing zsh"
sudo apt -y install zsh

 _announce_step "Installing Oh My Zsh (make sure to accept default shell!)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

 _announce_step "Installing asdf"
git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf --branch v${ASDF_VERSION}
echo -e "\n. ${HOME}/.asdf/asdf.sh" >> ${HOME}/.zshrc
echo -e "\n. ${HOME}/.asdf/completions/asdf.bash" >> ${HOME}/.zshrc
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
 _announce_success "Succesfully installed Erlang"

 _announce_step "Installing Erlang ${ERLANG_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf plugin-add erlang
 _announce_info "This step is going to take a while, buckle up!"
asdf install erlang $ERLANG_VERSION
_announce_success "Successfully install erlang: ${ERLANG_VERSION}"

_announce_step "Setting Global Erlang to ${ERLANG_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf global erlang ${ERLANG_VERSION}
_announce_success "Successfully set global erlang to ${ERLANG_VERSION}"

_announce_step "Installing Elixir ${ELIXIR_VERSION}"
asdf plugin-add elixir
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf install elixir ${ELIXIR_VERSION}
_announce_success "Successfully install elixir: ${ELIXIR_VERSION}"

_announce_step "Setting Global Elixir to ${ELIXIR_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf global elixir ${ELIXIR_VERSION}
_announce_success "Successfully set global elixir to ${ELIXIR_VERSION}"

_announce_step "Installing Node ${NODEJS_VERSION}"
asdf plugin-add nodejs
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf install nodejs ${NODEJS_VERSION}
_announce_success "Successfully install nodejs: ${NODEJS_VERSION}"

_announce_step "Setting Global Node to ${NODEJS_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf global nodejs ${NODEJS_VERSION}
_announce_success "Successfully set global nodejs to ${NODEJS_VERSION}"

_announce_step "Installing Ruby ${RUBY_VERSION}"
asdf plugin-add ruby
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf install ruby ${RUBY_VERSION}
_announce_success "Successfully install ruby: ${RUBY_VERSION}"

_announce_step "Setting Global Ruby to ${RUBY_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf global ruby ${RUBY_VERSION}
_announce_success "Successfully set global ruby to ${RUBY_VERSION}"

_announce_step "Disable rdoc for ruby gems"
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
_announce_success "Config added to ~/.gemrc"

_announce_step "Installing Rails ${RAILS_VERSION}"
gem install rails -v ${RAILS_VERSION}
_announce_success "Successfully install rails: ${RAILS_VERSION}"
