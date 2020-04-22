
{-# LANGUAGE OverloadedStrings #-}


module Main where



import           API.GeneralResult
-- import           API.Ok
import           API.Functions.SetLogVerbosityLevel
import           API.Functions.GetCurrentState
import           Data.Aeson                     ( decode
                                                , encode
                                                , ToJSON
                                                )
import qualified Data.ByteString               as B
import qualified Data.ByteString.Lazy          as BL
import           TDLib


import           Foreign.C.String
import           Foreign.C.Types
import           Foreign


-- main :: IO ()
-- main = do
--   let k = API.Ok.Ok
--   --let k = API.Messages.Messages { API.Messages.messages    = []
--                                 --, API.Messages.total_count = 998
--                                 --}
--   let t = encode k
--   print t
--   let m = decode t :: Maybe API.GeneralResult.GeneralResult
--   print m

--   putStrLn "ok"

main :: IO ()
main = do
  client <- create
  --send client testQuery1
  --execute client testQuery2
  extra  <- sendWExtra
    client
    API.Functions.SetLogVerbosityLevel.SetLogVerbosityLevel
      { new_verbosity_level = 2
      }
  print extra
  extra2 <- sendWExtra client API.Functions.GetCurrentState.GetCurrentState
  print extra2
  live client
  destroy client
 where
  live c = do
    r <- receive c
    case r of
      Just (Ok v extra) -> do
        putStr "answer to SetVerbosityLevel: "
        print v
      Just (Updates v extra2) -> do
        putStr "answer to GetCurrentState: "
        print v
      Nothing -> return ()
      _       -> print r
    live c


