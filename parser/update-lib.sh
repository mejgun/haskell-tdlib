#!/bin/sh

DIR=../src/TD

mkdir -p $DIR/Data || exit
mkdir -p $DIR/Query || exit
rm $DIR/Data/* -f || exit
rm $DIR/Query/* -f || exit

# wget https://raw.githubusercontent.com/tdlib/td/master/td/generate/scheme/td_api.tl -O td_api.tl
./newparser.hs

cd $DIR || exit
ormolu --mode inplace $(find . -name '*.hs')
