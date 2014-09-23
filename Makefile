SHELL=bash

URL=git@github.com:tomjridge
URL=https://github.com/tomjridge

all: p1 e3 p4

p1: FORCE
	if [ ! -d p1 ]; then git clone $(URL)/p1.git; fi
	cd p1 && git pull && make

e3: FORCE
	if [ ! -d e3 ]; then git clone $(URL)/e3.git; fi
	cd e3 && git pull && make

p4: FORCE
	if [ ! -d p4 ]; then git clone $(URL)/p4.git; fi
	cd p4 && git pull && cd src_ext && make e3_link && cd .. && make build

status:
	for f in p1 e3 p4; do cd $$f && pwd && git status && cd .. && echo; done

clean:
	cd p1 && make clean
	cd e3 && make clean
	cd p4 && make realclean

FORCE:
