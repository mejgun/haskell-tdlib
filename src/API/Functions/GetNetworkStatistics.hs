-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetNetworkStatistics where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetNetworkStatistics = 
 GetNetworkStatistics { only_current :: Maybe Bool }  deriving (Show)

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
    only_current <- optional $ o A..: "only_current"
    return $ GetNetworkStatistics { only_current = only_current }