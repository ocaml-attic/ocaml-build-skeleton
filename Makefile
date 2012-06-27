.PHONY: all

NAME ?= ocaml-skeleton
PREFIX ?= /usr/local
BIN ?= $(PREFIX)/bin
SHARE ?= $(PREFIX)/share/$(NAME)

all:
	@ :

install:
	mkdir -p $(BIN) $(SHARE)
	cp files/* $(SHARE)
	sed -e 's,@SHARE@,$(SHARE),g' < bin/ocaml-init-project > $(BIN)/ocaml-init-project
	chmod a+x $(BIN)/ocaml-init-project
