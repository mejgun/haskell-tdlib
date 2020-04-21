-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Sticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.MaskPosition as MaskPosition

data Sticker = 
 Sticker { sticker :: File.File, thumbnail :: PhotoSize.PhotoSize, mask_position :: MaskPosition.MaskPosition, is_mask :: Bool, is_animated :: Bool, emoji :: String, height :: Int, width :: Int, set_id :: Int }  deriving (Show)

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
    sticker <- o A..: "sticker"
    thumbnail <- o A..: "thumbnail"
    mask_position <- o A..: "mask_position"
    is_mask <- o A..: "is_mask"
    is_animated <- o A..: "is_animated"
    emoji <- o A..: "emoji"
    height <- o A..: "height"
    width <- o A..: "width"
    set_id <- o A..: "set_id"
    return $ Sticker { sticker = sticker, thumbnail = thumbnail, mask_position = mask_position, is_mask = is_mask, is_animated = is_animated, emoji = emoji, height = height, width = width, set_id = set_id }