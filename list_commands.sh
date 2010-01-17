all_cmd() {
  for dir in $(echo $PATH|cut -d: -f1- --output-delim=' '); do
	find $dir -executable -xtype f -exec basename {} \; 2> /dev/null
  done
}
