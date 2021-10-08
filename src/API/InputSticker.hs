-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputSticker where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MaskPosition as MaskPosition
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Describes a sticker that needs to be added to a sticker set
data InputSticker = 
 -- |
 -- 
 -- A static sticker in PNG format, which will be converted to WEBP server-side
 -- 
 -- __sticker__ PNG image with the sticker; must be up to 512 KB in size and fit in a 512x512 square
 -- 
 -- __emojis__ Emojis corresponding to the sticker
 -- 
 -- __mask_position__ For masks, position where the mask is placed; pass null if unspecified
 InputStickerStatic { mask_position :: Maybe MaskPosition.MaskPosition, emojis :: Maybe String, sticker :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- An animated sticker in TGS format
 -- 
 -- __sticker__ File with the animated sticker. Only local or uploaded within a week files are supported. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
 -- 
 -- __emojis__ Emojis corresponding to the sticker
 InputStickerAnimated { emojis :: Maybe String, sticker :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show InputSticker where
 show InputStickerStatic { mask_position=mask_position, emojis=emojis, sticker=sticker } =
  "InputStickerStatic" ++ cc [p "mask_position" mask_position, p "emojis" emojis, p "sticker" sticker ]

 show InputStickerAnimated { emojis=emojis, sticker=sticker } =
  "InputStickerAnimated" ++ cc [p "emojis" emojis, p "sticker" sticker ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InputSticker where
 toJSON InputStickerStatic { mask_position = mask_position, emojis = emojis, sticker = sticker } =
  A.object [ "@type" A..= T.String "inputStickerStatic", "mask_position" A..= mask_position, "emojis" A..= emojis, "sticker" A..= sticker ]

 toJSON InputStickerAnimated { emojis = emojis, sticker = sticker } =
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
    mask_position <- o A..:? "mask_position"
    emojis <- o A..:? "emojis"
    sticker <- o A..:? "sticker"
    return $ InputStickerStatic { mask_position = mask_position, emojis = emojis, sticker = sticker }

   parseInputStickerAnimated :: A.Value -> T.Parser InputSticker
   parseInputStickerAnimated = A.withObject "InputStickerAnimated" $ \o -> do
    emojis <- o A..:? "emojis"
    sticker <- o A..:? "sticker"
    return $ InputStickerAnimated { emojis = emojis, sticker = sticker }
 parseJSON _ = mempty
