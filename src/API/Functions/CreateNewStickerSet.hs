-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewStickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
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
-- __is_masks__ True, if stickers are masks. Animated stickers can't be masks
-- 
-- __stickers__ List of stickers to be added to the set; must be non-empty. All stickers must be of the same type. For animated stickers, uploadStickerFile must be used before the sticker is shown
-- 
-- __source__ Source of the sticker set; may be empty if unknown
data CreateNewStickerSet = 

 CreateNewStickerSet { source :: Maybe String, stickers :: Maybe [InputSticker.InputSticker], is_masks :: Maybe Bool, name :: Maybe String, title :: Maybe String, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CreateNewStickerSet where
 toJSON (CreateNewStickerSet { source = source, stickers = stickers, is_masks = is_masks, name = name, title = title, user_id = user_id }) =
  A.object [ "@type" A..= T.String "createNewStickerSet", "source" A..= source, "stickers" A..= stickers, "is_masks" A..= is_masks, "name" A..= name, "title" A..= title, "user_id" A..= user_id ]

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
    is_masks <- o A..:? "is_masks"
    name <- o A..:? "name"
    title <- o A..:? "title"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateNewStickerSet { source = source, stickers = stickers, is_masks = is_masks, name = name, title = title, user_id = user_id }