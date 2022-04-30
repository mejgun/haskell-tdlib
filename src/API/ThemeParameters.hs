-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ThemeParameters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains parameters of the app theme 
-- 
-- __background_color__ A color of the background in the RGB24 format
-- 
-- __text_color__ A color of text in the RGB24 format
-- 
-- __hint_color__ A color of hints in the RGB24 format
-- 
-- __link_color__ A color of links in the RGB24 format
-- 
-- __button_color__ A color of the buttons in the RGB24 format
-- 
-- __button_text_color__ A color of text on the buttons in the RGB24 format
data ThemeParameters = 

 ThemeParameters { button_text_color :: Maybe Int, button_color :: Maybe Int, link_color :: Maybe Int, hint_color :: Maybe Int, text_color :: Maybe Int, background_color :: Maybe Int }  deriving (Eq)

instance Show ThemeParameters where
 show ThemeParameters { button_text_color=button_text_color, button_color=button_color, link_color=link_color, hint_color=hint_color, text_color=text_color, background_color=background_color } =
  "ThemeParameters" ++ U.cc [U.p "button_text_color" button_text_color, U.p "button_color" button_color, U.p "link_color" link_color, U.p "hint_color" hint_color, U.p "text_color" text_color, U.p "background_color" background_color ]

instance T.ToJSON ThemeParameters where
 toJSON ThemeParameters { button_text_color = button_text_color, button_color = button_color, link_color = link_color, hint_color = hint_color, text_color = text_color, background_color = background_color } =
  A.object [ "@type" A..= T.String "themeParameters", "button_text_color" A..= button_text_color, "button_color" A..= button_color, "link_color" A..= link_color, "hint_color" A..= hint_color, "text_color" A..= text_color, "background_color" A..= background_color ]

instance T.FromJSON ThemeParameters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "themeParameters" -> parseThemeParameters v
   _ -> mempty
  where
   parseThemeParameters :: A.Value -> T.Parser ThemeParameters
   parseThemeParameters = A.withObject "ThemeParameters" $ \o -> do
    button_text_color <- mconcat [ o A..:? "button_text_color", readMaybe <$> (o A..: "button_text_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    button_color <- mconcat [ o A..:? "button_color", readMaybe <$> (o A..: "button_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    link_color <- mconcat [ o A..:? "link_color", readMaybe <$> (o A..: "link_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    hint_color <- mconcat [ o A..:? "hint_color", readMaybe <$> (o A..: "hint_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    text_color <- mconcat [ o A..:? "text_color", readMaybe <$> (o A..: "text_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    background_color <- mconcat [ o A..:? "background_color", readMaybe <$> (o A..: "background_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ThemeParameters { button_text_color = button_text_color, button_color = button_color, link_color = link_color, hint_color = hint_color, text_color = text_color, background_color = background_color }
 parseJSON _ = mempty
