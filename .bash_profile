# ALL alias config comes from .bash_alias
source ~/.bash_alias

# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME="$HOME/python_studio"
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# source /usr/local/bin/virtualenvwrapper.sh



# Some variables
HISTSIZE=5000
HISTFILESIZE=5000

export PATH="$PATH":/Users/yong/.node/bin:/usr/local/mysql/bin:~/bin:~/bin/python_bin:~/python_studio/bin
export PYTHONPATH="$PYTHONPATH":~/python_studio #:/usr/local/lib/python3.5/site-packages
export EDITOR=subl
eval $(thefuck --alias fuck)

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

functio nlcd() {
	cd "$*"; ls ; 
}

function touch_open() {
	filename="$*"
	if [[ ! $filename ]]; then
		echo -n "File name: "
		read filename
		if [[ ! $filename ]]; then
			echo "Missing filename"
			return
		fi
	fi

	\touch "$filename"	
	if [[ $EDITOR ]]; then
		$EDITOR "$filename"
	fi
}


function are_you_sure() {
	echo -n "Are you sure (Y/N)? "
	result=

	while [[ ! $result ]]; do
		read -r -k -s key
		if [[ $key = [Yy] ]]; then
			result='Y'
		elif [[ $key = [Nn] ]]; then
			result='N'	
		fi
	done

	echo $result
}

# move to fantp and start a console
function fantp() {
	cd ~/Workspace/ps_workspace/fantp
	check_ps_running "Sublime Text" || subl .
	NODE_ENV=dev npm start
}

# check is a process is running by name. 
# e.g. if check_ps_running Sublime; then echo yes; fi
function check_ps_running() {
	[[ $1 ]] || { echo "Missing process name" >&2; exit 1; }
	# ps aux | grep "$1" | grep -v "grep" | wc -l
	[[ $( pgrep -f -i "$1" | wc -l ) -gt 0 ]]
}

# kill a process by name, e.g. killname Sublime
function killname() {
	x=$( pgrep -i $1 )
	echo $x
	[[ $x ]] && kill $x || echo "$1 not found" 
}

function addalias() {
	if [[ $# -ne 2 ]]; then
		echo "Two arguments required" >&2
		return 1
	fi

	echo "alias $1='$2'" >> ~/.bash_alias

}




