-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.PingProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data PingProxy = 
 PingProxy { proxy_id :: Int }  deriving (Show)

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
    proxy_id <- o A..: "proxy_id"
    return $ PingProxy { proxy_id = proxy_id }