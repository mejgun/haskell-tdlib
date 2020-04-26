-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetNetworkStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns network data usage statistics. Can be called before authorization 
-- 
-- __only_current__ If true, returns only data for the current library launch
data GetNetworkStatistics = 
 GetNetworkStatistics { only_current :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON GetNetworkStatistics where
 toJSON (GetNetworkStatistics { only_current = only_current }) =
  A.object [ "@type" A..= T.String "getNetworkStatistics", "only_current" A..= only_current ]

instance T.FromJSON GetNetworkStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getNetworkStatistics" -> parseGetNetworkStatistics v
   _ -> mempty
  where
   parseGetNetworkStatistics :: A.Value -> T.Parser GetNetworkStatistics
   parseGetNetworkStatistics = A.withObject "GetNetworkStatistics" $ \o -> do
    only_current <- o A..:? "only_current"
    return $ GetNetworkStatistics { only_current = only_current }