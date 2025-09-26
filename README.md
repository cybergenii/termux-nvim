# Termux & Neovim Mobile Development Environment Setup

A comprehensive, mobile-optimized development environment for Android using Termux and Neovim with beautified shells and enhanced productivity features.

## 📋 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Detailed Installation](#detailed-installation)
  - [Installing F-Droid and Termux](#installing-f-droid-and-termux)
  - [Running the Setup Script](#running-the-setup-script)
  - [Configuring Neovim](#configuring-neovim)
- [Usage Guide](#usage-guide)
  - [Essential Terminal Commands](#essential-terminal-commands)
  - [Neovim Commands](#neovim-commands)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🎯 Overview

**Termux** is a powerful terminal emulator and Linux environment for Android that provides a full-featured command-line interface on your mobile device. **Neovim** is a modern, extensible text editor based on Vim, offering enhanced performance and plugin support.

This guide helps you create a complete mobile development environment with:
- ✅ Full Linux terminal on Android
- ✅ Modern text editor with syntax highlighting
- ✅ Package management and development tools
- ✅ Git integration and SSH support
- ✅ Language servers for code completion
- ✅ **Beautified Bash with colors and mobile shortcuts**
- ✅ **Optional T-Header beautification with Oh My Zsh**
- ✅ **Mobile-optimized aliases and productivity tools**
- ✅ **Fun commands and visual enhancements**

## 📱 Prerequisites

- Android device (Android 7.0+ recommended)
- At least 2GB free storage space
- Stable internet connection for downloads

## 🚀 Quick Start

### Option 1: Automated Setup (Recommended)

1. **Install F-Droid**: [Download F-Droid APK](https://f-droid.org/F-Droid.apk)
2. **Install Termux packages** from F-Droid:
   - Termux
   - Termux:API
   - Termux:Styling (optional)
3. **Download and run setup script**: [Get Setup Script](https://drive.google.com/file/d/1mGu6xzJUPi4VaKBi-8IseojU_AvW8HdT/view?usp=drive_link)
4. **Execute setup** in Termux: `bash nv.sh`

### Option 2: Manual Setup

Follow the [detailed installation guide](#detailed-installation) below for step-by-step instructions.

## 🔧 Detailed Installation

### Installing F-Droid and Termux

#### Step 1: Install F-Droid
F-Droid is an open-source app store that provides privacy-focused, free software for Android.

1. Download F-Droid APK from [f-droid.org](https://f-droid.org/F-Droid.apk)
2. Enable "Unknown Sources" in Android settings if prompted
3. Install the downloaded APK

#### Step 2: Install Termux Components
From F-Droid, install the following apps:

| App | Purpose | Required |
|-----|---------|----------|
| **Termux** | Main terminal emulator | ✅ Yes |
| **Termux:API** | Android API access | ✅ Yes |
| **Termux:Styling** | Terminal themes | ⚪ Optional |
| **Unexpected Keyboard** | Coding-friendly keyboard | ⚪ Recommended |

### Running the Setup Script

#### Step 1: Initial Termux Setup
```bash
# Open Termux and allow it to complete first-time setup
# Then enable storage access
termux-setup-storage
```

#### Step 2: Download and Execute Script
```bash
# Navigate to downloads folder
cd ~/storage/downloads

# Make script executable (if needed)
chmod +x nv.sh

# Convert line endings if you encounter errors
dos2unix nv.sh

# Run the setup script
bash nv.sh
```

The script will:
- Update Termux packages
- Install development tools (Python, Node.js, Git, etc.)
- Install mobile-optimized packages (tree, nano, htop, proot-distro, etc.)
- Configure beautified Bash with colors and mobile shortcuts
- Install and configure Neovim
- Set up essential directories (projects, downloads, scripts)
- **Optional**: Install T-Header beautification with Oh My Zsh
- **Optional**: Install T-Header specific packages (fd, figlet, boxes, etc.)
- Add fun commands and visual enhancements

### Configuring Neovim

#### Step 1: Initial Neovim Setup
```bash
# Launch Neovim
nvim
```

#### Step 2: Install Plugins
In Neovim, run these commands (note the colon prefix):
```vim
:PackerInstall
:PackerSync
:Mason
```

#### Step 3: Configure Language Servers
In Mason (`:Mason`), install language servers for your preferred languages:
- `markdown-parser` for Markdown support
- `lua-language-server` for Lua
- `pyright` for Python
- Add others as needed

#### Step 4: Explore Configuration
```bash
# Navigate to Neovim config
cd ~/.config/nvim
nvim .
```

Use `n` in normal mode to toggle the file tree (NerdTree) and explore the configuration files.

## 📖 Usage Guide

### 🎨 Beautified Bash Features

#### Mobile-Optimized Aliases
```bash
# Navigation shortcuts
..               # Go up one directory
...              # Go up two directories
....             # Go up three directories
home             # Go to home directory
config           # Go to config directory
projects         # Go to projects folder
downloads        # Go to downloads folder
scripts          # Go to scripts folder

# Development shortcuts
nv               # Open Neovim
py               # Run Python
pip              # Run pip3
serve            # Start HTTP server on port 8000
ports            # Show open ports
myip             # Show your IP address

# Git shortcuts
gs               # Git status
ga               # Git add
gc               # Git commit
gp               # Git push
gl               # Git log with graph
gd               # Git diff
gb               # Git branch
gco              # Git checkout

# System shortcuts
ll               # List files with colors
la               # List all files with colors
l                # List files in columns
df               # Disk usage (human readable)
du               # Directory usage (human readable)
free             # Memory usage (human readable)
htop             # System monitor
```

#### Fun Commands
```bash
weather          # Check current weather
matrix           # Matrix effect display
cowsay           # Dragon says something fun
fortune          # Random inspirational quote
help             # Show complete command reference
```

### Essential Terminal Commands

#### Navigation
```bash
cd <directory>    # Change directory
ls               # List files and folders (now with colors!)
pwd              # Show current directory path
cd ~             # Go to home directory
cd ..            # Go up one directory
tree             # Visual directory structure
```

#### File Operations
```bash
mkdir <name>     # Create directory (with verbose output)
rm <file>        # Delete file (with confirmation)
rm -rf <dir>     # Delete directory and contents
cp <src> <dest>  # Copy file/directory (with confirmation)
mv <src> <dest>  # Move/rename file/directory (with confirmation)
```

#### File Content
```bash
cat <file>       # Display file contents
less <file>      # View file with pagination
grep "<text>" <file>  # Search for text in file (with colors!)
nano <file>      # Quick text editing
```

#### System
```bash
chmod +x <file>  # Make file executable
htop             # Enhanced system monitor
ps               # Show running processes
ping <host>      # Test network connectivity
```

### 🔧 T-Header Beautification (Optional)

If you choose beautification during setup, you'll get:

#### T-Header Features
- **Oh My Zsh**: Enhanced shell with themes and plugins
- **Custom prompt**: Beautiful terminal prompt with colors
- **Banner**: Custom ASCII art banner on terminal start
- **Shortcuts**: Additional keyboard shortcuts for mobile

#### Zsh/Oh My Zsh Features
```bash
# Enhanced tab completion
# Use '...' and '....' for quick directory navigation
# Zsh globbing: use ** for recursive searches
# History search with Ctrl+R
# Auto-suggestions and syntax highlighting
```

#### T-Header Requirements
- **Terminal zoom**: Ensure your terminal is zoomed in for proper display
- **Screen size**: Works best on larger screens or zoomed terminals
- **Dependencies**: Automatically installs required packages (fd, figlet, boxes, etc.)

### Neovim Commands

#### Modes
- **Normal Mode**: Navigate and run commands (press `Esc` to enter)
- **Insert Mode**: Edit text (press `i` to enter)
- **Visual Mode**: Select text (press `v` to enter)
- **Command Mode**: Run Neovim commands (press `:` to enter)

#### Essential Commands
```vim
# File Operations
:w               # Save file
:q               # Quit
:wq              # Save and quit
:q!              # Quit without saving

# Navigation (Normal Mode)
h j k l          # Move left/down/up/right
gg               # Go to file beginning
G                # Go to file end
Ctrl+u/d         # Scroll half page up/down

# Editing (Normal Mode)
i                # Insert at cursor
a                # Insert after cursor
o                # New line below and insert
dd               # Delete line
yy               # Copy line
p                # Paste
```

#### Advanced Features
```vim
# Search and Replace
/pattern         # Search forward
?pattern         # Search backward
n/N              # Next/previous match
:%s/old/new/g    # Replace all occurrences

# Plugin Commands
n                # Toggle file tree (NerdTree)
:Mason           # Open Mason package manager
:PackerSync      # Sync plugins
```

## 🎨 Customization

### Terminal Appearance
- Use **Termux:Styling** to change colors and fonts
- Modify `~/.termux/termux.properties` for advanced settings
- **Bash**: Colors and prompt are configured in `~/.bashrc`
- **Zsh**: Oh My Zsh themes can be changed in `~/.zshrc`

### Mobile-Optimized Features
- **Aliases**: Edit `~/.bashrc` or `~/.zshrc` to modify shortcuts
- **Directories**: Customize `~/projects`, `~/downloads`, `~/scripts` folders
- **Help system**: Modify the `help()` function in your shell config
- **Fun commands**: Add more entertainment commands to your shell

### Neovim Plugins
Edit `~/.config/nvim/lua/plugins.lua` to:
- Add new plugins
- Modify existing plugin configurations
- Customize key bindings

### Shell Configuration
Customize your shell by editing:
- `~/.bashrc` for Bash settings and mobile aliases
- `~/.zshrc` for Zsh/Oh My Zsh settings (if T-Header is installed)
- `~/.tmux.conf` for tmux configuration

### T-Header Customization
- **Themes**: Change Oh My Zsh themes in `~/.zshrc`
- **Banner**: Modify T-Header banner in `~/T-Header/`
- **Remove**: Run `cd ~/T-Header && bash t-header.sh --remove` to remove

## 🔍 Troubleshooting

### Common Issues

#### Script Execution Errors
```bash
# If script fails to run:
dos2unix nv.sh
chmod +x nv.sh
bash nv.sh
```

#### Storage Access Issues
```bash
# Re-run storage setup:
termux-setup-storage
```

#### Plugin Installation Failures
```vim
# In Neovim, try:
:PackerClean
:PackerInstall
:PackerSync
```

#### Package Installation Issues
```bash
# Update package lists:
pkg update && pkg upgrade
```

### Mobile-Specific Tips

#### Performance Optimization
- **Pin Termux**: Add to recent apps for quick access
- **Use tmux**: Keep sessions alive when switching apps
- **Monitor resources**: Use `htop` to check CPU/memory usage
- **Clean up**: Regularly run `pkg autoremove` to free space

#### Mobile Development Workflow
- **Quick edits**: Use `nano` for fast text editing
- **File management**: Use `tree` to visualize directory structure
- **Web development**: Use `serve` to start local HTTP server
- **Version control**: Use git shortcuts (`gs`, `ga`, `gc`, `gp`)

#### T-Header Issues
- **Display problems**: Ensure terminal is zoomed in
- **Remove T-Header**: `cd ~/T-Header && bash t-header.sh --remove`
- **Switch shells**: Use `chsh -s /bin/bash` to switch back to Bash

### Getting Help

- **Built-in help**: Type `help` in your terminal
- **Termux Wiki**: [wiki.termux.com](https://wiki.termux.com)
- **Neovim Documentation**: `:help` in Neovim
- **Community**: r/termux on Reddit

## 🤝 Contributing

Found an issue or want to improve this guide? Contributions are welcome!

1. Fork the repository
2. Make your changes
3. Submit a pull request

## 📄 License

This guide is provided as-is for educational purposes. Individual software components have their own licenses.

---

## 🎉 What's New in This Version

- **🎨 Beautified Bash**: Colors, emojis, and mobile-optimized shortcuts
- **🔧 T-Header Integration**: Optional Oh My Zsh beautification with disclaimer
- **📱 Mobile Aliases**: Quick navigation and development shortcuts
- **🎮 Fun Commands**: Weather, matrix, cowsay, and fortune for entertainment
- **📚 Built-in Help**: Type `help` for complete command reference
- **⚡ Performance Tools**: htop, tree, proot-distro for better mobile experience
- **🛠️ Development Helpers**: HTTP server, port scanner, IP checker

---

**Happy coding on mobile! 📱💻✨**
