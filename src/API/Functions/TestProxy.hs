-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

-- |
-- 
-- Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization 
-- 
-- __server__ Proxy server IP address
-- 
-- __port__ Proxy server port
-- 
-- __type__ Proxy type
-- 
-- __dc_id__ Identifier of a datacenter, with which to test connection
-- 
-- __timeout__ The maximum overall timeout for the request
data TestProxy = 

 TestProxy { timeout :: Maybe Float, dc_id :: Maybe Int, _type :: Maybe ProxyType.ProxyType, port :: Maybe Int, server :: Maybe String }  deriving (Eq)

instance Show TestProxy where
 show TestProxy { timeout=timeout, dc_id=dc_id, _type=_type, port=port, server=server } =
  "TestProxy" ++ cc [p "timeout" timeout, p "dc_id" dc_id, p "_type" _type, p "port" port, p "server" server ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestProxy where
 toJSON TestProxy { timeout = timeout, dc_id = dc_id, _type = _type, port = port, server = server } =
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
 parseJSON _ = mempty
