-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

--main = putStrLn "ok"

data EditProxy = 
 EditProxy { _type :: ProxyType.ProxyType, enable :: Bool, port :: Int, server :: String, proxy_id :: Int }  -- deriving (Show)

instance T.ToJSON EditProxy where
 toJSON (EditProxy { _type = _type, enable = enable, port = port, server = server, proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "editProxy", "type" A..= _type, "enable" A..= enable, "port" A..= port, "server" A..= server, "proxy_id" A..= proxy_id ]
-- editProxy EditProxy  { _type :: ProxyType.ProxyType, enable :: Bool, port :: Int, server :: String, proxy_id :: Int } 

