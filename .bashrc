


alias refresh="source ~/.bashrc"
alias clc="clear"
alias rr="source ~/.bashrc"
alias ll="ls -la"
alias op="chmod -R 755 ."
alias pulse="cd /mnt/m/cm/internal/PULSE"
alias PULSE="cd /mnt/m/cm/internal/PULSE"
alias cj="cd /mnt/s/TD/TDAA/waldc"
alias task="cd ~/Tasks/2026"
alias terminal="dbus-launch gnome-session"
alias mmount="sudo mount -t drvfs '\\clb-netapp01.ad.astrion.us\msdev' /mnt/m"
alias smount="sudo mount -t drvfs '\\clb-netapp01.ad.astrion.us\seg' /mnt/s"

export EDITOR=vim #"/usr/bin/vim"
export NEDITOR=nvim #"/usr/bin/vim"
export FZF="/usr/bin/fzf"
export BAT="/usr/bin/bat"

source <($FZF --bash)

alias vimf='fzf --preview "if [[ -f {} ]]; then mime=\$(file --mime-type -b -- {}); if [[ \$mime == image/* ]]; then chafa --animate=false --size=\"\${FZF_PREVIEW_COLUMNS}x\$(( \${FZF_PREVIEW_LINES} - 3 ))\" -- {} 2>/dev/null || echo \"[Image preview failed: {}]\"; else \$BAT --color=always --theme=gruvbox-dark -n {}; fi; else echo {}; fi" \
               --preview-window=right:60% \
               --bind "enter:become(\${EDITOR:-vim} {})"'

alias vf='fzf --preview "if [[ -f {} ]]; then mime=\$(file --mime-type -b -- {}); if [[ \$mime == image/* ]]; then chafa --animate=false --size=\"\${FZF_PREVIEW_COLUMNS}x\$(( \${FZF_PREVIEW_LINES} - 3 ))\" -- {} 2>/dev/null || echo \"[Image preview failed: {}]\"; else \$BAT --color=always --theme=gruvbox-dark -n {}; fi; else echo {}; fi" \
               --preview-window=right:60% \
               --bind "enter:become(\${NEDITOR:-nvim} {})"'

# add this path for neovim
export PATH="$HOME/.local/bin/nvim-linux-x86_64/bin:$PATH"
export PATH="/home/waldc/.local/bin:$PATH"

