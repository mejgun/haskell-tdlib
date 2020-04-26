-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ProfilePhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- Describes a user profile photo 
-- 
-- __id__ Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of userProfilePhotos
-- 
-- __small__ A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
-- 
-- __big__ A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
data ProfilePhoto = 
 ProfilePhoto { big :: Maybe File.File, small :: Maybe File.File, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ProfilePhoto where
 toJSON (ProfilePhoto { big = big, small = small, _id = _id }) =
  A.object [ "@type" A..= T.String "profilePhoto", "big" A..= big, "small" A..= small, "id" A..= _id ]

instance T.FromJSON ProfilePhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "profilePhoto" -> parseProfilePhoto v
   _ -> mempty
  where
   parseProfilePhoto :: A.Value -> T.Parser ProfilePhoto
   parseProfilePhoto = A.withObject "ProfilePhoto" $ \o -> do
    big <- o A..:? "big"
    small <- o A..:? "small"
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ProfilePhoto { big = big, small = small, _id = _id }