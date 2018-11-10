
### Ensure that this directory is cloned to ~/Documents/github/

1) Install iTerm2

2) Install Homebrew
  2.1) xcode-select --install
  2.2) ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

3) Install 'zsh'
  3.1) brew install zsh

4) Install 'oh-my-zsh'
  4.1) sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

5) Install the '12pt Meslo LG M Regular for Powerline' font
  5.1) Right click 'Meslo-LG-M-OhMyZsh.ttf' -> Open With -> Font Book -> Install Font

6) Create a new iTerm2 profile
  6.1) Create a new profile called 'Super-Solarized'
  6.2) Set the color profile
    6.2.1) iTerm2 -> Preferences... -> Profiles tab -> Colors tab
    6.2.2) Open the 'Color Presets...' drop-down in the bottom-right corner
    6.2.3) Select 'Import...' from the list
    6.2.4) Select the 'Super-Solarized.itermcolors' file
    6.2.5) Select 'Super-Solarized' from 'Color Presets...'
  6.3) Change the text to '12pt Meslo LG M Regular for Powerline'
    6.3.1) iTerm2 -> Preferences... -> Profiles tab -> Text tab
    6.3.2) Click the 'Change Font' button
    6.3.3) Select 'Meslo LG M Regular for Powerline'

7) Build and install the 'gitstatus' binary from 'zsh-git-prompt'
  7.1) Install Haskell
    7.1.1) curl -sSL https://get.haskellstack.org/ | sh
  7.2) Clone the 'zsh-git-prompt' repo from GitHub
    7.2.1) git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/Documents/github/zsh-shell-config/git-prompt-custom/zsh-git-prompt/
  7.3) Replace the default 'BranchParse.hs' with a custom version
    7.3.1) cp ~/Documents/github/zsh-shell-config/git-prompt-custom/BranchParse.hs ~/Documents/github/zsh-shell-config/git-prompt-custom/zsh-git-prompt/src/src/BranchParse.hs
  7.4) Build the Haskell 'zsh-git-prompt' binary 'gitstatus'
    7.4.1) cd ~/Documents/github/zsh-shell-config/git-prompt-custom/zsh-git-prompt/
    7.4.2) stack setup
    7.4.3) stack build && stack install

8) Enable command line auto-suggestions
  8.1) Clone the 'zsh-autosuggestions' repo from GitHub
    8.1.1) git clone https://github.com/zsh-users/zsh-autosuggestions ~/Documents/github/zsh-shell-config/omf-custom/plugins/zsh-autosuggestions/
    8.1.2) git clone https://github.com/zsh-users/zsh-history-substring-search ~/Documents/github/zsh-shell-config/omf-custom/plugins/zsh-history-substring-search
    8.1.3) git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/Documents/github/zsh-shell-config/omf-custom/plugins/zsh-syntax-highlighting

9) Use the custom 'zsh' config
  9.1) Point the default '~/.zshrc' config file to the source-controlled version
    9.1.1) mv ~/.zshrc ~/.zshrc.orig
    9.1.2) ln -sf ~/Documents/github/zsh-shell-config/.zshrc ~/.zshrc

10) Update username in '.zshrc'
  10.1) Set 'DEFAULT_USER=<username>'
