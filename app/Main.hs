module Main (main) where

import Control.Monad (when)
import TD.Data.AuthorizationState qualified as A
import TD.Data.Update qualified as U
import TD.GeneralResult (GeneralResult (Update))
import TD.Lib
import TD.Query.Close qualified
import TD.Query.GetCurrentState qualified
import TD.Query.SetAlarm qualified
import TD.Query.SetLogVerbosityLevel qualified
import TD.Query.TestCallBytes qualified
import TD.Query.TestCallString qualified

main :: IO ()
main = do
  client <- create
  extra1 <-
    sendWExtra client (TD.Query.SetLogVerbosityLevel.SetLogVerbosityLevel (Just 2))
  extra2 <- sendWExtra client TD.Query.GetCurrentState.GetCurrentState
  extra3 <- createExtra ("testExtra3" :: String)
  extra4 <- createExtra ("testExtra4" :: String)
  sendWMyExtra client (TD.Query.SetAlarm.SetAlarm (Just 0)) extra3
  sendWMyExtra client (TD.Query.SetAlarm.SetAlarm (Just 5)) extra4
  send client TD.Query.TestCallBytes.TestCallBytes {x = Just "qwerty"}
  send client TD.Query.TestCallString.TestCallString {x = Just "qwerty"}
  _ <- live client extra1 extra2 extra3 extra4
  destroy client
  where
    live c x1 x2 x3 x4 = do
      r <- receive c
      case r of
        Nothing -> live c x1 x2 x3 x4
        Just (Update (U.UpdateAuthorizationState (Just A.AuthorizationStateClosed)), _) ->
          pure ()
        Just (res, extra) -> do
          when (extra == Just x1) $ putStr "* Answer to extra1: "
          when (extra == Just x2) $ putStr "* Answer to extra2: "
          when (extra == Just x3) $ putStr "* Answer to extra3: "
          when (extra == Just x4) $ putStr "* Answer to extra4: " >> send c TD.Query.Close.Close
          print res
          putStrLn ""
          live c x1 x2 x3 x4
