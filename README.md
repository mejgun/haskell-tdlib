# haskell-tdlib

[Telegram library](https://github.com/tdlib/td) haskell bindings. Examples in other languages can be found [here](https://github.com/tdlib/td/tree/master/example)

This lib considers [prebuilt](https://github.com/tdlib/td#building) tdlib dynamic `libtdjson.[so|dylib|dll]` in `lib` folder.

## Use (stack)

Add dependency to stack.yaml file (do not copy this commit hash)

```yaml
extra-deps:
- git: https://github.com/mejgun/haskell-tdlib.git
  commit: a4bd75bd7621a2b0873688dbc24cfaf26c1f14ba
```

You may need to specify lib path before running app
* Mac OS: `export DYLD_LIBRARY_PATH=lib`
* Linux: `LD_LIBRARY_PATH=lib`

## Usage example

[queueBot](https://github.com/mejgun/queueBot)

## Docs

  * [Online](https://haskell-tdlib.netlify.app)
  * Offline - `git clone https://github.com/mejgun/haskell-tdlib-docs`


## Notes

  * There are .hs-boot files because of [recursive imports](https://wiki.haskell.org/Mutually_recursive_modules).  
  * TDLib stored Int64 [as string](https://github.com/tdlib/td/issues/179).
  * [Extra](https://haskell-tdlib.netlify.app/td-lib#t:Extra) needed to [match requests with the corresponding responses](https://core.telegram.org/tdlib/getting-started)

Let me know if there is an easier way to make something.

_README and FFI code was partially copied from [Nufeen/tglib-haskell-bindings](https://github.com/Nufeen/tglib-haskell-bindings)_
