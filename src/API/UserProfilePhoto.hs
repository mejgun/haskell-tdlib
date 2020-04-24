-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserProfilePhoto where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize

data UserProfilePhoto = 
 UserProfilePhoto { sizes :: Maybe [PhotoSize.PhotoSize], added_date :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON UserProfilePhoto where
 toJSON (UserProfilePhoto { sizes = sizes, added_date = added_date, _id = _id }) =
  A.object [ "@type" A..= T.String "userProfilePhoto", "sizes" A..= sizes, "added_date" A..= added_date, "id" A..= _id ]

instance T.FromJSON UserProfilePhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userProfilePhoto" -> parseUserProfilePhoto v
   _ -> mempty
  where
   parseUserProfilePhoto :: A.Value -> T.Parser UserProfilePhoto
   parseUserProfilePhoto = A.withObject "UserProfilePhoto" $ \o -> do
    sizes <- optional $ o A..: "sizes"
    added_date <- optional $ o A..: "added_date"
    _id <- optional $ o A..: "id"
    return $ UserProfilePhoto { sizes = sizes, added_date = added_date, _id = _id }