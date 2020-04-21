-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetNetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetNetworkStatistics = 
 GetNetworkStatistics { only_current :: Bool }  deriving (Show)

instance T.ToJSON GetNetworkStatistics where
 toJSON (GetNetworkStatistics { only_current = only_current }) =
  A.object [ "@type" A..= T.String "getNetworkStatistics", "only_current" A..= only_current ]



instance T.FromJSON GetNetworkStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getNetworkStatistics" -> parseGetNetworkStatistics v

   _ -> mempty ""
  where
   parseGetNetworkStatistics :: A.Value -> T.Parser GetNetworkStatistics
   parseGetNetworkStatistics = A.withObject "GetNetworkStatistics" $ \o -> do
    only_current <- o A..: "only_current"
    return $ GetNetworkStatistics { only_current = only_current }