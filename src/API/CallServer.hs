-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallServer where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.CallServerType as CallServerType

-- |
-- 
-- Describes a server for relaying call data 
-- 
-- __id__ Server identifier
-- 
-- __ip_address__ Server IPv4 address
-- 
-- __ipv6_address__ Server IPv6 address
-- 
-- __port__ Server port number
-- 
-- __type__ Server type
data CallServer = 

 CallServer { _type :: Maybe CallServerType.CallServerType, port :: Maybe Int, ipv6_address :: Maybe String, ip_address :: Maybe String, _id :: Maybe Int }  deriving (Eq)

instance Show CallServer where
 show CallServer { _type=_type, port=port, ipv6_address=ipv6_address, ip_address=ip_address, _id=_id } =
  "CallServer" ++ cc [p "_type" _type, p "port" port, p "ipv6_address" ipv6_address, p "ip_address" ip_address, p "_id" _id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CallServer where
 toJSON CallServer { _type = _type, port = port, ipv6_address = ipv6_address, ip_address = ip_address, _id = _id } =
  A.object [ "@type" A..= T.String "callServer", "type" A..= _type, "port" A..= port, "ipv6_address" A..= ipv6_address, "ip_address" A..= ip_address, "id" A..= _id ]

instance T.FromJSON CallServer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callServer" -> parseCallServer v
   _ -> mempty
  where
   parseCallServer :: A.Value -> T.Parser CallServer
   parseCallServer = A.withObject "CallServer" $ \o -> do
    _type <- o A..:? "type"
    port <- mconcat [ o A..:? "port", readMaybe <$> (o A..: "port" :: T.Parser String)] :: T.Parser (Maybe Int)
    ipv6_address <- o A..:? "ipv6_address"
    ip_address <- o A..:? "ip_address"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CallServer { _type = _type, port = port, ipv6_address = ipv6_address, ip_address = ip_address, _id = _id }
 parseJSON _ = mempty
