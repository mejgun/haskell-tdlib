
{-# LANGUAGE OverloadedStrings #-}


module Main where



import           API.GeneralResult
-- import           API.Ok
import           API.Functions.SetLogVerbosityLevel
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
  send
    client
    API.Functions.SetLogVerbosityLevel.SetLogVerbosityLevel
      { new_verbosity_level = 2
      }
  live client
  destroy client
 where
  live c = do
    cs <- receive c
    if cs /= nullPtr
      then do
        bs <- B.packCString cs
        let s = BL.fromStrict bs
        let z = decode s :: Maybe API.GeneralResult.GeneralResult
        print z
      else return ()
    live c


