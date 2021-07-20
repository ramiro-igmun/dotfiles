## Set environment variables
[[ -f ~/.config/shell/env ]] && . ~/.config/shell/env

# Execute startx to init window manager if in tyy1
# Comment this lines if using a display manager to login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
fi
