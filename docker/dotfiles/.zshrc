####################
## Colors
####################
# Reset
Color_Off="%b%f"       # Text Reset

# Regular Colors
Black="%F{black}"    # Black
Red="%F{red}"        # Red
Green="%F{green}"    # Green
Yellow="%F{yellow}"  # Yellow
Blue="%F{blue}"      # Blue
Purple="%F{magenta}"  # Purple
Cyan="%F{cyan}"      # Cyan
White="%F{white}"    # White

# Bold
BBlack="%B%F{black}"    # Black
BRed="%B%F{red}"        # Red
BGreen="%B%F{green}"    # Green
BYellow="%B%F{yellow}"  # Yellow
BBlue="%B%F{blue}"      # Blue
BPurple="%B%F{magenta}"  # Purple
BCyan="%B%F{cyan}"      # Cyan
BWhite="%B%F{white}"    # White

####################
## Human readable variables
####################
User="$USER"
Hostname="$HOST"
PathShort="[%~]"
PathFull="%/"

####################
## Prompt setup
####################

# Git
####################
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst

function precmd_update_vcs_info() {
	get_worktree_status
	vcs_info
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "$Yellow"
zstyle ':vcs_info:*' unstagedstr "$Red"
zstyle ':vcs_info:*' formats "$Green%u%c%m{󰘬 %b} "
zstyle ':vcs_info:*' actionformats "$Purple%u%c{󰘬 %b|%a} "
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]="$Red"
  fi
}

function get_worktree_status() {
	# Git and Worktree detection
	if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
		if [[ "$(git rev-parse --is-bare-repository)" == "true" ]]; then
			zstyle ':vcs_info:git:*' formats "$Blue{󰘬 bare} "
		elif [[ "$(git rev-parse --is-inside-work-tree)" == "true" && "$(git worktree list | awk '{if ($2 == "(bare)") {print "true"; exit} }')" == "true" ]]; then
			zstyle ':vcs_info:git:*' formats "$Green%u%c%m{󰘬 %b|worktree} "
  		else
		  zstyle ':vcs_info:git:*' formats "$Green%u%c%m{󰘬 %b} "
  		fi
	fi
}

#add-zsh-hook precmd vcs_info
#add-zsh-hook precmd get_worktree_status
add-zsh-hook precmd precmd_update_vcs_info

# Venv
####################
function set_virtualenv_info() {
	if [[ -n $VIRTUAL_ENV ]]; then
		venv_info="$BYellow "
	else
		venv_info=""
	fi
}
export VIRTUAL_ENV_DISABLE_PROMPT=1
add-zsh-hook precmd set_virtualenv_info

user_host="$BBlue$User$BWhite@$BBlue$Hostname "

export PROMPT="$Purple$PathShort%f "$'\n'"\${venv_info}$BYellow\${vcs_info_msg_0_}\${user_host}$BCyan%f "
#export PROMPT='$venv_info$Cyan$User$Red@$Purple$Hostname$White:$BCyan$PathShort$BYellow${vcs_info_msg_0_}%f '

# Helpful functions
#

# Create a new directory and enter it

mk() {
	mkdir -p "$@" && cd "$@"
}

# Extract many types of compressed files
# Source: http://nparikh.org/notes/zshrc.txt

extract() {
	if [ -f "$1" ]; then
		case "$1" in
			*.tar.bz2)   tar -jxvf "$1"	                     ;;
			*.tar.gz)    tar -zxvf "$1"                      ;;
			*.bz2)       bunzip2 "$1"                        ;;
			*.dmg)       hdiutil mount "$1"                  ;;
			*.gz)        gunzip "$1"                         ;;
			*.tar)       tar -xvf "$1"                       ;;
			*.tbz2)      tar -jxvf "$1"                      ;;
			*.tgz)       tar -zxvf "$1"                      ;;
			*.zip)       unzip -d "${1%.*}" "$1"             ;;
			*.ZIP)       unzip -d "${1%.*}" "$1"             ;;
			*.pax)       cat "$1" | pax -r					 ;;
			*.pax.Z)     uncompress "$1" --stdout | pax -r   ;;
			*.Z)         uncompress "$1"                     ;;
			*.7z)		 7za x "$1"							 ;;
			*)       echo "'$1' cannot be extracted/mounted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file to extract"
	fi
}

function pdfpextr()
{
     # this function uses 3 arguments:
     #     $1 is the first page of the range to extract
     #     $2 is the last page of the range to extract
     #     $3 is the input file
     #     output file will be named "inputfile_pXX-pYY.pdf"
     gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
         -dFirstPage=${1} \
         -dLastPage=${2} \
         -sOutputFile=${3%.pdf}_p${1}-p${2}.pdf \
         ${3}
}


# Automatically calls ls after moving to new directory
function cdls()
{
  if [ $# -eq 0 ]; then # if no arguments
    \cd && ls --color=auto -N
  else # if arguments
    \cd "$@" && ls --color=auto -N
  fi
}

# less coloring
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m' # reset underline

alias ls="ls --color=auto -N"

# listing aliases
alias la="ls -A"
alias ll="ls -lhAr"
alias lh="ls -lah"

# listing cd
alias cd="cdls"

alias py="python"

bindkey '^R' history-incremental-search-backward


