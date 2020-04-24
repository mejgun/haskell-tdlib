-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Sticker where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.MaskPosition as MaskPosition

data Sticker = 
 Sticker { sticker :: Maybe File.File, thumbnail :: Maybe PhotoSize.PhotoSize, mask_position :: Maybe MaskPosition.MaskPosition, is_mask :: Maybe Bool, is_animated :: Maybe Bool, emoji :: Maybe String, height :: Maybe Int, width :: Maybe Int, set_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Sticker where
 toJSON (Sticker { sticker = sticker, thumbnail = thumbnail, mask_position = mask_position, is_mask = is_mask, is_animated = is_animated, emoji = emoji, height = height, width = width, set_id = set_id }) =
  A.object [ "@type" A..= T.String "sticker", "sticker" A..= sticker, "thumbnail" A..= thumbnail, "mask_position" A..= mask_position, "is_mask" A..= is_mask, "is_animated" A..= is_animated, "emoji" A..= emoji, "height" A..= height, "width" A..= width, "set_id" A..= set_id ]

instance T.FromJSON Sticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sticker" -> parseSticker v
   _ -> mempty
  where
   parseSticker :: A.Value -> T.Parser Sticker
   parseSticker = A.withObject "Sticker" $ \o -> do
    sticker <- optional $ o A..: "sticker"
    thumbnail <- optional $ o A..: "thumbnail"
    mask_position <- optional $ o A..: "mask_position"
    is_mask <- optional $ o A..: "is_mask"
    is_animated <- optional $ o A..: "is_animated"
    emoji <- optional $ o A..: "emoji"
    height <- optional $ o A..: "height"
    width <- optional $ o A..: "width"
    set_id <- optional $ o A..: "set_id"
    return $ Sticker { sticker = sticker, thumbnail = thumbnail, mask_position = mask_position, is_mask = is_mask, is_animated = is_animated, emoji = emoji, height = height, width = width, set_id = set_id }