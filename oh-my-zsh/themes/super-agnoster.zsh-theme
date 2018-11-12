# vim:ft=zsh ts=2 sw=2 sts=2
#
# Adapted from agnoster's Theme - https://gist.github.com/3712874
#


### Set a few color defaults
CURRENT_BG='NONE'
if [[ -z "$PRIMARY_FG" ]]; then
  PRIMARY_FG=black
fi

### Special characters
SEGMENT_SEPARATOR="\ue0b0" # |>
BRANCH="\ue0a0"
# DETACHED="\u27a6" # ➦
CROSS="\u2718"
LIGHTNING="\u26a1"
GEAR="\u2699"

### git_super_status variables
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="${BRANCH} "
ZSH_THEME_GIT_PROMPT_STAGED="%{±%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{⚒%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{?%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{✔%G%}"

### Segments of the prompt, default order declaration
typeset -aHg AGNOSTER_PROMPT_SEGMENTS=(
  prompt_status
  prompt_context
  prompt_virtualenv
  prompt_dir
  prompt_super_git
  prompt_end
)

### Begin a segment
# Takes two arguments, background and foreground color. Both can be omitted,
# rendering default background/foreground colors.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    print -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    print -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && print -n $3
}

### Status:
# - Was there an error?
# - Am I root?
# - Are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}$CROSS"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}$LIGHTNING"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}$GEAR"

  [[ -n "$symbols" ]] && prompt_segment $PRIMARY_FG default " $symbols "
}

### user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    prompt_segment $PRIMARY_FG default " %(!.%{%F{yellow}%}.)$user@%m "
  fi
}

### Display current virtual environment
prompt_virtualenv() {
  if [[ -n $VIRTUAL_ENV ]]; then
    color=cyan
    prompt_segment $color $PRIMARY_FG
    print -Pn " $(basename $VIRTUAL_ENV) "
  fi
}

### Trim directory name with variable expansion
trimmed_pwd() {
  echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}
}

### Display trimmed current working directory
prompt_dir() {
  prompt_segment 32 $PRIMARY_FG " $(trimmed_pwd) " # DeepSkyBlue3
}

### Display extended git info from ~/Documents/github/zsh-git-prompt/zshrc.sh
prompt_super_git() {
  local color ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref="$vcs_info_msg_0_"
  if [[ -n "$ref" ]]; then
    if is_dirty; then
      color=227 # LightGoldenrod1
    else
      color=113 # DarkOliveGreen3
    fi
    prompt_segment $color $PRIMARY_FG "$(git_super_status)"
  fi
}

### End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    print -n "%{%k%}"
  fi
  print -n "%{%f%}"
  CURRENT_BG=''
}

### Main prompt
prompt_agnoster_main() {
  RETVAL=$?
  CURRENT_BG='NONE'
  for prompt_segment in "${AGNOSTER_PROMPT_SEGMENTS[@]}"; do
    [[ -n $prompt_segment ]] && $prompt_segment
  done
}

### Preliminary prompt construction
prompt_agnoster_precmd() {
  vcs_info
  PROMPT='%{%f%b%k%}$(prompt_agnoster_main)  '
}

### Preliminary prompt setup
prompt_agnoster_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  add-zsh-hook precmd prompt_agnoster_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

### Init
prompt_agnoster_setup "$@"

### Right prompt
build_right_prompt() {
  if [ ! -z "${AWS_ROLE_NAME}" -a ! -z "${AWS_SESSION_DURATION}" -a ! -z "${AWS_SESSION_START_TIME}" ]; then
    diff=$(expr $AWS_SESSION_DURATION - $(expr $(date +%s) - $AWS_SESSION_START_TIME))
    if [ ${diff} -gt 0 ]; then
      echo "[${AWS_ROLE_NAME}|${diff}s] "
    else
      #echo -n "NULL"
    fi
  fi
}

CL_ICON=""
if [ $COMMAND_LINE_ICON ]; then
  CL_ICON=" ${COMMAND_LINE_ICON}"
fi

RPROMPT='$FG[141]$(build_right_prompt)$(date "+%H:%M:%S")${CL_ICON}%{%f%b%k%}'
