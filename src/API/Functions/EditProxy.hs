-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditProxy where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

data EditProxy = 
 EditProxy { _type :: Maybe ProxyType.ProxyType, enable :: Maybe Bool, port :: Maybe Int, server :: Maybe String, proxy_id :: Maybe Int }  deriving (Show)

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
    _type <- optional $ o A..: "type"
    enable <- optional $ o A..: "enable"
    port <- optional $ o A..: "port"
    server <- optional $ o A..: "server"
    proxy_id <- optional $ o A..: "proxy_id"
    return $ EditProxy { _type = _type, enable = enable, port = port, server = server, proxy_id = proxy_id }