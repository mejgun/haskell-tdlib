-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.PingProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization 
-- 
-- __proxy_id__ Proxy identifier. Use 0 to ping a Telegram server without a proxy
data PingProxy = 

 PingProxy { proxy_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON PingProxy where
 toJSON (PingProxy { proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "pingProxy", "proxy_id" A..= proxy_id ]

instance T.FromJSON PingProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pingProxy" -> parsePingProxy v
   _ -> mempty
  where
   parsePingProxy :: A.Value -> T.Parser PingProxy
   parsePingProxy = A.withObject "PingProxy" $ \o -> do
    proxy_id <- mconcat [ o A..:? "proxy_id", readMaybe <$> (o A..: "proxy_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PingProxy { proxy_id = proxy_id }