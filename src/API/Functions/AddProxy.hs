-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

--main = putStrLn "ok"

data AddProxy = 
 AddProxy { _type :: ProxyType.ProxyType, enable :: Bool, port :: Int, server :: String }  -- deriving (Show)

instance T.ToJSON AddProxy where
 toJSON (AddProxy { _type = _type, enable = enable, port = port, server = server }) =
  A.object [ "@type" A..= T.String "addProxy", "type" A..= _type, "enable" A..= enable, "port" A..= port, "server" A..= server ]
-- addProxy AddProxy  { _type :: ProxyType.ProxyType, enable :: Bool, port :: Int, server :: String } 

