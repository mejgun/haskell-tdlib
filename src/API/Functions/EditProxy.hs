-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

-- |
-- 
-- Edits an existing proxy server for network requests. Can be called before authorization 
-- 
-- __proxy_id__ Proxy identifier
-- 
-- __server__ Proxy server IP address
-- 
-- __port__ Proxy server port
-- 
-- __enable__ True, if the proxy should be enabled
-- 
-- __type__ Proxy type
data EditProxy = 

 EditProxy { _type :: Maybe ProxyType.ProxyType, enable :: Maybe Bool, port :: Maybe Int, server :: Maybe String, proxy_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON EditProxy where
 toJSON (EditProxy { _type = _type, enable = enable, port = port, server = server, proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "editProxy", "type" A..= _type, "enable" A..= enable, "port" A..= port, "server" A..= server, "proxy_id" A..= proxy_id ]

instance T.FromJSON EditProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editProxy" -> parseEditProxy v
   _ -> mempty
  where
   parseEditProxy :: A.Value -> T.Parser EditProxy
   parseEditProxy = A.withObject "EditProxy" $ \o -> do
    _type <- o A..:? "type"
    enable <- o A..:? "enable"
    port <- mconcat [ o A..:? "port", readMaybe <$> (o A..: "port" :: T.Parser String)] :: T.Parser (Maybe Int)
    server <- o A..:? "server"
    proxy_id <- mconcat [ o A..:? "proxy_id", readMaybe <$> (o A..: "proxy_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EditProxy { _type = _type, enable = enable, port = port, server = server, proxy_id = proxy_id }