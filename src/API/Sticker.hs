-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Sticker where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.Thumbnail as Thumbnail
import {-# SOURCE #-} qualified API.ClosedVectorPath as ClosedVectorPath
import {-# SOURCE #-} qualified API.StickerType as StickerType

-- |
-- 
-- Describes a sticker 
-- 
-- __set_id__ The identifier of the sticker set to which the sticker belongs; 0 if none
-- 
-- __width__ Sticker width; as defined by the sender
-- 
-- __height__ Sticker height; as defined by the sender
-- 
-- __emoji__ Emoji corresponding to the sticker
-- 
-- __type__ Sticker type
-- 
-- __outline__ Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
-- 
-- __thumbnail__ Sticker thumbnail in WEBP or JPEG format; may be null
-- 
-- __sticker__ File containing the sticker
data Sticker = 

 Sticker { sticker :: Maybe File.File, thumbnail :: Maybe Thumbnail.Thumbnail, outline :: Maybe [ClosedVectorPath.ClosedVectorPath], _type :: Maybe StickerType.StickerType, emoji :: Maybe String, height :: Maybe Int, width :: Maybe Int, set_id :: Maybe Int }  deriving (Eq)

instance Show Sticker where
 show Sticker { sticker=sticker, thumbnail=thumbnail, outline=outline, _type=_type, emoji=emoji, height=height, width=width, set_id=set_id } =
  "Sticker" ++ cc [p "sticker" sticker, p "thumbnail" thumbnail, p "outline" outline, p "_type" _type, p "emoji" emoji, p "height" height, p "width" width, p "set_id" set_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Sticker where
 toJSON Sticker { sticker = sticker, thumbnail = thumbnail, outline = outline, _type = _type, emoji = emoji, height = height, width = width, set_id = set_id } =
  A.object [ "@type" A..= T.String "sticker", "sticker" A..= sticker, "thumbnail" A..= thumbnail, "outline" A..= outline, "type" A..= _type, "emoji" A..= emoji, "height" A..= height, "width" A..= width, "set_id" A..= set_id ]

instance T.FromJSON Sticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sticker" -> parseSticker v
   _ -> mempty
  where
   parseSticker :: A.Value -> T.Parser Sticker
   parseSticker = A.withObject "Sticker" $ \o -> do
    sticker <- o A..:? "sticker"
    thumbnail <- o A..:? "thumbnail"
    outline <- o A..:? "outline"
    _type <- o A..:? "type"
    emoji <- o A..:? "emoji"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    set_id <- mconcat [ o A..:? "set_id", readMaybe <$> (o A..: "set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Sticker { sticker = sticker, thumbnail = thumbnail, outline = outline, _type = _type, emoji = emoji, height = height, width = width, set_id = set_id }
 parseJSON _ = mempty
