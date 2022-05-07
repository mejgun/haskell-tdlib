{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetAutoDownloadSettingsPresets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns auto-download settings presets for the current user
data GetAutoDownloadSettingsPresets = GetAutoDownloadSettingsPresets
  {
  }
  deriving (Eq)

instance Show GetAutoDownloadSettingsPresets where
  show GetAutoDownloadSettingsPresets =
    "GetAutoDownloadSettingsPresets"
      ++ U.cc
        []

instance T.ToJSON GetAutoDownloadSettingsPresets where
  toJSON GetAutoDownloadSettingsPresets =
    A.object
      [ "@type" A..= T.String "getAutoDownloadSettingsPresets"
      ]
