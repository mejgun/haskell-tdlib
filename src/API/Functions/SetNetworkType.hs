-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetNetworkType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkType as NetworkType

--main = putStrLn "ok"

data SetNetworkType = 
 SetNetworkType { _type :: NetworkType.NetworkType }  -- deriving (Show)

instance T.ToJSON SetNetworkType where
 toJSON (SetNetworkType { _type = _type }) =
  A.object [ "@type" A..= T.String "setNetworkType", "type" A..= _type ]
-- setNetworkType SetNetworkType  { _type :: NetworkType.NetworkType } 



instance T.FromJSON SetNetworkType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setNetworkType" -> parseSetNetworkType v
  where
   parseSetNetworkType :: A.Value -> T.Parser SetNetworkType
   parseSetNetworkType = A.withObject "SetNetworkType" $ \o -> do
    _type <- o A..: "type"
    return $ SetNetworkType { _type = _type }