setopt HIST_IGNORE_SPACE
export HISTFILE="$HOME/.zsh_history"
export TERM=xterm

export PATH="$HOME/.local/bin:/:$PATH"

# Direnv
eval "$(direnv hook zsh)"

# Starship Prompt
eval "$(starship init zsh)"

# Exa / Eza
if [ -x "/usr/bin/exa" ]; then
EXA=exa
fi
if [ -x "/usr/bin/eza" ]; then
EXA=eza
fi

alias ls="$EXA --long --git --header --modified --group --all --sort=name --group-directories-first"

# GCloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/szferi/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/szferi/Applications/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/szferi/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/szferi/Applications/google-cloud-sdk/completion.zsh.inc'; fi
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# FZF stuff
kcs() {
    local ctx
    ctx=$(kubectl config get-contexts --no-headers=true | tr -s ' ' | cut -f2 -d' ' | fzf --no-multi --ansi --header="Kubernetes Context Switch") || return
    kubectl config use-context $ctx
}

gcs() {
    local name
    name=$(gcloud config configurations list --format='get(name)' | fzf --no-multi --ansi --header="GCloud Config") || return
    gcloud config configurations activate $name
}

# git setup in devcontainer
if [ -d "/home/devuser/app" ]; then
    git config --global --add safe.directory /home/devuser/app
fi
