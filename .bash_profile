# ALL alias config comes from .bash_alias
source ~/.bash_alias

export PATH="$PATH":/Users/yong/.node/bin:~/bin
export EDITOR=subl
eval $(thefuck --alias fuck)

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

function lcd() {
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







