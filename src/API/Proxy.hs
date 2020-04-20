-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Proxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

--main = putStrLn "ok"

data Proxy = 
 Proxy { _type :: ProxyType.ProxyType, is_enabled :: Bool, last_used_date :: Int, port :: Int, server :: String, _id :: Int }  -- deriving (Show)

instance T.ToJSON Proxy where
 toJSON (Proxy { _type = _type, is_enabled = is_enabled, last_used_date = last_used_date, port = port, server = server, _id = _id }) =
  A.object [ "@type" A..= T.String "proxy", "type" A..= _type, "is_enabled" A..= is_enabled, "last_used_date" A..= last_used_date, "port" A..= port, "server" A..= server, "id" A..= _id ]
-- proxy Proxy  { _type :: ProxyType.ProxyType, is_enabled :: Bool, last_used_date :: Int, port :: Int, server :: String, _id :: Int } 

