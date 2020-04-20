-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MaskPosition as MaskPosition
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data InputSticker = 
 InputStickerStatic { mask_position :: MaskPosition.MaskPosition, emojis :: String, sticker :: InputFile.InputFile }  
 | InputStickerAnimated { emojis :: String, sticker :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON InputSticker where
 toJSON (InputStickerStatic { mask_position = mask_position, emojis = emojis, sticker = sticker }) =
  A.object [ "@type" A..= T.String "inputStickerStatic", "mask_position" A..= mask_position, "emojis" A..= emojis, "sticker" A..= sticker ]

 toJSON (InputStickerAnimated { emojis = emojis, sticker = sticker }) =
  A.object [ "@type" A..= T.String "inputStickerAnimated", "emojis" A..= emojis, "sticker" A..= sticker ]
-- inputStickerStatic InputSticker  { mask_position :: MaskPosition.MaskPosition, emojis :: String, sticker :: InputFile.InputFile } 

-- inputStickerAnimated InputSticker  { emojis :: String, sticker :: InputFile.InputFile } 

