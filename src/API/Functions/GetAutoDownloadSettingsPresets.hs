-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAutoDownloadSettingsPresets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns auto-download settings presets for the current user
data GetAutoDownloadSettingsPresets = 

 GetAutoDownloadSettingsPresets deriving (Eq)

instance Show GetAutoDownloadSettingsPresets where
 show GetAutoDownloadSettingsPresets {  } =
  "GetAutoDownloadSettingsPresets" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


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
