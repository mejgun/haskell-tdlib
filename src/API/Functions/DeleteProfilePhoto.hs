-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteProfilePhoto where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DeleteProfilePhoto = 
 DeleteProfilePhoto { profile_photo_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DeleteProfilePhoto where
 toJSON (DeleteProfilePhoto { profile_photo_id = profile_photo_id }) =
  A.object [ "@type" A..= T.String "deleteProfilePhoto", "profile_photo_id" A..= profile_photo_id ]

instance T.FromJSON DeleteProfilePhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteProfilePhoto" -> parseDeleteProfilePhoto v
   _ -> mempty
  where
   parseDeleteProfilePhoto :: A.Value -> T.Parser DeleteProfilePhoto
   parseDeleteProfilePhoto = A.withObject "DeleteProfilePhoto" $ \o -> do
    profile_photo_id <- optional $ o A..: "profile_photo_id"
    return $ DeleteProfilePhoto { profile_photo_id = profile_photo_id }