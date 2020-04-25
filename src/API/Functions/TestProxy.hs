-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

data TestProxy = 
 TestProxy { timeout :: Maybe Float, dc_id :: Maybe Int, _type :: Maybe ProxyType.ProxyType, port :: Maybe Int, server :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON TestProxy where
 toJSON (TestProxy { timeout = timeout, dc_id = dc_id, _type = _type, port = port, server = server }) =
  A.object [ "@type" A..= T.String "testProxy", "timeout" A..= timeout, "dc_id" A..= dc_id, "type" A..= _type, "port" A..= port, "server" A..= server ]

instance T.FromJSON TestProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testProxy" -> parseTestProxy v
   _ -> mempty
  where
   parseTestProxy :: A.Value -> T.Parser TestProxy
   parseTestProxy = A.withObject "TestProxy" $ \o -> do
    timeout <- o A..:? "timeout"
    dc_id <- mconcat [ o A..:? "dc_id", readMaybe <$> (o A..: "dc_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _type <- o A..:? "type"
    port <- mconcat [ o A..:? "port", readMaybe <$> (o A..: "port" :: T.Parser String)] :: T.Parser (Maybe Int)
    server <- o A..:? "server"
    return $ TestProxy { timeout = timeout, dc_id = dc_id, _type = _type, port = port, server = server }