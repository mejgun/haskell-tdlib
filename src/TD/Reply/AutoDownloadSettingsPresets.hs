{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.AutoDownloadSettingsPresets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.AutoDownloadSettings as AutoDownloadSettings
import qualified Utils as U

data AutoDownloadSettingsPresets = -- | Contains auto-download settings presets for the current user
  AutoDownloadSettingsPresets
  { -- | Preset with highest settings; supposed to be used by default when connected on Wi-Fi
    high :: Maybe AutoDownloadSettings.AutoDownloadSettings,
    -- | Preset with medium settings; supposed to be used by default when using mobile data
    medium :: Maybe AutoDownloadSettings.AutoDownloadSettings,
    -- | Preset with lowest settings; supposed to be used by default when roaming
    low :: Maybe AutoDownloadSettings.AutoDownloadSettings
  }
  deriving (Eq)

instance Show AutoDownloadSettingsPresets where
  show
    AutoDownloadSettingsPresets
      { high = high,
        medium = medium,
        low = low
      } =
      "AutoDownloadSettingsPresets"
        ++ U.cc
          [ U.p "high" high,
            U.p "medium" medium,
            U.p "low" low
          ]

instance T.FromJSON AutoDownloadSettingsPresets where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "autoDownloadSettingsPresets" -> parseAutoDownloadSettingsPresets v
      _ -> fail ""
    where
      parseAutoDownloadSettingsPresets :: A.Value -> T.Parser AutoDownloadSettingsPresets
      parseAutoDownloadSettingsPresets = A.withObject "AutoDownloadSettingsPresets" $ \o -> do
        high_ <- o A..:? "high"
        medium_ <- o A..:? "medium"
        low_ <- o A..:? "low"
        return $ AutoDownloadSettingsPresets {high = high_, medium = medium_, low = low_}
  parseJSON _ = fail ""

instance T.ToJSON AutoDownloadSettingsPresets where
  toJSON
    AutoDownloadSettingsPresets
      { high = high,
        medium = medium,
        low = low
      } =
      A.object
        [ "@type" A..= T.String "autoDownloadSettingsPresets",
          "high" A..= high,
          "medium" A..= medium,
          "low" A..= low
        ]
