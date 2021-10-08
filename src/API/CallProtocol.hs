-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallProtocol where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Specifies the supported call protocols
-- 
-- __udp_p2p__ True, if UDP peer-to-peer connections are supported
-- 
-- __udp_reflector__ True, if connection through UDP reflectors is supported
-- 
-- __min_layer__ The minimum supported API layer; use 65
-- 
-- __max_layer__ The maximum supported API layer; use 65
-- 
-- __library_versions__ List of supported tgcalls versions
data CallProtocol = 

 CallProtocol { library_versions :: Maybe [String], max_layer :: Maybe Int, min_layer :: Maybe Int, udp_reflector :: Maybe Bool, udp_p2p :: Maybe Bool }  deriving (Eq)

instance Show CallProtocol where
 show CallProtocol { library_versions=library_versions, max_layer=max_layer, min_layer=min_layer, udp_reflector=udp_reflector, udp_p2p=udp_p2p } =
  "CallProtocol" ++ cc [p "library_versions" library_versions, p "max_layer" max_layer, p "min_layer" min_layer, p "udp_reflector" udp_reflector, p "udp_p2p" udp_p2p ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CallProtocol where
 toJSON CallProtocol { library_versions = library_versions, max_layer = max_layer, min_layer = min_layer, udp_reflector = udp_reflector, udp_p2p = udp_p2p } =
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
    library_versions <- o A..:? "library_versions"
    max_layer <- mconcat [ o A..:? "max_layer", readMaybe <$> (o A..: "max_layer" :: T.Parser String)] :: T.Parser (Maybe Int)
    min_layer <- mconcat [ o A..:? "min_layer", readMaybe <$> (o A..: "min_layer" :: T.Parser String)] :: T.Parser (Maybe Int)
    udp_reflector <- o A..:? "udp_reflector"
    udp_p2p <- o A..:? "udp_p2p"
    return $ CallProtocol { library_versions = library_versions, max_layer = max_layer, min_layer = min_layer, udp_reflector = udp_reflector, udp_p2p = udp_p2p }
 parseJSON _ = mempty
