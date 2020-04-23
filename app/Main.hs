{-# LANGUAGE OverloadedStrings #-}

module Main where

import           API.GeneralResult
import           API.Functions.SetLogVerbosityLevel
import           API.Functions.GetCurrentState

import           TDLib

main :: IO ()
main = do
  client <- create
  extra1 <- sendWExtra
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
      Nothing     -> return ()
      Just result -> do
        let ResultWithExtra res extra = result
        if extra == Just x1
          then do
            putStr "answer to SetVerbosityLevel: "
          else return ()
        if extra == Just x2
          then do
            putStr "answer to GetCurrentState: "
          else return ()
        print res
    live c x1 x2
