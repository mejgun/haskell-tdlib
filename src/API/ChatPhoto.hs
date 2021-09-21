-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AnimatedChatPhoto as AnimatedChatPhoto
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

-- |
-- 
-- Describes a chat or user profile photo
-- 
-- __id__ Unique photo identifier
-- 
-- __added_date__ Point in time (Unix timestamp) when the photo has been added
-- 
-- __minithumbnail__ Photo minithumbnail; may be null
-- 
-- __sizes__ Available variants of the photo in JPEG format, in different size
-- 
-- __animation__ Animated variant of the photo in MPEG4 format; may be null
data ChatPhoto = 

 ChatPhoto { animation :: Maybe AnimatedChatPhoto.AnimatedChatPhoto, sizes :: Maybe [PhotoSize.PhotoSize], minithumbnail :: Maybe Minithumbnail.Minithumbnail, added_date :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatPhoto where
 toJSON (ChatPhoto { animation = animation, sizes = sizes, minithumbnail = minithumbnail, added_date = added_date, _id = _id }) =
  A.object [ "@type" A..= T.String "chatPhoto", "animation" A..= animation, "sizes" A..= sizes, "minithumbnail" A..= minithumbnail, "added_date" A..= added_date, "id" A..= _id ]

instance T.FromJSON ChatPhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatPhoto" -> parseChatPhoto v
   _ -> mempty
  where
   parseChatPhoto :: A.Value -> T.Parser ChatPhoto
   parseChatPhoto = A.withObject "ChatPhoto" $ \o -> do
    animation <- o A..:? "animation"
    sizes <- o A..:? "sizes"
    minithumbnail <- o A..:? "minithumbnail"
    added_date <- mconcat [ o A..:? "added_date", readMaybe <$> (o A..: "added_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatPhoto { animation = animation, sizes = sizes, minithumbnail = minithumbnail, added_date = added_date, _id = _id }