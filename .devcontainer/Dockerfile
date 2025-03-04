FROM archlinux:latest

# Initialize keyring and update package database
RUN pacman-key --init
RUN pacman -Syyu --noconfirm

# Install packages
RUN pacman -S --noconfirm \
    zsh sudo fastfetch git vim \
    bat zip unzip tar wget \
    curl fd htop ncdu mlocate \
    tree man-db tldr jq yq \
    diffutils openssl ranger

# Add default user and edit sudoers file
RUN useradd -m vscode \
    && usermod -aG wheel vscode \
    && echo '%wheel ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/wheel > /dev/null

# Switch to user to install omz
USER vscode
WORKDIR /home/arvscodech

# Install omz and enable plugins
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    sed -i 's/^plugins=(*)/plugins=(git ssh zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc

# Install omz theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" && \
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
    
# Run fastfetch and start zsh
CMD fastfetch && zsh
