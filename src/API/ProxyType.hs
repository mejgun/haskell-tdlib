-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ProxyType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes the type of a proxy server
data ProxyType = 
 -- |
 -- 
 -- A SOCKS5 proxy server 
 -- 
 -- __username__ Username for logging in; may be empty
 -- 
 -- __password__ Password for logging in; may be empty
 ProxyTypeSocks5 { password :: Maybe String, username :: Maybe String }  |
 -- |
 -- 
 -- A HTTP transparent proxy server 
 -- 
 -- __username__ Username for logging in; may be empty
 -- 
 -- __password__ Password for logging in; may be empty
 -- 
 -- __http_only__ Pass true if the proxy supports only HTTP requests and doesn't support transparent TCP connections via HTTP CONNECT method
 ProxyTypeHttp { http_only :: Maybe Bool, password :: Maybe String, username :: Maybe String }  |
 -- |
 -- 
 -- An MTProto proxy server 
 -- 
 -- __secret__ The proxy's secret in hexadecimal encoding
 ProxyTypeMtproto { secret :: Maybe String }  deriving (Eq)

instance Show ProxyType where
 show ProxyTypeSocks5 { password=password, username=username } =
  "ProxyTypeSocks5" ++ cc [p "password" password, p "username" username ]

 show ProxyTypeHttp { http_only=http_only, password=password, username=username } =
  "ProxyTypeHttp" ++ cc [p "http_only" http_only, p "password" password, p "username" username ]

 show ProxyTypeMtproto { secret=secret } =
  "ProxyTypeMtproto" ++ cc [p "secret" secret ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ProxyType where
 toJSON ProxyTypeSocks5 { password = password, username = username } =
  A.object [ "@type" A..= T.String "proxyTypeSocks5", "password" A..= password, "username" A..= username ]

 toJSON ProxyTypeHttp { http_only = http_only, password = password, username = username } =
  A.object [ "@type" A..= T.String "proxyTypeHttp", "http_only" A..= http_only, "password" A..= password, "username" A..= username ]

 toJSON ProxyTypeMtproto { secret = secret } =
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
    password <- o A..:? "password"
    username <- o A..:? "username"
    return $ ProxyTypeSocks5 { password = password, username = username }

   parseProxyTypeHttp :: A.Value -> T.Parser ProxyType
   parseProxyTypeHttp = A.withObject "ProxyTypeHttp" $ \o -> do
    http_only <- o A..:? "http_only"
    password <- o A..:? "password"
    username <- o A..:? "username"
    return $ ProxyTypeHttp { http_only = http_only, password = password, username = username }

   parseProxyTypeMtproto :: A.Value -> T.Parser ProxyType
   parseProxyTypeMtproto = A.withObject "ProxyTypeMtproto" $ \o -> do
    secret <- o A..:? "secret"
    return $ ProxyTypeMtproto { secret = secret }
 parseJSON _ = mempty
