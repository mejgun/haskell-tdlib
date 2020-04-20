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



instance T.FromJSON ProxyType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "proxyTypeSocks5" -> parseProxyTypeSocks5 v
   "proxyTypeHttp" -> parseProxyTypeHttp v
   "proxyTypeMtproto" -> parseProxyTypeMtproto v
  where
   parseProxyTypeSocks5 :: A.Value -> T.Parser ProxyType
   parseProxyTypeSocks5 = A.withObject "ProxyTypeSocks5" $ \o -> do
    password <- o A..: "password"
    username <- o A..: "username"
    return $ ProxyTypeSocks5 { password = password, username = username }

   parseProxyTypeHttp :: A.Value -> T.Parser ProxyType
   parseProxyTypeHttp = A.withObject "ProxyTypeHttp" $ \o -> do
    http_only <- o A..: "http_only"
    password <- o A..: "password"
    username <- o A..: "username"
    return $ ProxyTypeHttp { http_only = http_only, password = password, username = username }

   parseProxyTypeMtproto :: A.Value -> T.Parser ProxyType
   parseProxyTypeMtproto = A.withObject "ProxyTypeMtproto" $ \o -> do
    secret <- o A..: "secret"
    return $ ProxyTypeMtproto { secret = secret }