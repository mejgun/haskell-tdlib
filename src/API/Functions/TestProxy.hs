-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

--main = putStrLn "ok"

data TestProxy = 
 TestProxy { timeout :: Float, dc_id :: Int, _type :: ProxyType.ProxyType, port :: Int, server :: String }  deriving (Show)

instance T.ToJSON TestProxy where
 toJSON (TestProxy { timeout = timeout, dc_id = dc_id, _type = _type, port = port, server = server }) =
  A.object [ "@type" A..= T.String "testProxy", "timeout" A..= timeout, "dc_id" A..= dc_id, "type" A..= _type, "port" A..= port, "server" A..= server ]



instance T.FromJSON TestProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testProxy" -> parseTestProxy v

   _ -> mempty ""
  where
   parseTestProxy :: A.Value -> T.Parser TestProxy
   parseTestProxy = A.withObject "TestProxy" $ \o -> do
    timeout <- o A..: "timeout"
    dc_id <- o A..: "dc_id"
    _type <- o A..: "type"
    port <- o A..: "port"
    server <- o A..: "server"
    return $ TestProxy { timeout = timeout, dc_id = dc_id, _type = _type, port = port, server = server }