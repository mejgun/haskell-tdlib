-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

-- |
-- 
-- Adds a proxy server for network requests. Can be called before authorization 
-- 
-- __server__ Proxy server IP address
-- 
-- __port__ Proxy server port
-- 
-- __enable__ True, if the proxy should be enabled
-- 
-- __type__ Proxy type
data AddProxy = 

 AddProxy { _type :: Maybe ProxyType.ProxyType, enable :: Maybe Bool, port :: Maybe Int, server :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON AddProxy where
 toJSON (AddProxy { _type = _type, enable = enable, port = port, server = server }) =
  A.object [ "@type" A..= T.String "addProxy", "type" A..= _type, "enable" A..= enable, "port" A..= port, "server" A..= server ]

instance T.FromJSON AddProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addProxy" -> parseAddProxy v
   _ -> mempty
  where
   parseAddProxy :: A.Value -> T.Parser AddProxy
   parseAddProxy = A.withObject "AddProxy" $ \o -> do
    _type <- o A..:? "type"
    enable <- o A..:? "enable"
    port <- mconcat [ o A..:? "port", readMaybe <$> (o A..: "port" :: T.Parser String)] :: T.Parser (Maybe Int)
    server <- o A..:? "server"
    return $ AddProxy { _type = _type, enable = enable, port = port, server = server }