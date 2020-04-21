-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallProtocol where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CallProtocol = 
 CallProtocol { library_versions :: [String], max_layer :: Int, min_layer :: Int, udp_reflector :: Bool, udp_p2p :: Bool }  deriving (Show)

instance T.ToJSON CallProtocol where
 toJSON (CallProtocol { library_versions = library_versions, max_layer = max_layer, min_layer = min_layer, udp_reflector = udp_reflector, udp_p2p = udp_p2p }) =
  A.object [ "@type" A..= T.String "callProtocol", "library_versions" A..= library_versions, "max_layer" A..= max_layer, "min_layer" A..= min_layer, "udp_reflector" A..= udp_reflector, "udp_p2p" A..= udp_p2p ]



instance T.FromJSON CallProtocol where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callProtocol" -> parseCallProtocol v

   _ -> mempty ""
  where
   parseCallProtocol :: A.Value -> T.Parser CallProtocol
   parseCallProtocol = A.withObject "CallProtocol" $ \o -> do
    library_versions <- o A..: "library_versions"
    max_layer <- o A..: "max_layer"
    min_layer <- o A..: "min_layer"
    udp_reflector <- o A..: "udp_reflector"
    udp_p2p <- o A..: "udp_p2p"
    return $ CallProtocol { library_versions = library_versions, max_layer = max_layer, min_layer = min_layer, udp_reflector = udp_reflector, udp_p2p = udp_p2p }