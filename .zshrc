eval "$(zoxide init zsh)"

#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        source "$BASE16_SHELL/profile_helper.sh"

source ~/.aliases
source ~/.functions

if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# oh-my-posh
# eval "$(oh-my-posh init zsh --config ~/code/dotfiles/armno.omp.json)"

# or starship
eval "$(starship init zsh)"

# https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

#https://gist.github.com/matthewmccullough/787142
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

autoload -Uz compinit
compinit

zstyle ':completion:*' menu no          # fzf-tab provides its own menu
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# fzf-tab: replace the completion menu with an fzf fuzzy finder.
# Must load after compinit but before autosuggestions/syntax-highlighting (they wrap the Tab widget).
if [ -r /usr/share/zsh/plugins/fzf-tab/fzf-tab.zsh ]; then
  source /usr/share/zsh/plugins/fzf-tab/fzf-tab.zsh
elif [ -r /opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh ]; then
  source /opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh
fi

if [ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export EDITOR=vim
