-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatTheme where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ThemeSettings as ThemeSettings

-- |
-- 
-- Describes a chat theme
-- 
-- __name__ Theme name
-- 
-- __light_settings__ Theme settings for a light chat theme
-- 
-- __dark_settings__ Theme settings for a dark chat theme
data ChatTheme = 

 ChatTheme { dark_settings :: Maybe ThemeSettings.ThemeSettings, light_settings :: Maybe ThemeSettings.ThemeSettings, name :: Maybe String }  deriving (Eq)

instance Show ChatTheme where
 show ChatTheme { dark_settings=dark_settings, light_settings=light_settings, name=name } =
  "ChatTheme" ++ U.cc [U.p "dark_settings" dark_settings, U.p "light_settings" light_settings, U.p "name" name ]

instance T.ToJSON ChatTheme where
 toJSON ChatTheme { dark_settings = dark_settings, light_settings = light_settings, name = name } =
  A.object [ "@type" A..= T.String "chatTheme", "dark_settings" A..= dark_settings, "light_settings" A..= light_settings, "name" A..= name ]

instance T.FromJSON ChatTheme where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatTheme" -> parseChatTheme v
   _ -> mempty
  where
   parseChatTheme :: A.Value -> T.Parser ChatTheme
   parseChatTheme = A.withObject "ChatTheme" $ \o -> do
    dark_settings <- o A..:? "dark_settings"
    light_settings <- o A..:? "light_settings"
    name <- o A..:? "name"
    return $ ChatTheme { dark_settings = dark_settings, light_settings = light_settings, name = name }
 parseJSON _ = mempty
