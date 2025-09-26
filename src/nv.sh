#!/bin/bash
# Termux startup and Neovim setup script

# Function to check and handle errors
check_error() {
    if [ $? -ne 0 ]; then
        echo "Error occurred. Exiting..."
        exit 1
    fi
}

# Function to install a package
install_package() {
    pkg install "$1" -y || { echo "Error installing $1"; exit 1; }
    echo "$1 installed"
}

echo "TERMUX STARTUP"

# Prompt for storage access
termux-setup-storage || { echo "Error setting up storage"; exit 1; }

# Change termux repository
termux-change-repo || { echo "Error changing repository"; exit 1; }

echo "Updating and upgrading Termux"
pkg update -y || { echo "Error updating"; exit 1; }
pkg upgrade -y || { echo "Error upgrading"; exit 1; }

echo "Installing packages and dependencies"
echo "-----------------------------"

# List of packages to install (optimized for mobile)
packages="python neovim nodejs git curl openssl openssh wget gh ruby php golang rust build-essential clang vim tmux sqlite imagemagick neofetch tree nano htop proot-distro fortune cowsay cmatrix"

for package in $packages; do
    install_package "$package"
done

# Mobile-specific optimizations
echo "Setting up mobile-specific configurations..."
echo "-----------------------------------"

# Create essential directories
mkdir -p ~/bin ~/projects ~/downloads ~/scripts

# Set up beautified Bash configuration for mobile convenience
cat >> ~/.bashrc << 'EOF'

# ===========================================
# 🚀 MOBILE TERMUX BASH BEAUTIFICATION 🚀
# ===========================================

# Color definitions for better visual experience
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Enhanced PS1 prompt with colors and mobile-friendly info
export PS1='\[\033[01;32m\]📱 \[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# Mobile Termux optimizations
alias ll='ls -la --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Mobile shortcuts with emojis
alias projects='cd ~/projects && echo "📁 Projects directory"'
alias downloads='cd ~/downloads && echo "📥 Downloads directory"'
alias scripts='cd ~/scripts && echo "📜 Scripts directory"'
alias nv='nvim'
alias py='python'
alias pip='pip3'

# Git shortcuts with visual feedback
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'

# Mobile-friendly file operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias rmdir='rmdir -v'

# Quick navigation
alias home='cd ~ && echo "🏠 Home directory"'
alias config='cd ~/.config && echo "⚙️  Config directory"'

# System information shortcuts
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ps='ps aux'
alias top='htop'

# Mobile development helpers
alias serve='python -m http.server 8000'
alias ports='netstat -tuln'
alias myip='curl -s ifconfig.me && echo'

# Fun and useful commands
alias weather='curl -s wttr.in'
alias matrix='cmatrix'
alias cowsay='cowsay -f dragon'
alias fortune='fortune | cowsay'

# Welcome message
echo "🎉 Welcome to your beautified Termux Bash! 🎉"
echo "💡 Type 'help' for available commands"
echo ""

# Help function
help() {
    echo "=========================================="
    echo "📱 MOBILE TERMUX BASH COMMANDS 📱"
    echo "=========================================="
    echo "Navigation:"
    echo "  .., ..., ....  - Quick directory up"
    echo "  home, config   - Quick directory access"
    echo "  projects       - Go to projects folder"
    echo "  downloads      - Go to downloads folder"
    echo "  scripts        - Go to scripts folder"
    echo ""
    echo "Development:"
    echo "  nv             - Open Neovim"
    echo "  py             - Run Python"
    echo "  serve          - Start HTTP server on port 8000"
    echo "  ports          - Show open ports"
    echo "  myip           - Show your IP address"
    echo ""
    echo "Git shortcuts:"
    echo "  gs, ga, gc, gp - Git status, add, commit, push"
    echo "  gl, gd, gb     - Git log, diff, branch"
    echo ""
    echo "System:"
    echo "  ll, la, l      - List files with colors"
    echo "  df, du, free   - Disk and memory usage"
    echo "  htop           - System monitor"
    echo ""
    echo "Fun:"
    echo "  weather        - Check weather"
    echo "  matrix         - Matrix effect"
    echo "  cowsay         - Cow says something"
    echo "  fortune        - Random fortune"
    echo "=========================================="
}

EOF

echo "🎨 Beautified Bash configuration with colors and mobile shortcuts!"


# Neovim Setup
echo "NEOVIM STARTUP"
if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim || { echo "Error cloning Neovim"; exit 1; }
else
    echo "Destination path '~/.local/share/nvim/site/pack/packer/start/packer.nvim' already exists and is not an empty directory. Skipping clone."
fi

cd

foldername=".config"

if [ -d "$foldername" ]; then
    echo "Moving to .config folder"
    cd .config || { echo "Error changing to .config"; exit 1; }
else
    echo "Creating .config and changing directory to .config"
    mkdir "$foldername" && cd "$foldername" || { echo "Error creating .config"; exit 1; }
fi

nvim_dir="nvim"

if [ ! -d "$nvim_dir" ]; then
    echo "Cloning the git repository for Neovim plugin setup"
    git clone https://github.com/derekzyl/nvim.git || { echo "Error cloning Neovim repository"; exit 1; }
else
    echo "An existing 'nvim' folder was found. Do you want to delete it and clone again? [y|Y|n|N]"

    read -p "[y|Y|n|N]"  user_input_nvim

    if [ "$user_input_nvim" = "y" ] || [ "$user_input_nvim" = "Y" ]; then
        echo "Removing the 'nvim' folder..."
        rm -rf "$nvim_dir"

        echo "Removed 'nvim' folder, cloning 'nvim.git'..."
        git clone https://github.com/derekzyl/nvim.git || { echo "Error cloning Neovim repository"; exit 1; }
    else
        echo "Exiting 'nvim' plugin cloning."
    fi
fi

echo "Would you want to make Neovim your default code editor in Termux? [Y|y|N|n]"

read -p  "[y|Y|n|N]"  user_input_neovim

if [ "$user_input_neovim" = "y" ] || [ "$user_input_neovim" = "Y" ]; then
    ln -s /data/data/com.termux/files/usr/bin/nvim ~/bin/termux-file-editor || { echo "Error creating symlink";}
    echo "You have made Neovim your code editor"
else
    echo "You chose not to make Neovim your default code editor."
fi

echo "=========================================="
echo "⚠️  IMPORTANT DISCLAIMER FOR BEAUTIFICATION ⚠️"
echo "=========================================="
echo "Before proceeding with beautification, please ensure:"
echo "1. Your terminal is ZOOMED IN to display more characters"
echo "2. Your screen size can accommodate the T-Header display"
echo "3. T-Header may not work properly on smaller screen sizes"
echo ""
echo "This is designed to help you start coding on your phone with ease!"
echo "=========================================="
echo ""
echo "Would you want to add beautifications to your Termux like a custom name and extra shortcuts? [Y|y|N|n]"

read -p "[y|Y|n|N]" user_input_t


echo "$user_input_t"

if [ "$user_input_t" = "y" ] || [ "$user_input_t" = "Y" ]; then
    echo "Installing T-Header specific packages..."
    echo "-----------------------------------"
    
    # T-Header specific packages
    t_header_packages="fd figlet boxes gum bat logo-ls eza zsh timg fzf"
    
    for package in $t_header_packages; do
        install_package "$package"
    done
    
    # Install lolcat gem for T-Header
    echo "Installing lolcat gem for T-Header..."
    gem install lolcat || { echo "Error installing lolcat gem"; exit 1; }
    echo "lolcat gem installed"
    
    echo "Setting up T-Header beautification..."
    cd || { echo "Error changing to home directory"; exit 1; }
    git clone https://github.com/remo7777/T-Header.git || { echo "Error cloning T-Header repository"; exit 1; }
    cd T-Header/ || { echo "Error changing to T-Header directory"; exit 1; }
    bash t-header.sh || { echo "Error running t-header.sh"; exit 1; }
    
    # Configure Zsh aliases since T-Header uses Oh My Zsh
    echo "Configuring Zsh aliases for mobile usage..."
    cat >> ~/.zshrc << 'EOF'

# Mobile Termux optimizations for Zsh
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Mobile shortcuts
alias projects='cd ~/projects'
alias downloads='cd ~/downloads'
alias scripts='cd ~/scripts'
alias nv='nvim'
alias py='python'
alias pip='pip3'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'

# Mobile-friendly file operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Quick navigation
alias home='cd ~'
alias config='cd ~/.config'

# Zsh-specific mobile optimizations
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Oh My Zsh mobile enhancements
export ZSH_THEME="robbyrussell"  # You can change this to your preferred theme
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

EOF
    
    echo "Zsh aliases and mobile optimizations configured"
    echo "Successfully beautified Termux and added some nice looks"
    echo "-----------------------------------"
    echo "To remove the banner and custom name, use this:"
    echo "cd ~/T-Header && bash t-header.sh --remove && exit"
else
    echo "You chose not to add beautifications to Termux."
fi

# Mobile usage tips
echo "=========================================="
echo "📱 MOBILE TERMUX USAGE TIPS 📱"
echo "=========================================="
echo "1. Use Ctrl+Z to suspend processes, 'fg' to resume"
echo "2. Use 'htop' to monitor system resources"
echo "3. Use 'tree' to visualize directory structure"
echo "4. Use 'proot-distro' to run Linux distributions"
echo "5. Use 'tmux' for persistent sessions"
echo "6. Use 'nano' for quick text editing"
echo "7. Use 'git' shortcuts: gs, ga, gc, gp, gl"
echo "8. Use 'projects', 'downloads', 'scripts' to navigate"
echo "9. Use 'nv' instead of 'nvim' for faster typing"
echo "10. Use 'py' instead of 'python' for faster typing"
echo ""
echo "🎨 BASH BEAUTIFICATION FEATURES:"
echo "   - Type 'help' for a complete command reference"
echo "   - Colorized output for better readability"
echo "   - Enhanced prompt with emojis and colors"
echo "   - Fun commands: weather, matrix, cowsay, fortune"
echo "   - Development helpers: serve, ports, myip"
echo "   - Visual feedback for directory changes"
echo ""
if [ "$user_input_t" = "y" ] || [ "$user_input_t" = "Y" ]; then
    echo "🔧 ZSH/OH-MY-ZSH FEATURES:"
    echo "   - Tab completion is enhanced with Oh My Zsh"
    echo "   - Use '...' and '....' for quick directory navigation"
    echo "   - Zsh globbing: use ** for recursive searches"
    echo "   - History search with Ctrl+R"
    echo "   - Auto-suggestions and syntax highlighting"
    echo ""
fi
echo "💡 Pro tip: Pin Termux to your recent apps for quick access!"
echo "=========================================="

echo "Happy hacking!!! 😊😊⚡⚡⚡😎😎"