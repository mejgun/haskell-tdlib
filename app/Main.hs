module Main where

import           API.GeneralResult
import           API.Ok
import           API.Messages
import           Data.Aeson

main :: IO ()
main = do
  --let k = API.Ok.Ok
  let k = API.Messages.Messages { API.Messages.messages    = []
                                , API.Messages.total_count = 998
                                }
  let t = encode k
  print t
  let m = decode t :: Maybe API.GeneralResult.GeneralResult
  print m

  putStrLn "ok"


