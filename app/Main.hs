{-# LANGUAGE OverloadedStrings #-}

module Main where

import API.Functions.GetCurrentState
import API.Functions.SetLogVerbosityLevel
import API.GeneralResult
import Control.Monad (when)
import TDLib

main :: IO ()
main = do
  client <- create
  extra1 <-
    sendWExtra
      client
      API.Functions.SetLogVerbosityLevel.SetLogVerbosityLevel
        { new_verbosity_level = Just 2
        }
  extra2 <- sendWExtra client API.Functions.GetCurrentState.GetCurrentState
  live client extra1 extra2
  destroy client
  where
    live c x1 x2 = do
      r <- receive c
      case r of
        Nothing -> return ()
        Just result -> do
          let ResultWithExtra res extra = result
          when (extra == Just x1) $ putStr "answer to SetVerbosityLevel: "
          when (extra == Just x2) $ putStr "answer to GetCurrentState: "
          print res
      live c x1 x2
