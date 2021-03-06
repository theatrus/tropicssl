
DESTDIR=/usr/local
PREFIX=tropicssl_

.PHONY: all

all:
	make -C library all
	make -C programs all

.PHONY: install

install:
	mkdir -p $(DESTDIR)/include/tropicssl
	cp -r include/tropicssl $(DESTDIR)/include

	mkdir -p $(DESTDIR)/lib
	cp library/libtropicssl.* $(DESTDIR)/lib

	mkdir -p $(DESTDIR)/bin
	for p in programs/*/* ; do              \
	    if [ -x $$p ] && [ ! -d $$p ] ;     \
	    then                                \
	        f=$(PREFIX)`basename $$p` ;     \
	        cp $$p $(DESTDIR)/bin/$$f ;     \
	    fi                                  \
	done

.PHONY: clean

clean:
	make -C library clean
	make -C programs clean

