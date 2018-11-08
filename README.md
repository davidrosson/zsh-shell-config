
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

7) Install 'zsh-git-prompt'
  7.1) Clone the 'zsh-git-prompt' repo from GitHub to ~/Documents/github/
    7.1.1) cd ~/Documents/github/
    7.1.2) git clone https://github.com/olivierverdier/zsh-git-prompt.git
  7.2) Install Haskell
    7.2.1) curl -sSL https://get.haskellstack.org/ | sh
  7.3) Point 'zsh-git-prompt' to a custom version of 'BranchParse.hs'
    7.3.1) mv ~/Documents/github/zsh-git-prompt/src/src/BranchParse.hs ~/Documents/github/zsh-git-prompt/src/src/BranchParse.hs.orig
    7.3.2) ln -sf ~/Documents/github/zsh-shell-config/src/src/BranchParse.hs ~/Documents/github/zsh-git-prompt/src/src/BranchParse.hs
  7.4) Build the Haskell 'zsh-git-prompt' binary 'gitstatus'
    7.4.1) cd ~/Documents/github/zsh-git-prompt/
    7.4.2) stack setup
    7.4.3) stack build && stack install
  7.5) Create a symbolic link to the 'gitstatus' binary
    7.5.1) ln -sf ~/Documents/github/zsh-git-prompt/src/.bin/gitstatus ~/Documents/github/zsh-shell-config/src/.bin/gitstatus

8) Customize 'zsh' and 'oh-my-zsh'
  8.1) Create a symbolic link from the local 'oh-my-zsh' installation to the 'super-agnoster' theme
    8.1.1) ln -sf ~/Documents/github/zsh-shell-config/super-agnoster.zsh-theme ~/.oh-my-zsh/themes/super-agnoster.zsh-theme
  8.2) Point the zsh config file to to a custom version of '.zshrc'
    8.2.1) mv ~/.zshrc ~/.zshrc.orig
    8.2.2) ln -sf ~/Documents/github/zsh-shell-config/.zshrc ~/.zshrc

9) Update username in '.zshrc'
  9.1) Set 'DEFAULT_USER=<username>'
  9.2) Set 'export ZSH="/Users/<username>/.oh-my-zsh"'
