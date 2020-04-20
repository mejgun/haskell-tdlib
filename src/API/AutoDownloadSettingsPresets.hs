-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AutoDownloadSettingsPresets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AutoDownloadSettings as AutoDownloadSettings

--main = putStrLn "ok"

data AutoDownloadSettingsPresets = 
 AutoDownloadSettingsPresets { high :: AutoDownloadSettings.AutoDownloadSettings, medium :: AutoDownloadSettings.AutoDownloadSettings, low :: AutoDownloadSettings.AutoDownloadSettings }  -- deriving (Show)

instance T.ToJSON AutoDownloadSettingsPresets where
 toJSON (AutoDownloadSettingsPresets { high = high, medium = medium, low = low }) =
  A.object [ "@type" A..= T.String "autoDownloadSettingsPresets", "high" A..= high, "medium" A..= medium, "low" A..= low ]
-- autoDownloadSettingsPresets AutoDownloadSettingsPresets  { high :: AutoDownloadSettings.AutoDownloadSettings, medium :: AutoDownloadSettings.AutoDownloadSettings, low :: AutoDownloadSettings.AutoDownloadSettings } 

