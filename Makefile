SHELL=bash

URL=git@github.com:tomjridge
URL=https://github.com/tomjridge

REPOS=p1 p3 e3 p4 
EXTRA=p4.wiki dockertest fs_spec lemix-tests netsem nixpkgs pandoc-templates ssl tomjridge.github.io agda-cufp p1.wiki

all: $(REPOS) build

extra: $(EXTRA)

build: FORCE
	cd p1 && git pull && make
	cd p3 && git pull && make
	cd e3 && git pull && make
	cd p4 && git pull && cd src_ext && make e3_link && cd .. && make build

p1: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull

p3: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull

e3: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull

p4: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull

p4.wiki: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull

p1.wiki: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull


####

fs_spec: FORCE
	if [ ! -d fs_spec ]; then git clone $(URL)/fs_spec.git; fi
	cd fs_spec && git pull

lemix-tests: FORCE
	if [ ! -d lemix-tests ]; then git clone git@github.com:ocamllabs/lemix-tests.git; fi
	cd lemix-tests && git pull

netsem: FORCE
	if [ ! -d netsem ]; then git clone  https://github.com/PeterSewell/netsem.git; fi
	cd netsem && git pull

nixpkgs: FORCE
	if [ ! -d nixpkgs ]; then git clone $(URL)/nixpkgs.git; fi
	cd nixpkgs && git pull

pandoc-templates: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull

tomjridge.github.io: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull

agda-cufp: FORCE
	if [ ! -d $@ ]; then git clone $(URL)/$@; fi
	cd $@ && git pull

ssl: FORCE
	if [ ! -d $@ ]; then git clone https://github.com/xrchz/ssl.git; fi
	cd $@ && git pull


dockertest: FORCE
	if [ ! -d dockertest ]; then git clone $(URL)/dockertest.git; fi
	cd dockertest && git pull

pull:
	git pull
	for f in $(REPOS) $(EXTRA); do cd $$f && pwd && git pull && cd .. && echo; done

status:
	git status
	for f in $(REPOS) $(EXTRA); do cd $$f && pwd && git status && cd .. && echo; done

clean:
	cd p1 && make clean
	cd p3 && make clean
	cd e3 && make clean
	cd p4 && make clean

FORCE:
