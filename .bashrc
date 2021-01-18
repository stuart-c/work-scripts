SSH_ENV="$HOME/.ssh/environment"
SSH_ALL=$(find $HOME/.ssh/id_* ! -name '*.pub' -prune)

PATH="$HOME/bin:/Applications/VMware OVF Tool:/usr/local/opt/python@3.8/libexec/bin:$PATH"

export PYTHONPATH="$HOME/Library/Python/3.7/lib/python/site-packages/"
 
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add $SSH_ALL;
}
 
# Source SSH settings, if applicable
 
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

export KUBECONFIG=~/.kube/config

source ~/.git-completion.bash
source ~/.git-prompt.sh

GITHUB_TOKEN=`cat ~/.github-token`
AWS_REGION="eu-west-1"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

complete -C /usr/local/bin/terraform terraform
source <(helm completion bash)
source <(kubectl completion bash)

export VAULT_ADDR="https://vault.shared.global.com"
export CHEF_LICENSE="accept-no-persist"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export ANSIBLE_SCP_IF_SSH=true
