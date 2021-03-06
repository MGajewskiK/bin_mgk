# install python environment
pip3 install flake8
pip3 install brytlytdb --index=http://pypi.brytlyt.com:1080/simple --trusted-host pypi.brytlyt.com
pip3 install parquet-cli

# install prerequisites
yum install epel-release -y
yum install fuse fuse-libs ripgrep xclip -y

# install X11 to copy from server to system clipboard
sudo yum install xorg-x11-xauth
touch ~/.Xauthority

# install bat
wget -O bat.zip https://github.com/sharkdp/bat/releases/download/v0.15.4/bat-v0.15.4-x86_64-unknown-linux-musl.tar.gz
tar -xvzf bat.zip -C /usr/local/bin && mv /usr/local/bin/bat-v0.15.4-x86_64-unknown-linux-musl/bat /usr/local/bin/bat
bash -c echo 'export BAT_THEME="Solarized (light)"' >> ~/.zshrc
bash -c echo 'export BAT_THEME="Solarized (light)"' >> ~/.bashrc

# install nodejs
#curl -sL https://rpm.nodesource.com/setup_10.x | bash -

# install yarn
#curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
#yum -y install yarn

# configure yarn
#yarn install --force
#yarn install --frozen-lockfile

# install deps for appimage
yum --enablerepo=epel -y install fuse-sshfs

# install nvim
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
chmod +x nvim
sudo chown root:root nvim
sudo mv nvim /usr/bin

# make aliases
bash -c "echo 'alias vi=nvim' >> ~/.zshrc"
bash -c "echo 'alias vi=nvim' >> ~/.bashrc"

# configure nvim
bash -c "mkdir home/admin/.config/nvim"
bash -c "mkdir ~/.config/nvim"

bash -c "cp home/admin/mgk/bin_mgk/config/.vimrc home/admin/.config/nvim/init.vim"
bash -c "cp home/admin/bin_mgk/config/.vimrc home/admin/.config/nvim/init.vim"

bash -c "cp ~/mgk/bin_mgk/config/.vimrc ~/.config/nvim/init.vim"
bash -c "cp ~/bin_mgk/config/.vimrc ~/.config/nvim/init.vim"
