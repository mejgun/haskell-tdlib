-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputSticker where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.StickerType as StickerType
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- A sticker to be added to a sticker set
-- 
-- __sticker__ File with the sticker; must fit in a 512x512 square. For WEBP stickers and masks the file must be in PNG format, which will be converted to WEBP server-side. Otherwise, the file must be local or uploaded within a week. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
-- 
-- __emojis__ Emojis corresponding to the sticker
-- 
-- __type__ Sticker type
data InputSticker = 

 InputSticker { _type :: Maybe StickerType.StickerType, emojis :: Maybe String, sticker :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show InputSticker where
 show InputSticker { _type=_type, emojis=emojis, sticker=sticker } =
  "InputSticker" ++ cc [p "_type" _type, p "emojis" emojis, p "sticker" sticker ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InputSticker where
 toJSON InputSticker { _type = _type, emojis = emojis, sticker = sticker } =
  A.object [ "@type" A..= T.String "inputSticker", "type" A..= _type, "emojis" A..= emojis, "sticker" A..= sticker ]

instance T.FromJSON InputSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputSticker" -> parseInputSticker v
   _ -> mempty
  where
   parseInputSticker :: A.Value -> T.Parser InputSticker
   parseInputSticker = A.withObject "InputSticker" $ \o -> do
    _type <- o A..:? "type"
    emojis <- o A..:? "emojis"
    sticker <- o A..:? "sticker"
    return $ InputSticker { _type = _type, emojis = emojis, sticker = sticker }
 parseJSON _ = mempty
