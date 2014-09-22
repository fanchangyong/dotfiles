
# Check program has been installed
function has(){
	if type $1 1>/dev/null 2>&1; then
		return 0;
	fi
	return 1;
}
