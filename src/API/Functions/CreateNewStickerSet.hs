-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewStickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputSticker as InputSticker

-- |
-- 
-- Creates a new sticker set. Returns the newly created sticker set
-- 
-- __user_id__ Sticker set owner; ignored for regular users
-- 
-- __title__ Sticker set title; 1-64 characters
-- 
-- __name__ Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive) for bots; 1-64 characters
-- 
-- __stickers__ List of stickers to be added to the set; must be non-empty. All stickers must have the same format. For TGS stickers, uploadStickerFile must be used before the sticker is shown
-- 
-- __source__ Source of the sticker set; may be empty if unknown
data CreateNewStickerSet = 

 CreateNewStickerSet { source :: Maybe String, stickers :: Maybe [InputSticker.InputSticker], name :: Maybe String, title :: Maybe String, user_id :: Maybe Int }  deriving (Eq)

instance Show CreateNewStickerSet where
 show CreateNewStickerSet { source=source, stickers=stickers, name=name, title=title, user_id=user_id } =
  "CreateNewStickerSet" ++ cc [p "source" source, p "stickers" stickers, p "name" name, p "title" title, p "user_id" user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CreateNewStickerSet where
 toJSON CreateNewStickerSet { source = source, stickers = stickers, name = name, title = title, user_id = user_id } =
  A.object [ "@type" A..= T.String "createNewStickerSet", "source" A..= source, "stickers" A..= stickers, "name" A..= name, "title" A..= title, "user_id" A..= user_id ]

instance T.FromJSON CreateNewStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewStickerSet" -> parseCreateNewStickerSet v
   _ -> mempty
  where
   parseCreateNewStickerSet :: A.Value -> T.Parser CreateNewStickerSet
   parseCreateNewStickerSet = A.withObject "CreateNewStickerSet" $ \o -> do
    source <- o A..:? "source"
    stickers <- o A..:? "stickers"
    name <- o A..:? "name"
    title <- o A..:? "title"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateNewStickerSet { source = source, stickers = stickers, name = name, title = title, user_id = user_id }
 parseJSON _ = mempty
