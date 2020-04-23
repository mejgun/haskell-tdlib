-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AutoDownloadSettingsPresets where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AutoDownloadSettings as AutoDownloadSettings

data AutoDownloadSettingsPresets = 
 AutoDownloadSettingsPresets { high :: Maybe AutoDownloadSettings.AutoDownloadSettings, medium :: Maybe AutoDownloadSettings.AutoDownloadSettings, low :: Maybe AutoDownloadSettings.AutoDownloadSettings }  deriving (Show)

instance T.ToJSON AutoDownloadSettingsPresets where
 toJSON (AutoDownloadSettingsPresets { high = high, medium = medium, low = low }) =
  A.object [ "@type" A..= T.String "autoDownloadSettingsPresets", "high" A..= high, "medium" A..= medium, "low" A..= low ]

instance T.FromJSON AutoDownloadSettingsPresets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "autoDownloadSettingsPresets" -> parseAutoDownloadSettingsPresets v
   _ -> mempty
  where
   parseAutoDownloadSettingsPresets :: A.Value -> T.Parser AutoDownloadSettingsPresets
   parseAutoDownloadSettingsPresets = A.withObject "AutoDownloadSettingsPresets" $ \o -> do
    high <- optional $ o A..: "high"
    medium <- optional $ o A..: "medium"
    low <- optional $ o A..: "low"
    return $ AutoDownloadSettingsPresets { high = high, medium = medium, low = low }