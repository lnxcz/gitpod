#!/bin/bash

if [ -x "$(command -v zsh)" ]; then
    if [ -x "$(command -v brew)" ]; then
        brew install \
        zsh-autosuggestions \
        zsh-syntax-highlighting
    fi
    
    sh <(curl -sS https://starship.rs/install.sh) -y
    
    echo "Configuring zsh..." &&
    {
        echo 'eval "$(starship init zsh)"'
        
        echo "export SHELL=$(which zsh)"
        
        echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
        echo 'source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
        
        echo 'export FZF_DEFAULT_COMMAND="rg --files"'
        
        echo 'if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi'
        echo 'if [[ -n $SSH_CONNECTION ]]; then cd $GITPOD_REPO_ROOT; fi'
        
        echo 'export NVM_DIR="$HOME/.nvm"'
        echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
        echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
        
        echo 'export PNPM_HOME="$HOME/.local/share/pnpm"'
        echo 'export PATH="$PNPM_HOME:$PATH"'
    } >>~/.zshrc &&
    echo "Done!"
fi