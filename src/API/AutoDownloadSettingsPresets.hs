-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AutoDownloadSettingsPresets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.AutoDownloadSettings as AutoDownloadSettings

-- |
-- 
-- Contains auto-download settings presets for the current user
-- 
-- __low__ Preset with lowest settings; supposed to be used by default when roaming
-- 
-- __medium__ Preset with medium settings; supposed to be used by default when using mobile data
-- 
-- __high__ Preset with highest settings; supposed to be used by default when connected on Wi-Fi
data AutoDownloadSettingsPresets = 

 AutoDownloadSettingsPresets { high :: Maybe AutoDownloadSettings.AutoDownloadSettings, medium :: Maybe AutoDownloadSettings.AutoDownloadSettings, low :: Maybe AutoDownloadSettings.AutoDownloadSettings }  deriving (Eq)

instance Show AutoDownloadSettingsPresets where
 show AutoDownloadSettingsPresets { high=high, medium=medium, low=low } =
  "AutoDownloadSettingsPresets" ++ cc [p "high" high, p "medium" medium, p "low" low ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AutoDownloadSettingsPresets where
 toJSON AutoDownloadSettingsPresets { high = high, medium = medium, low = low } =
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
    high <- o A..:? "high"
    medium <- o A..:? "medium"
    low <- o A..:? "low"
    return $ AutoDownloadSettingsPresets { high = high, medium = medium, low = low }
 parseJSON _ = mempty
