#!/bin/sh

DIR=../src/TD

rm $DIR/Reply/* -f || exit
rm $DIR/Query/* -f || exit

# wget https://raw.githubusercontent.com/tdlib/td/master/td/generate/scheme/td_api.tl -O td_api.tl
./newparser.hs

cd $DIR || exit
ormolu --mode inplace  $(find . -name '*.hs')

