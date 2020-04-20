-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserProfilePhotos where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserProfilePhoto as UserProfilePhoto

--main = putStrLn "ok"

data UserProfilePhotos = 
 UserProfilePhotos { photos :: [UserProfilePhoto.UserProfilePhoto], total_count :: Int }  -- deriving (Show)

instance T.ToJSON UserProfilePhotos where
 toJSON (UserProfilePhotos { photos = photos, total_count = total_count }) =
  A.object [ "@type" A..= T.String "userProfilePhotos", "photos" A..= photos, "total_count" A..= total_count ]
-- userProfilePhotos UserProfilePhotos  { photos :: [UserProfilePhoto.UserProfilePhoto], total_count :: Int } 

