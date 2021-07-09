#
# .profile runs on display manger login. Environment variables are set here.
#

# if shell is BASH source bashrc
if [ -n "$BASH" ] ;then
  [ -r "~/.bashrc" ] && . ~/.bashrc
fi

# Load environment variables
[[ -f ~/.config/bash/bashenv ]] && . ~/.config/bash/bashenv

