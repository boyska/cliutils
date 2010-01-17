remove_semi_empty_dirs() {
  for dir in */; do
	if [ "$dir" == '*/' ]; then
	  return 0
	fi
	cd "$dir"
	remove_semi_empty_dirs.sh
	cd ..
	size=`du -sb "$dir"|cut -f1`
	if [ $size -lt 1000000 ] ; then
	  echo DELETING $dir $size
	  rm -rf "$dir"
	fi
  done
}
