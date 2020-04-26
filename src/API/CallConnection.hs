-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallConnection where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes the address of UDP reflectors 
-- 
-- __id__ Reflector identifier
-- 
-- __ip__ IPv4 reflector address
-- 
-- __ipv6__ IPv6 reflector address
-- 
-- __port__ Reflector port number
-- 
-- __peer_tag__ Connection peer tag
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
    peer_tag <- o A..:? "peer_tag"
    port <- mconcat [ o A..:? "port", readMaybe <$> (o A..: "port" :: T.Parser String)] :: T.Parser (Maybe Int)
    ipv6 <- o A..:? "ipv6"
    ip <- o A..:? "ip"
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CallConnection { peer_tag = peer_tag, port = port, ipv6 = ipv6, ip = ip, _id = _id }