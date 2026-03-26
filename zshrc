# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(aliases aws brew docker gh git kubectl kubectx kube-ps1 terraform vscode)

source $ZSH/oh-my-zsh.sh

# Kubernetes
export KUBECONFIG="$HOME/.kube/config-tunnel"

# Additional tools
export PATH="$PATH:$HOME/bin"

# Auth0 credentials
set -a; source ~/.env.auth0; set +a

# Terragrunt caching
export TG_PROVIDER_CACHE=1
export TG_DOWNLOAD_DIR="$HOME/.cache/terragrunt/downloads"

# AWS profile switcher
alias awsd="source _awsd"
export AWS_PROFILE=$(cat ~/.awsd)
local aws_info='$(aws_prof)'
function aws_prof {
    local profile="${AWS_PROFILE:=}"
    echo -n "%{$fg_bold[blue]%}aws:(%{$fg[cyan]%}${profile}%{$fg_bold[blue]%})%{$reset_color%} "
}

# Prompt
PROMPT='$(kube_ps1)'$PROMPT
#PROMPT='$(kubectx_prompt_info) '$PROMPT
PROMPT='$(aws_prof)'$PROMPT
RPROMPT=''

# Aliases
alias python='python3'
alias saml='saml2aws login --skip-prompt --role=arn:aws:iam::157380443357:role/reedai-admin'
alias tunnel='bash ~/github/reed-ai-technology/rai-infra/scripts/multi-tunnel.sh --profile dev --prod-profile prod'
alias upall='find ~/github -type d -mindepth 2 -maxdepth 2 | xargs -I{} bash -c "cd {};git pull --prune"'
