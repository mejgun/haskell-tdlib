-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetNetworkType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkType as NetworkType

-- |
-- 
-- Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks, so it should be called whenever the network is changed, even if the network type remains the same.
-- 
-- -Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics 
-- 
-- __type__ The new network type. By default, networkTypeOther
data SetNetworkType = 

 SetNetworkType { _type :: Maybe NetworkType.NetworkType }  deriving (Show, Eq)

instance T.ToJSON SetNetworkType where
 toJSON (SetNetworkType { _type = _type }) =
  A.object [ "@type" A..= T.String "setNetworkType", "type" A..= _type ]

instance T.FromJSON SetNetworkType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setNetworkType" -> parseSetNetworkType v
   _ -> mempty
  where
   parseSetNetworkType :: A.Value -> T.Parser SetNetworkType
   parseSetNetworkType = A.withObject "SetNetworkType" $ \o -> do
    _type <- o A..:? "type"
    return $ SetNetworkType { _type = _type }