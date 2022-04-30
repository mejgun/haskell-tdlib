-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAutoDownloadSettingsPresets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns auto-download settings presets for the current user
data GetAutoDownloadSettingsPresets = 

 GetAutoDownloadSettingsPresets deriving (Eq)

instance Show GetAutoDownloadSettingsPresets where
 show GetAutoDownloadSettingsPresets {  } =
  "GetAutoDownloadSettingsPresets" ++ U.cc [ ]

instance T.ToJSON GetAutoDownloadSettingsPresets where
 toJSON GetAutoDownloadSettingsPresets {  } =
  A.object [ "@type" A..= T.String "getAutoDownloadSettingsPresets" ]

instance T.FromJSON GetAutoDownloadSettingsPresets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAutoDownloadSettingsPresets" -> parseGetAutoDownloadSettingsPresets v
   _ -> mempty
  where
   parseGetAutoDownloadSettingsPresets :: A.Value -> T.Parser GetAutoDownloadSettingsPresets
   parseGetAutoDownloadSettingsPresets = A.withObject "GetAutoDownloadSettingsPresets" $ \o -> do
    return $ GetAutoDownloadSettingsPresets {  }
 parseJSON _ = mempty
