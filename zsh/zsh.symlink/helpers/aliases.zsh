alias git="hub"
alias py3init="echo 'use python 3.7.0' > .envrc && direnv allow"
alias py36init="echo 'use python 3.6.5' > .envrc && direnv allow"
alias py2init="echo 'use python 2.7.15' > .envrc && direnv allow"
alias corpify="touch .envrc && echo 'export GITHUB_HOST=git.corp.adobe.com' >> .envrc && direnv allow"
alias dc="docker-compose"
alias dm="docker-machine"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias chefenv="eval $(chef shell-init zsh)"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias neovimconfig="nvim ~/.config/nvim/init.vim"
alias fixmacvideo='sudo killall VDCAssistant'
alias gc-docker='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc -e REMOVE_VOLUMES=1 spotify/docker-gc'
