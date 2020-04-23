-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ProxyType where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ProxyType = 
 ProxyTypeSocks5 { password :: Maybe String, username :: Maybe String }  
 | ProxyTypeHttp { http_only :: Maybe Bool, password :: Maybe String, username :: Maybe String }  
 | ProxyTypeMtproto { secret :: Maybe String }  deriving (Show)

instance T.ToJSON ProxyType where
 toJSON (ProxyTypeSocks5 { password = password, username = username }) =
  A.object [ "@type" A..= T.String "proxyTypeSocks5", "password" A..= password, "username" A..= username ]

 toJSON (ProxyTypeHttp { http_only = http_only, password = password, username = username }) =
  A.object [ "@type" A..= T.String "proxyTypeHttp", "http_only" A..= http_only, "password" A..= password, "username" A..= username ]

 toJSON (ProxyTypeMtproto { secret = secret }) =
  A.object [ "@type" A..= T.String "proxyTypeMtproto", "secret" A..= secret ]

instance T.FromJSON ProxyType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "proxyTypeSocks5" -> parseProxyTypeSocks5 v
   "proxyTypeHttp" -> parseProxyTypeHttp v
   "proxyTypeMtproto" -> parseProxyTypeMtproto v
   _ -> mempty
  where
   parseProxyTypeSocks5 :: A.Value -> T.Parser ProxyType
   parseProxyTypeSocks5 = A.withObject "ProxyTypeSocks5" $ \o -> do
    password <- optional $ o A..: "password"
    username <- optional $ o A..: "username"
    return $ ProxyTypeSocks5 { password = password, username = username }

   parseProxyTypeHttp :: A.Value -> T.Parser ProxyType
   parseProxyTypeHttp = A.withObject "ProxyTypeHttp" $ \o -> do
    http_only <- optional $ o A..: "http_only"
    password <- optional $ o A..: "password"
    username <- optional $ o A..: "username"
    return $ ProxyTypeHttp { http_only = http_only, password = password, username = username }

   parseProxyTypeMtproto :: A.Value -> T.Parser ProxyType
   parseProxyTypeMtproto = A.withObject "ProxyTypeMtproto" $ \o -> do
    secret <- optional $ o A..: "secret"
    return $ ProxyTypeMtproto { secret = secret }