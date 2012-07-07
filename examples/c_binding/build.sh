#!/bin/sh -e

INSTALL_DIR=`pwd`/install

cd lib
ocamlbuild -clean

# build the static librarie
ocamlbuild -classic-display foo.cmxa foo.cma
env LIBRARY_PATH=.  ocamlbuild -classic-display foo.cmxs

# copy files to an "install" location
files="dllhello.so libhello.a foo.a foo.cma foo.cmxa hello.cmi"
cd ..
rm -rf ${INSTALL_DIR}
mkdir ${INSTALL_DIR}
for f in $files; do cp lib/_build/$f ${INSTALL_DIR}/$f; done

# build the application that uses the library
cd app
ocamlbuild -clean
ocamlbuild -classic-display bar.native bar.byte
./_build/bar.native
env CAML_LD_LIBRARY_PATH=${INSTALL_DIR} ./_build/bar.byte
ocamlbuild -classic-display bardyn.byte bar.cmxs bar.cma

# running from _build since the dynlink file is in there
cd _build
env CAML_LD_LIBRARY_PATH=${INSTALL_DIR} ./bardyn.byte
cd ..
ocamlbuild -classic-display bardyn.native
cd _build
env CAML_LD_LIBRARY_PATH=${INSTALL_DIR} ./bardyn.byte
