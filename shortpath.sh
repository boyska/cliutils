function shortpath {
	input=$1
	path="/"
	if [ "$1" == '~' ]; then
		echo ''
		return
	fi
	if [ "${1:0:1}" == '~' ]; then
		path=''
	fi
  for dir in $(echo $input|cut -d/ -f1- --output-delimiter=' '); do
	path="$path${dir:0:1}/"
  done
  if [ "${#path}" -gt 2 ]; then
	path=${path:0:${#path}-2} #cut least two characters
  fi
  if [ "$path" == '/' ]; then
	echo ''
	return 1
  fi

  echo $path
}
