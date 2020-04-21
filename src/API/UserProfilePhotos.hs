-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserProfilePhotos where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserProfilePhoto as UserProfilePhoto

data UserProfilePhotos = 
 UserProfilePhotos { photos :: [UserProfilePhoto.UserProfilePhoto], total_count :: Int }  deriving (Show)

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
    photos <- o A..: "photos"
    total_count <- o A..: "total_count"
    return $ UserProfilePhotos { photos = photos, total_count = total_count }