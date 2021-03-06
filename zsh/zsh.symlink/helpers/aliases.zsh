alias git="hub"
alias py3init="echo 'use python 3.7.1' > .envrc && direnv allow"
alias pynviminit="pip install python-language-server pyls-isort pyls-black pyls-mypy"
alias py36init="echo 'use python 3.6.5' > .envrc && direnv allow"
alias py2init="echo 'use python 2.7.15' > .envrc && direnv allow"
alias pyenvbrewinstall='CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install'
alias corpify="touch .envrc && echo 'export GITHUB_HOST=git.corp.adobe.com' >> .envrc && direnv allow"
alias dc="docker-compose"
alias dm="docker-machine"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias neovimconfig="nvim ~/.config/nvim/init.vim"
alias fixmacvideo='sudo killall VDCAssistant'
alias gc-docker='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc -e REMOVE_VOLUMES=1 spotify/docker-gc'
alias vpnvirginia='sudo openconnect --user=mtoledo asa-virginia-1.adobe.com'
alias vault_login='vault login -method=ldap username=${USER} && export VAULT_TOKEN=$(vault token lookup | grep id | tail -n 1 | tr -s " " | cut -d " " -f2)'
