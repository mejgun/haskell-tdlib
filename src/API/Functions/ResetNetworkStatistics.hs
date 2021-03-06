-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetNetworkStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Resets all network data usage statistics to zero. Can be called before authorization
data ResetNetworkStatistics = 

 ResetNetworkStatistics deriving (Show, Eq)

instance T.ToJSON ResetNetworkStatistics where
 toJSON (ResetNetworkStatistics {  }) =
  A.object [ "@type" A..= T.String "resetNetworkStatistics" ]

instance T.FromJSON ResetNetworkStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resetNetworkStatistics" -> parseResetNetworkStatistics v
   _ -> mempty
  where
   parseResetNetworkStatistics :: A.Value -> T.Parser ResetNetworkStatistics
   parseResetNetworkStatistics = A.withObject "ResetNetworkStatistics" $ \o -> do
    return $ ResetNetworkStatistics {  }