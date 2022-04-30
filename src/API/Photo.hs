-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Photo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

-- |
-- 
-- Describes a photo 
-- 
-- __has_stickers__ True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets
-- 
-- __minithumbnail__ Photo minithumbnail; may be null
-- 
-- __sizes__ Available variants of the photo, in different sizes
data Photo = 

 Photo { sizes :: Maybe [PhotoSize.PhotoSize], minithumbnail :: Maybe Minithumbnail.Minithumbnail, has_stickers :: Maybe Bool }  deriving (Eq)

instance Show Photo where
 show Photo { sizes=sizes, minithumbnail=minithumbnail, has_stickers=has_stickers } =
  "Photo" ++ U.cc [U.p "sizes" sizes, U.p "minithumbnail" minithumbnail, U.p "has_stickers" has_stickers ]

instance T.ToJSON Photo where
 toJSON Photo { sizes = sizes, minithumbnail = minithumbnail, has_stickers = has_stickers } =
  A.object [ "@type" A..= T.String "photo", "sizes" A..= sizes, "minithumbnail" A..= minithumbnail, "has_stickers" A..= has_stickers ]

instance T.FromJSON Photo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "photo" -> parsePhoto v
   _ -> mempty
  where
   parsePhoto :: A.Value -> T.Parser Photo
   parsePhoto = A.withObject "Photo" $ \o -> do
    sizes <- o A..:? "sizes"
    minithumbnail <- o A..:? "minithumbnail"
    has_stickers <- o A..:? "has_stickers"
    return $ Photo { sizes = sizes, minithumbnail = minithumbnail, has_stickers = has_stickers }
 parseJSON _ = mempty
