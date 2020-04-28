# haskell-tdlib

[Telegram library](https://github.com/tdlib/td) haskell bindings. Examples in other languages can be found [here](https://github.com/tdlib/td/tree/master/example)

This lib considers [prebuilt](https://github.com/tdlib/td#building) tdlib dynamic `libtdjson.[so|dylib|dll]` in `lib` folder.

## Run

 `stack ghci --ghci-options -ltdjson`

## Build

`stack build --ghc-options -ltdjson`

You may need to specify lib path before execution
* Mac OS: `export DYLD_LIBRARY_PATH=lib`
* Linux: `LD_LIBRARY_PATH=lib`

## Docs

Clone the repo and open `docs/index.html`

## FAQ

* Q: Why there are .hs-boot files? \
A: Because of [recursive imports](https://wiki.haskell.org/Mutually_recursive_modules). 

* Q: Why Int decoding so strange? \
A: Int64 are sent as [strings](https://github.com/tdlib/td/issues/179) and others are not.

* Q: Why you did X instead of Y? \
A: I'm new to Haskell, most likely I don’t know about it yet.

* Q: Why there are underlines in some record fields? \
A: Some record fields have different types in the same data type.

Let me know if there is an easier way to make something.

## Note

_README and FFI code was partially copied from [Nufeen/tglib-haskell-bindings](https://github.com/Nufeen/tglib-haskell-bindings)_
