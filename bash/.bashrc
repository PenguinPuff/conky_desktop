# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
echo "______                      _            a8888b.        "   
echo "| ___ \                    (_)          d888888b.       "      
echo "| |_/ /__ _ __   __ _ _   _ _ _ __      8PPYPPY88       " 
echo "|  __/ _ \ '_ \ / _  | | | | | _  \     8|o||o|88        "
echo "| | |  __/ | | | (_| | |_| | | | | |    8'    .88       "
echo "\_|  \___|_| |_|\__, |\__,_|_|_| |_|    8\`._.\`Y8.        "
echo "                 __/ |                  d/     \'8b.                        "
echo "                |___/                 .dP   .     Y8b.                        "    
echo "                                    d8:\'   \"   \`::88b.                       "  
echo "                                   d8\"           \`Y88b"
echo "                                   :8P     \'       :888"
echo "                                    8a.    :      _a88P                       "
echo "                                  ._/\"Yaa_ :    .| 88P|"
echo "                                   \    YP\"      \`| 8P  \`."
echo "                                   /     \._____.d|    .\'"
echo "                                   \`--..__)888888P\`._.\'"
echo ""

wiki() {
    search_term="${1}"
    lynx https://wiki.archlinux.org/index.php?search=${search_term}
}


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
    
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /opt/bin/lesspipe ] && eval "$(SHELL=/system/bin/sh lesspipe)"


# Using color promt
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[48;2;221;75;57;38;2;255;255;255m\] \$ \[\033[48;2;0;135;175;38;2;221;75;57m\]\[\033[48;2;0;135;175;38;2;255;255;255m\] \h \[\033[48;2;83;85;85;38;2;0;135;175m\]\[\033[48;2;83;85;85;38;2;255;255;255m\] \w \[\033[49;38;2;83;85;85m\]\[\033[00m\] '
else
    PS1='\[\033[48;2;220;138;120;38;2;15;14;10m\] \u@\h \[\033[48;2;221;120;120;38;2;166;218;149m\]\[\033[48;2;166;227;161;38;2;15;14;10m\] \w \[\033[48;2;136;57;239;38;2;11;10;10m\]\[\033[48;2;180;190;254;38;2;15;10;10m\] \d \[\033[48;2;136;57;239;38;2;11;10;10m\]\[\033[48;2;186;187;241;38;2;15;10;10m\] \A \[\033[49;38;2;136;57;239m\]\[\033[00m\] \$ '
    
fi
# Some better definitions
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# enable color support of ls and also add handy aliases
if [ -x /opt/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /opt/etc/bash_completion ] && ! shopt -oq posix; then
    . /opt/etc/bash_completion
fi

