-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ProxyType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ProxyType = 
 ProxyTypeSocks5 { password :: String, username :: String }  
 | ProxyTypeHttp { http_only :: Bool, password :: String, username :: String }  
 | ProxyTypeMtproto { secret :: String }  -- deriving (Show)

instance T.ToJSON ProxyType where
 toJSON (ProxyTypeSocks5 { password = password, username = username }) =
  A.object [ "@type" A..= T.String "proxyTypeSocks5", "password" A..= password, "username" A..= username ]

 toJSON (ProxyTypeHttp { http_only = http_only, password = password, username = username }) =
  A.object [ "@type" A..= T.String "proxyTypeHttp", "http_only" A..= http_only, "password" A..= password, "username" A..= username ]

 toJSON (ProxyTypeMtproto { secret = secret }) =
  A.object [ "@type" A..= T.String "proxyTypeMtproto", "secret" A..= secret ]
-- proxyTypeSocks5 ProxyType  { password :: String, username :: String } 

-- proxyTypeHttp ProxyType  { http_only :: Bool, password :: String, username :: String } 

-- proxyTypeMtproto ProxyType  { secret :: String } 

