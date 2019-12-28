HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=100000

if [ `uname` == 'Darwin' ]; then
  # macos
  # tilde under esc, shift left to z
  hidutil property --set '{"UserKeyMapping":[
    {"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x7000000E1},
    {"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}
  ]}' &> /dev/null

  # get __git_ps1
  if [ -f ~/.config/git-prompt.sh ]; then
    source ~/.config/git-prompt.sh
  fi

  export LC_ALL=en_US.UTF-8
  export BASH_SILENCE_DEPRECATION_WARNING=1
  export CLICOLOR=1
  export TERM=xterm-256color
  export PS1='>>>>> \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")\$ '
else
  # ubuntu
  # enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
      #alias dir='dir --color=auto'
      #alias vdir='vdir --color=auto'

      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
  fi

  export PS1='\u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")\$ '
fi

alias ll='ls -alFtr'
alias la='ls -A'
alias l='ls -CF'
