-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetNetworkType where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkType as NetworkType

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
    _type <- optional $ o A..: "type"
    return $ SetNetworkType { _type = _type }