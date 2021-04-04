# dev env build, elementary os hera
# inspired heavily by https://github.com/aditya7iyengar/adify

sudo apt -y update
sudo apt -y full-upgrade

#install PPA common
sudo apt install software-properties-common

# install vim
sudo apt -y install vim

#update firmware
sudo add-apt-repository ppa:starlabs/ppa
sudo apt update
sudo apt install fwupd-gui
fwupdmgr refresh
fwupdmgr get-updates
fwupdmgr update

# Fix audio
sudo apt install -y pavucontrol

#install color profiles
sudo apt install starlabs-icc

# install battery/power/cpu tools
sudo apt install powertop
sudo powertop --auto-tune
sudo apt install tlp tlp-rdw
sudo apt install lm-sensors
sudo sensors-detect
sudo apt install psensor #gui for sensors
sensors
sudo install apt fanconrol # this didnt work out

# install gimp
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt update
sudo apt -y install gimp
sudo apt -y install gimp-plugin-directory
sudo apt -y install gimp-gmic
# photoshop shortcuts
# https://www.linuxuprising.com/2018/11/configure-gimp-210-to-use-photoshop.html

# install inkscape
sudo snap install inkscape

# install slack
sudo snap install slack --classic

# install Veracrypt
sudo add-apt-repository ppa:unit193/encryption
sudo apt update
sudo apt install veracrypt

# install wine
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install wine-stable wine64 wine32:i386 wine64
This is unfinished….

# terminator
sudo apt -y install terminator

# Mysql Client DBeaver
# https://dbeaver.io/download/
cd ~/Downloads
sudo gdebi xxx.deb

 # wps office
# download .deb from https://linux.wps.com/
cd ~/Downloads
sudo gdebi xxxx.deb

# install peek
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek

# install rclone
# https://rclone.org/drive/#making-your-own-client-id
curl https://rclone.org/install.sh | sudo bash
rclone config

# non-command line updates
# disable single click file open





# https://github.com/asdf-vm/asdf-erlang#ubuntu-1604-lts-xenial-xerus
# Eerlang Dependencies
sudo apt -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop

# https://github.com/asdf-vm/asdf-nodejs#linux-debian
# NodeJS Dependencies
sudo apt -y install dirmngr gpg
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

# rails sql gem dependencies
sudo apt install mysql-client libmysqlclient-dev libsqlite3-dev

# git
sudo apt -y install git-all
git config --global user.email "seanbjornsson@gmail.com"
git config --global user.name "Sean Björnsson"
git config --global core.editor vim

# tig
mkdir -p ~/code/
cd ~/code
git clone git://github.com/jonas/tig.git
cd tig
make prefix=/usr/local
sudo make install prefix=/usr/local


# zsh
sudo apt -y install zsh

# Oh My Zsh (make sure to accept default shell!)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Updating zsh plugins"
sudo apt install zsh-syntax-highlighting # need to fix this

ZSH_PLUGINS="plugins=(\n  git\n  jump\n  git-flow\n)"
sed -i "s/plugins=(git)/$ZSH_PLUGINS/g" ~/.zshrc

# add asdf lines to zshrc
echo -e "\n. ${HOME}/.asdf/asdf.sh" >> ${HOME}/.zshrc
echo -e "\n. ${HOME}/.asdf/completions/asdf.bash" >> ${HOME}/.zshrc

# Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# install Redis
# https://redis.io/topics/quickstart
cd /tmp
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
sudo make install


# Installing Docker"
sudo apt install docker

# Installing PG Loader"
sudo apt install pgloader

## Installing Snap"
sudo apt -y install snapd

# Installing Chrome"
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Installing Spotify"
sudo snap install spotify

# Installing 1Password"
 echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian edge main' | sudo tee /etc/apt/sources.list.d/1password.list
 sudo apt update && sudo apt install 1password

# Installing VS Code"
sudo snap install code --classic
# install plugins
# -- ruby
# -- editorconfig

# appearance updates
# https://medium.com/@s0rata/customizing-elementary-os-5-0-theme-icons-cursor-78a879e57635

# Install tweaks
sudo add-apt-repository ppa:philip.scott/elementary-tweaks
sudo apt install elementary-tweaks

# update themes
sudo apt-add-repository ppa:tista/adapta
sudo apt install adapta-gtk-theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt install papirus-icon-theme

# install gestures
# https://medium.com/@s0rata/gesture-setup-on-elementary-os-fce53997a50
sudo gpasswd -a $USER input
su - ${USER}
sudo apt update
sudo apt install libinput-tools
git clone https://github.com/bulletmark/libinput-gestures.git ~/libinput-gestures
cd ~/libinput-gestures
sudo make install
libinput-gestures-setup autostart
libinput-gestures-setup start
sudo apt install python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject
git clone https://gitlab.com/cunidev/gestures ~/gestures
cd ~/gestures
sudo python3 setup.py install

# disable tap’n’drag
# https://www.reddit.com/r/elementaryos/comments/e7wwiu/permanently_disable_double_tap_to_drag_on_touchpad/
Sudo apt install dconf-editor

# google Earth
# https://itsfoss.com/install-google-earth-ubunu/
# https://tutorialforlinux.com/2017/05/08/how-to-install-google-earth-on-elementary-os-linux-easy-guide/
cd /temp
mkdir google-earth && cd google-earth
wget https://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo gdebi ./google-earth*.deb

# Fix gpg: WARNING: unsafe ownership on homedir '/home/sean/.gnupg'
sudo gpgconf --kill dirmngr
sudo chown -R $USER ~/.gnupg


ELIXIR_VERSION="1.11.2"
ERLANG_VERSION="23.2"
RUBY_VERSION="3.0.0"
RAILS_VERSION="6.1.3.1"
ASDF_VERSION="0.8.0"
NODEJS_VERSION="15.13.0"

# asdf
git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf --branch v${ASDF_VERSION}

. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash

# Erlang ${ERLANG_VERSION}
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf plugin-add erlang
 _announce_info "This step is going to take a while, buckle up!"
asdf install erlang $ERLANG_VERSION

# Setting Global Erlang to ${ERLANG_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf global erlang ${ERLANG_VERSION}

# Installing Elixir ${ELIXIR_VERSION}"
asdf plugin-add elixir
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf install elixir ${ELIXIR_VERSION}

# Setting Global Elixir to ${ELIXIR_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf global elixir ${ELIXIR_VERSION}

# Installing Node ${NODEJS_VERSION}"
asdf plugin-add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf install nodejs ${NODEJS_VERSION}

# Setting Global Node to ${NODEJS_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf global nodejs ${NODEJS_VERSION}

# Installing Ruby ${RUBY_VERSION}"
asdf plugin-add ruby
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
RUBY_CONFIGURE_OPTS="--disable-dtrace --disable-install-rdoc" asdf install ruby ${RUBY_VERSION}

# Setting Global Ruby to ${RUBY_VERSION}"
. ${HOME}/.asdf/asdf.sh
. ${HOME}/.asdf/completions/asdf.bash
asdf global ruby ${RUBY_VERSION}

# Disable rdoc for ruby gems"
echo "gem: --no-ri --no-rdoc --no-document" > ~/.gemrc

# Installing Rails ${RAILS_VERSION}"
gem install rails -v ${RAILS_VERSION}


#postgres
sudo apt-get install libpq-dev
sudo apt-get install postgresql

#mysql
sudo apt -y install mysql-server
sudo mysql_secure_installation
mysql > ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY ''; mysql > FLUSH PRIVILEGES;

# fix mysql open ssl issue
echo "BUNDLE_BUILD__MYSQL2: --with-opt-dir=/usr/lib/ssl" >> ~/.bundle/config

# ensure rails project working correctly
PROJECT_DIR=/home/sean/xxx
cd $PROJECT_DIR
bundle
rails db:create
rails db:schema:load

# system gems
gem install rubocop

# heroku cli
# https://devcenter.heroku.com/articles/heroku-cli
sudo snap install --classic heroku



# - - - - [ DEFAULT ZSH CONFIGS ] - - - -


# Path to your oh-my-zsh installation.
export ZSH="/home/sean/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

source $ZSH/oh-my-zsh.sh


# - - - -  [ GIT ] - - - - 

alias recentbranches="git for-each-ref --sort=-committerdate refs/heads/ | awk '{ gsub(\"refs/heads/\", \"\") }1'"
# List all recent branches, with commit and banch name, that have been committed to last.
rb(){
  recentbranches | head -n "${@:-5}"
}

# Soft rollback of HEAD
alias "grh^"="git reset HEAD^"

# Add all changes to a fixup commit for given commit hash
fixup(){
  git add . ;  git commit --fixup "$@"
}

# fixup followed by an interactive rebase
fixupr(){
  fixup "$@"; gria head^^
}

# Shorten jump command, as introduced by the zsh plugin
alias j=jump



