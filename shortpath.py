#!/usr/bin/python
import sys
import os

#arguments handling
if len(sys.argv) != 2:
	print 'Usage:'
	print '\t' + sys.argv[0] + ' path'
	sys.exit(1)
path = sys.argv[1]

#save space wiht ~
home = os.environ.get("HOME")
home.rstrip('/')
if path.startswith(home):
	path = path.replace(home, '~', 1)

#real job
dirs = path.split('/')
new = ''
if dirs[0] == '':
	dirs.pop(0)
	new += '/'

for dir in dirs[:-1]:
	new += dir[0]
	new += '/'



print new
