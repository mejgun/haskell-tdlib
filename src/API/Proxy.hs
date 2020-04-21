-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Proxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

data Proxy = 
 Proxy { _type :: ProxyType.ProxyType, is_enabled :: Bool, last_used_date :: Int, port :: Int, server :: String, _id :: Int }  deriving (Show)

instance T.ToJSON Proxy where
 toJSON (Proxy { _type = _type, is_enabled = is_enabled, last_used_date = last_used_date, port = port, server = server, _id = _id }) =
  A.object [ "@type" A..= T.String "proxy", "type" A..= _type, "is_enabled" A..= is_enabled, "last_used_date" A..= last_used_date, "port" A..= port, "server" A..= server, "id" A..= _id ]

instance T.FromJSON Proxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "proxy" -> parseProxy v
   _ -> mempty
  where
   parseProxy :: A.Value -> T.Parser Proxy
   parseProxy = A.withObject "Proxy" $ \o -> do
    _type <- o A..: "type"
    is_enabled <- o A..: "is_enabled"
    last_used_date <- o A..: "last_used_date"
    port <- o A..: "port"
    server <- o A..: "server"
    _id <- o A..: "id"
    return $ Proxy { _type = _type, is_enabled = is_enabled, last_used_date = last_used_date, port = port, server = server, _id = _id }