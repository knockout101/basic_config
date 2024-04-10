#!/bin/sh

# apt-get update
# apt-get install nala
nala install xsel gcc lldb g++ curl zoxide rustc cargo -y

# Checking if starship has eval in .bashrc
if grep -wq "eval \"\$(starship init bash)\"" ~/.bashrc;
then
	echo "Found existing 'eval \"\$(starship init bash)\"'"
else
	echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
fi

# Check for Neovim installation
if ! nvim --version > /dev/null;
then
	echo "Neovim not installed..."
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	mkdir -p /opt/nvim
	mv nvim.appimage /opt/nvim/nvim	
else
	echo "Neovim is already installed"
fi

# Checking .bashrc for export to additional path for Neovim
if grep -wq "export PATH=\"\$PATH:/opt/nvim/\"" ~/.bashrc;
then
	echo "Found existing 'export PATH=\"\$PATH:/opt/nvim/\"'"
else
	echo "export PATH=\"\$PATH:/opt/nvim/\"" >> ~/.bashrc
fi
# echo "export PATH=\"\$PATH:/opt/nvim/\"" >> ~/.bashrc
