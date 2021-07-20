#
# .profile runs on display manger login and may be run by differents shells on login.
#

# If shell is BASH source bash_profile else load environment variables
if [ -n "$BASH" ] ;then
  [ -r ~/.bash_profile ] && . ~/.bash_profile
else
  [[ -f ~/.config/bash/env ]] && . ~/.config/bash/env
fi

