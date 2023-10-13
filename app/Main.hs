module Main (main) where

import Control.Monad (when)
import TD.Lib
import TD.Query.GetCurrentState
import TD.Query.SetLogVerbosityLevel
import TD.Query.TestCallBytes
import TD.Query.TestCallString

main :: IO ()
main = do
  client <- create
  extra1 <-
    sendWExtra
      client
      TD.Query.SetLogVerbosityLevel.SetLogVerbosityLevel
        { new_verbosity_level = Just 2
        }
  extra2 <- sendWExtra client TD.Query.GetCurrentState.GetCurrentState
  send client TD.Query.TestCallBytes.TestCallBytes {x = Just "qwerty"}
  send client TD.Query.TestCallString.TestCallString {x = Just "qwerty"}
  _ <- live client extra1 extra2
  destroy client
  where
    live c x1 x2 = do
      r <- receive c
      case r of
        Nothing -> return ()
        Just (res, extra) -> do
          when (extra == Just x1) $ putStr "answer to SetVerbosityLevel: "
          when (extra == Just x2) $ putStr "answer to GetCurrentState: "
          print res
      live c x1 x2
