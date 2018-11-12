
### Ensure that this directory is cloned to ~/Documents/github/

1) Install iTerm2

2) Install the '12pt Meslo LG M Regular for Powerline' font
  2.1) Right click 'Meslo-LG-M-Powerline-DMR.ttf' -> Open With -> Font Book -> Install Font

3) Create a new iTerm2 profile
  3.1) Create a new profile called 'Super-Solarized'
  3.2) Set the color profile
    3.2.1) iTerm2 -> Preferences... -> Profiles tab -> Colors tab
    3.2.2) Open the 'Color Presets...' drop-down in the bottom-right corner
    3.2.3) Select 'Import...' from the list
    3.2.4) Select the 'Super-Solarized.itermcolors' file
    3.2.5) Select 'Super-Solarized' from 'Color Presets...'
  3.3) Change the text to '12pt Meslo LG M Regular for Powerline'
    3.3.1) iTerm2 -> Preferences... -> Profiles tab -> Text tab
    3.3.2) Click the 'Change Font' button
    3.3.3) Select 'Meslo LG M Regular for Powerline'

4) Install Homebrew
  4.1) xcode-select --install
  4.2) ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

5) Install 'zsh'
  5.1) brew install zsh

6) Use the custom 'zsh' config
  6.1) Point the default '~/.zshrc' config file to the source-controlled version
    6.1.1) mv ~/.zshrc ~/.zshrc.orig
    6.1.2) ln -sf ~/Documents/github/zsh-shell-config/.zshrc ~/.zshrc

7) Update username in '.zshrc'
  7.1) Set 'DEFAULT_USER=<username>'

8) Install 'oh-my-zsh'
  8.1) sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

9) Build and install the 'gitstatus' binary from 'zsh-git-prompt'
  9.1) Install Haskell
    9.1.1) curl -sSL https://get.haskellstack.org/ | sh
  9.2) Clone the 'zsh-git-prompt' repo from GitHub
    9.2.1) git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/Documents/github/zsh-shell-config/git-prompt-custom/zsh-git-prompt/
  9.3) Replace the default 'BranchParse.hs' with a custom version
    9.3.1) cp ~/Documents/github/zsh-shell-config/git-prompt-custom/BranchParse.hs ~/Documents/github/zsh-shell-config/git-prompt-custom/zsh-git-prompt/src/src/BranchParse.hs
  9.4) Build the Haskell 'zsh-git-prompt' binary 'gitstatus'
    9.4.1) cd ~/Documents/github/zsh-shell-config/git-prompt-custom/zsh-git-prompt/
    9.4.2) stack setup
    9.4.3) stack build && stack install

10) Enable command line auto-suggestions
  10.1) Clone the 'zsh-autosuggestions' repo from GitHub
    10.1.1) git clone https://github.com/zsh-users/zsh-autosuggestions ~/Documents/github/zsh-shell-config/oh-my-zsh/plugins/zsh-autosuggestions/
    10.1.2) git clone https://github.com/zsh-users/zsh-history-substring-search ~/Documents/github/zsh-shell-config/oh-my-zsh/plugins/zsh-history-substring-search/
    10.1.3) git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/Documents/github/zsh-shell-config/oh-my-zsh/plugins/zsh-syntax-highlighting/
