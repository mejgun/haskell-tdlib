-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallConnection where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CallConnection = 
 CallConnection { peer_tag :: String, port :: Int, ipv6 :: String, ip :: String, _id :: Int }  deriving (Show)

instance T.ToJSON CallConnection where
 toJSON (CallConnection { peer_tag = peer_tag, port = port, ipv6 = ipv6, ip = ip, _id = _id }) =
  A.object [ "@type" A..= T.String "callConnection", "peer_tag" A..= peer_tag, "port" A..= port, "ipv6" A..= ipv6, "ip" A..= ip, "id" A..= _id ]



instance T.FromJSON CallConnection where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callConnection" -> parseCallConnection v

   _ -> mempty ""
  where
   parseCallConnection :: A.Value -> T.Parser CallConnection
   parseCallConnection = A.withObject "CallConnection" $ \o -> do
    peer_tag <- o A..: "peer_tag"
    port <- o A..: "port"
    ipv6 <- o A..: "ipv6"
    ip <- o A..: "ip"
    _id <- o A..: "id"
    return $ CallConnection { peer_tag = peer_tag, port = port, ipv6 = ipv6, ip = ip, _id = _id }