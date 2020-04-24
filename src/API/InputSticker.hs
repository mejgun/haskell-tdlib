-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputSticker where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MaskPosition as MaskPosition
import {-# SOURCE #-} qualified API.InputFile as InputFile

data InputSticker = 
 InputStickerStatic { mask_position :: Maybe MaskPosition.MaskPosition, emojis :: Maybe String, sticker :: Maybe InputFile.InputFile }  
 | InputStickerAnimated { emojis :: Maybe String, sticker :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON InputSticker where
 toJSON (InputStickerStatic { mask_position = mask_position, emojis = emojis, sticker = sticker }) =
  A.object [ "@type" A..= T.String "inputStickerStatic", "mask_position" A..= mask_position, "emojis" A..= emojis, "sticker" A..= sticker ]

 toJSON (InputStickerAnimated { emojis = emojis, sticker = sticker }) =
  A.object [ "@type" A..= T.String "inputStickerAnimated", "emojis" A..= emojis, "sticker" A..= sticker ]

instance T.FromJSON InputSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputStickerStatic" -> parseInputStickerStatic v
   "inputStickerAnimated" -> parseInputStickerAnimated v
   _ -> mempty
  where
   parseInputStickerStatic :: A.Value -> T.Parser InputSticker
   parseInputStickerStatic = A.withObject "InputStickerStatic" $ \o -> do
    mask_position <- optional $ o A..: "mask_position"
    emojis <- optional $ o A..: "emojis"
    sticker <- optional $ o A..: "sticker"
    return $ InputStickerStatic { mask_position = mask_position, emojis = emojis, sticker = sticker }

   parseInputStickerAnimated :: A.Value -> T.Parser InputSticker
   parseInputStickerAnimated = A.withObject "InputStickerAnimated" $ \o -> do
    emojis <- optional $ o A..: "emojis"
    sticker <- optional $ o A..: "sticker"
    return $ InputStickerAnimated { emojis = emojis, sticker = sticker }