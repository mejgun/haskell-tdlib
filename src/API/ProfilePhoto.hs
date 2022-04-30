-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ProfilePhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- Describes a user profile photo 
-- 
-- __id__ Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
-- 
-- __small__ A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
-- 
-- __big__ A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
-- 
-- __minithumbnail__ User profile photo minithumbnail; may be null
-- 
-- __has_animation__ True, if the photo has animated variant
data ProfilePhoto = 

 ProfilePhoto { has_animation :: Maybe Bool, minithumbnail :: Maybe Minithumbnail.Minithumbnail, big :: Maybe File.File, small :: Maybe File.File, _id :: Maybe Int }  deriving (Eq)

instance Show ProfilePhoto where
 show ProfilePhoto { has_animation=has_animation, minithumbnail=minithumbnail, big=big, small=small, _id=_id } =
  "ProfilePhoto" ++ U.cc [U.p "has_animation" has_animation, U.p "minithumbnail" minithumbnail, U.p "big" big, U.p "small" small, U.p "_id" _id ]

instance T.ToJSON ProfilePhoto where
 toJSON ProfilePhoto { has_animation = has_animation, minithumbnail = minithumbnail, big = big, small = small, _id = _id } =
  A.object [ "@type" A..= T.String "profilePhoto", "has_animation" A..= has_animation, "minithumbnail" A..= minithumbnail, "big" A..= big, "small" A..= small, "id" A..= _id ]

instance T.FromJSON ProfilePhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "profilePhoto" -> parseProfilePhoto v
   _ -> mempty
  where
   parseProfilePhoto :: A.Value -> T.Parser ProfilePhoto
   parseProfilePhoto = A.withObject "ProfilePhoto" $ \o -> do
    has_animation <- o A..:? "has_animation"
    minithumbnail <- o A..:? "minithumbnail"
    big <- o A..:? "big"
    small <- o A..:? "small"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ProfilePhoto { has_animation = has_animation, minithumbnail = minithumbnail, big = big, small = small, _id = _id }
 parseJSON _ = mempty
