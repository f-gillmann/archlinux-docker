FROM archlinux:latest

# Install dependencies
RUN pacman -Syyu --noconfirm sudo zsh

# Add default user and add group
RUN useradd -m arch
RUN usermod -aG wheel arch

# Edit sudoers file
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/wheel > /dev/null

# Set default user
USER arch
WORKDIR /home/arch

# Install o
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Run zsh
CMD zsh
