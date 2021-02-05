# install nvim
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
sudo chmod +x nvim.appimage
sudo chown root:root nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
echo "nvim updated"
