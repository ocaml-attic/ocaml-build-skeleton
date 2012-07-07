#!/bin/sh -e
rm -rf install
cd lib && ocamlbuild -clean
cd ../app && ocamlbuild -clean

