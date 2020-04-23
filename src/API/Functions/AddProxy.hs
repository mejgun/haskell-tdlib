-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddProxy where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

data AddProxy = 
 AddProxy { _type :: Maybe ProxyType.ProxyType, enable :: Maybe Bool, port :: Maybe Int, server :: Maybe String }  deriving (Show)

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
    _type <- optional $ o A..: "type"
    enable <- optional $ o A..: "enable"
    port <- optional $ o A..: "port"
    server <- optional $ o A..: "server"
    return $ AddProxy { _type = _type, enable = enable, port = port, server = server }