SHELL=bash

URL=git@github.com:tomjridge
URL=https://github.com/tomjridge

REPOS=p1 p3 e3 p4 dockertest

all: $(REPOS)

p1: FORCE
	if [ ! -d p1 ]; then git clone $(URL)/p1.git; fi
	cd p1 && git pull && make

p3: FORCE
	if [ ! -d p3 ]; then git clone $(URL)/p3.git; fi
	cd p3 && git pull && make

e3: FORCE
	if [ ! -d e3 ]; then git clone $(URL)/e3.git; fi
	cd e3 && git pull && make

p4: FORCE
	if [ ! -d p4 ]; then git clone $(URL)/p4.git; fi
	cd p4 && git pull && cd src_ext && make e3_link && cd .. && make build

dockertest: FORCE
	cd dockertest && git pull

pull:
	git pull
	for f in $(REPOS); do cd $$f && pwd && git pull && cd .. && echo; done

status:
	git status
	for f in $(REPOS); do cd $$f && pwd && git status && cd .. && echo; done

clean:
	cd p1 && make clean
	cd p3 && make clean
	cd e3 && make clean
	cd p4 && make realclean

FORCE:
