-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAutoDownloadSettingsPresets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetAutoDownloadSettingsPresets = 
 GetAutoDownloadSettingsPresets -- deriving (Show)

instance T.ToJSON GetAutoDownloadSettingsPresets where
 toJSON (GetAutoDownloadSettingsPresets {  }) =
  A.object [ "@type" A..= T.String "getAutoDownloadSettingsPresets" ]
-- getAutoDownloadSettingsPresets GetAutoDownloadSettingsPresets 

