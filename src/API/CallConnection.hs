-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallConnection where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CallConnection = 
 CallConnection { peer_tag :: Maybe String, port :: Maybe Int, ipv6 :: Maybe String, ip :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CallConnection where
 toJSON (CallConnection { peer_tag = peer_tag, port = port, ipv6 = ipv6, ip = ip, _id = _id }) =
  A.object [ "@type" A..= T.String "callConnection", "peer_tag" A..= peer_tag, "port" A..= port, "ipv6" A..= ipv6, "ip" A..= ip, "id" A..= _id ]

instance T.FromJSON CallConnection where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callConnection" -> parseCallConnection v
   _ -> mempty
  where
   parseCallConnection :: A.Value -> T.Parser CallConnection
   parseCallConnection = A.withObject "CallConnection" $ \o -> do
    peer_tag <- optional $ o A..: "peer_tag"
    port <- optional $ o A..: "port"
    ipv6 <- optional $ o A..: "ipv6"
    ip <- optional $ o A..: "ip"
    _id <- optional $ o A..: "id"
    return $ CallConnection { peer_tag = peer_tag, port = port, ipv6 = ipv6, ip = ip, _id = _id }