-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserProfilePhotos where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserProfilePhoto as UserProfilePhoto

-- |
-- 
-- Contains part of the list of user photos 
-- 
-- __total_count__ Total number of user profile photos
-- 
-- __photos__ A list of photos
data UserProfilePhotos = 
 UserProfilePhotos { photos :: Maybe [UserProfilePhoto.UserProfilePhoto], total_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON UserProfilePhotos where
 toJSON (UserProfilePhotos { photos = photos, total_count = total_count }) =
  A.object [ "@type" A..= T.String "userProfilePhotos", "photos" A..= photos, "total_count" A..= total_count ]

instance T.FromJSON UserProfilePhotos where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userProfilePhotos" -> parseUserProfilePhotos v
   _ -> mempty
  where
   parseUserProfilePhotos :: A.Value -> T.Parser UserProfilePhotos
   parseUserProfilePhotos = A.withObject "UserProfilePhotos" $ \o -> do
    photos <- o A..:? "photos"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UserProfilePhotos { photos = photos, total_count = total_count }