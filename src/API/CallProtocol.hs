-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallProtocol where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CallProtocol = 
 CallProtocol { library_versions :: Maybe [String], max_layer :: Maybe Int, min_layer :: Maybe Int, udp_reflector :: Maybe Bool, udp_p2p :: Maybe Bool }  deriving (Show)

instance T.ToJSON CallProtocol where
 toJSON (CallProtocol { library_versions = library_versions, max_layer = max_layer, min_layer = min_layer, udp_reflector = udp_reflector, udp_p2p = udp_p2p }) =
  A.object [ "@type" A..= T.String "callProtocol", "library_versions" A..= library_versions, "max_layer" A..= max_layer, "min_layer" A..= min_layer, "udp_reflector" A..= udp_reflector, "udp_p2p" A..= udp_p2p ]

instance T.FromJSON CallProtocol where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callProtocol" -> parseCallProtocol v
   _ -> mempty
  where
   parseCallProtocol :: A.Value -> T.Parser CallProtocol
   parseCallProtocol = A.withObject "CallProtocol" $ \o -> do
    library_versions <- optional $ o A..: "library_versions"
    max_layer <- optional $ o A..: "max_layer"
    min_layer <- optional $ o A..: "min_layer"
    udp_reflector <- optional $ o A..: "udp_reflector"
    udp_p2p <- optional $ o A..: "udp_p2p"
    return $ CallProtocol { library_versions = library_versions, max_layer = max_layer, min_layer = min_layer, udp_reflector = udp_reflector, udp_p2p = udp_p2p }