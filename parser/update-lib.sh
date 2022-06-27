#!/bin/sh
set -e
set -x

DIR=../src/TD

mkdir -p $DIR/Data
mkdir -p $DIR/Query
rm $DIR/Data/* -f
rm $DIR/Query/* -f

# wget https://raw.githubusercontent.com/tdlib/td/master/td/generate/scheme/td_api.tl -O td_api.tl
./newparser.hs

cd $DIR
ormolu --mode inplace $(find . -name '*.hs')

