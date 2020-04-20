-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallConnection where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CallConnection = 
 CallConnection { peer_tag :: String, port :: Int, ipv6 :: String, ip :: String, _id :: Int }  -- deriving (Show)

instance T.ToJSON CallConnection where
 toJSON (CallConnection { peer_tag = peer_tag, port = port, ipv6 = ipv6, ip = ip, _id = _id }) =
  A.object [ "@type" A..= T.String "callConnection", "peer_tag" A..= peer_tag, "port" A..= port, "ipv6" A..= ipv6, "ip" A..= ip, "id" A..= _id ]
-- callConnection CallConnection  { peer_tag :: String, port :: Int, ipv6 :: String, ip :: String, _id :: Int } 

