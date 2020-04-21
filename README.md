# haskell-tdlib

[Telegram library](https://github.com/tdlib/td) haskell bindings.Examples in other languages can be found [here](https://github.com/tdlib/td/tree/master/example)

This lib considers prebuilt dynamic `libtdjson.[so|dylib|dll]` in `lib` folder.

# Run

1. [Build](https://github.com/tdlib/td#building) tdlib

2. Run
```
stack ghci --ghci-options -ltdjson
```
or
```
LD_LIBRARY_PATH=lib stack exec haskell-tdlib-exe
```
or
```
LD_LIBRARY_PATH=lib stack run
```

# Build

```
stack build --ghc-options -ltdjson
```

In case of Mac OS you may need to specify lib path before execution:

```
export DYLD_LIBRARY_PATH=lib
```

# Note

_README and FFI code was partially copied from [Nufeen/tglib-haskell-bindings](https://github.com/Nufeen/tglib-haskell-bindings)_