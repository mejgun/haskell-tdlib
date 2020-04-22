
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
  extra1 <- sendWExtra
    client
    API.Functions.SetLogVerbosityLevel.SetLogVerbosityLevel
      { new_verbosity_level = 2
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

