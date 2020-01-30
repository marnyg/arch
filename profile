# ~/.bash_profile

export PATH=$PATH:$HOME/bin
export BROWSER=qutebrowser
export EDITOR=nvim
export TERMINAL=st
export _JAVA_AWT_WM_NONREPARENTING=1
export INSTANCE_NAME="my-fastai-instance"
export INSTANCE_TYPE="n1-highmem-8"
export PATH="$PATH:/home/mar/.local/bin"
gpg-connect-agent /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

