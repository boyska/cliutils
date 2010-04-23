echo 'SELECT title, ical_status, priority FROM cal_todos;' | sqlite3 ~/.thunderbird/*/calendar-data/local.sqlite |
while read line; do
  completed=$(echo $line|cut -d '|' -f2)
  if [ "$completed" != 'COMPLETED' ]; then
	if [ "$1" == "" ]; then
	  echo $line|cut -d '|' -f1
	elif [ "$1" == "normal" ]; then
	  if [ "$(echo $line|cut -d '|' -f3)" == "" ]; then
		echo $line|cut -d '|' -f1
	  fi
	elif [ "$1" == "low" ]; then
	  if [ "$(echo $line|cut -d '|' -f3)" == "9" ]; then
		echo $line|cut -d '|' -f1
	  fi
	elif [ "$1" == "normal" ]; then
	  if [ "$(echo $line|cut -d '|' -f3)" == "1" ]; then
		echo $line|cut -d '|' -f1
	  fi
	fi
  fi
done
