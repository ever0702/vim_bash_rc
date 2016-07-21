# ALL alias config comes from .bash_alias
source ~/.bash_alias

export PATH="$PATH":/Users/yong/.node/bin:~/bin
export EDITOR=subl
eval $(thefuck --alias fuck)
function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }
