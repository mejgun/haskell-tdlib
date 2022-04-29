-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AttachmentMenuBotColor where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes a color to highlight a bot added to attachment menu 
-- 
-- __light_color__ Color in the RGB24 format for light themes
-- 
-- __dark_color__ Color in the RGB24 format for dark themes
data AttachmentMenuBotColor = 

 AttachmentMenuBotColor { dark_color :: Maybe Int, light_color :: Maybe Int }  deriving (Eq)

instance Show AttachmentMenuBotColor where
 show AttachmentMenuBotColor { dark_color=dark_color, light_color=light_color } =
  "AttachmentMenuBotColor" ++ cc [p "dark_color" dark_color, p "light_color" light_color ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AttachmentMenuBotColor where
 toJSON AttachmentMenuBotColor { dark_color = dark_color, light_color = light_color } =
  A.object [ "@type" A..= T.String "attachmentMenuBotColor", "dark_color" A..= dark_color, "light_color" A..= light_color ]

instance T.FromJSON AttachmentMenuBotColor where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "attachmentMenuBotColor" -> parseAttachmentMenuBotColor v
   _ -> mempty
  where
   parseAttachmentMenuBotColor :: A.Value -> T.Parser AttachmentMenuBotColor
   parseAttachmentMenuBotColor = A.withObject "AttachmentMenuBotColor" $ \o -> do
    dark_color <- mconcat [ o A..:? "dark_color", readMaybe <$> (o A..: "dark_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    light_color <- mconcat [ o A..:? "light_color", readMaybe <$> (o A..: "light_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AttachmentMenuBotColor { dark_color = dark_color, light_color = light_color }
 parseJSON _ = mempty
