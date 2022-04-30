-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAutoDownloadSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.NetworkType as NetworkType
import {-# SOURCE #-} qualified API.AutoDownloadSettings as AutoDownloadSettings

-- |
-- 
-- Sets auto-download settings 
-- 
-- __settings__ New user auto-download settings
-- 
-- __type__ Type of the network for which the new settings are relevant
data SetAutoDownloadSettings = 

 SetAutoDownloadSettings { _type :: Maybe NetworkType.NetworkType, settings :: Maybe AutoDownloadSettings.AutoDownloadSettings }  deriving (Eq)

instance Show SetAutoDownloadSettings where
 show SetAutoDownloadSettings { _type=_type, settings=settings } =
  "SetAutoDownloadSettings" ++ U.cc [U.p "_type" _type, U.p "settings" settings ]

instance T.ToJSON SetAutoDownloadSettings where
 toJSON SetAutoDownloadSettings { _type = _type, settings = settings } =
  A.object [ "@type" A..= T.String "setAutoDownloadSettings", "type" A..= _type, "settings" A..= settings ]

instance T.FromJSON SetAutoDownloadSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setAutoDownloadSettings" -> parseSetAutoDownloadSettings v
   _ -> mempty
  where
   parseSetAutoDownloadSettings :: A.Value -> T.Parser SetAutoDownloadSettings
   parseSetAutoDownloadSettings = A.withObject "SetAutoDownloadSettings" $ \o -> do
    _type <- o A..:? "type"
    settings <- o A..:? "settings"
    return $ SetAutoDownloadSettings { _type = _type, settings = settings }
 parseJSON _ = mempty
