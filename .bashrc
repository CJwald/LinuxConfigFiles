alias refresh="source ~/.bashrc"
alias clc="clear"
alias rr="source ~/.bashrc"
alias ll="ls -la"
alias op="chmod -R 755 ."
alias pulse="cd /mnt/m/cm/internal/PULSE"
alias PULSE="cd /mnt/m/cm/internal/PULSE"
alias terminal="dbus-launch gnome-session"
alias bat="bat --color=always --theme=gruvbox-dark --language=cpp"

export EDITOR=vim #"/usr/bin/vim"
export NEDITOR=nvim #"/usr/bin/vim"
export FZF="/usr/bin/fzf"
export BAT="/usr/bin/bat"



# gc = grep context with bat syntax highlighting
gc() {
    if [ -z "$1" ]; then
        echo "Usage:"
        echo "  gc <pattern>                  # recursive search in current dir"
        echo "  gc <pattern> <file_or_dir>    # search only in that file or dir (non-recursive if it's a file)"
        echo "  gc <pattern> <file1> <file2> ...   # multiple files"
        return 1
    fi

    local pattern="$1"
    shift  # remove the pattern, so $@ now contains the remaining arguments (files/dirs)

    if [ $# -eq 0 ]; then
        # No file/dir given → do recursive search in current directory
        grep -i -R -C3 --color=never \
			--group-separator=$'\n\n────────────────────────────────────────────────────────────────────────────────\n' \
			"$pattern" . \
            | bat --style=full --paging=never --language=cpp -n 
    else
	# Check if ANY of the arguments is a directory
        local has_dir=false
        for arg in "$@"; do
            if [ -d "$arg" ]; then
                has_dir=true
                break
            fi
        done
		if [ "$has_dir" = true ]; then
        	# File(s) or directory given → let grep decide (file = non-recursive, dir = recursive)
        	grep -i -R -C3 --color=never \
				--group-separator=$'\n\n────────────────────────────────────────────────────────────────────────────────\n' \
				"$pattern" "$@" \
        	    | bat --style=full --paging=never --language=cpp -n 
        else
			# File(s) or directory given → let grep decide (file = non-recursive, dir = recursive)
        	grep -i -C3 --color=never \
				--group-separator=$'\n\n────────────────────────────────────────────────────────────────────────────────\n' \
				"$pattern" "$@" \
        	    | bat --style=full --paging=never --language=cpp -n 
		fi
    fi
}


#source <($FZF --bash)

alias vimf='fzf --preview "if [[ -f {} ]]; then mime=\$(file --mime-type -b -- {}); if [[ \$mime == image/* ]]; then chafa --animate=false --size=\"\${FZF_PREVIEW_COLUMNS}x\$(( \${FZF_PREVIEW_LINES} - 3 ))\" -- {} 2>/dev/null || echo \"[Image preview failed: {}]\"; else \$BAT --color=always --theme=gruvbox-dark -n {}; fi; else echo {}; fi" \
               --preview-window=right:60% \
               --bind "enter:become(\${EDITOR:-vim} {})"'

alias vf='fzf --preview "if [[ -f {} ]]; then mime=\$(file --mime-type -b -- {}); if [[ \$mime == image/* ]]; then chafa --animate=false --size=\"\${FZF_PREVIEW_COLUMNS}x\$(( \${FZF_PREVIEW_LINES} - 3 ))\" -- {} 2>/dev/null || echo \"[Image preview failed: {}]\"; else \$BAT --color=always --theme=gruvbox-dark -n {}; fi; else echo {}; fi" \
               --preview-window=right:60% \
               --bind "enter:become(\${NEDITOR:-nvim} {})"'

# add this path for neovim
export PATH="$HOME/.local/bin/nvim-linux-x86_64/bin:$PATH"
export PATH="/home/waldc/.local/bin:$PATH"

