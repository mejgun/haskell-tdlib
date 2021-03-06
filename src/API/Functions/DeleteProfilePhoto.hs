-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteProfilePhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Deletes a profile photo. If something changes, updateUser will be sent 
-- 
-- __profile_photo_id__ Identifier of the profile photo to delete
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
    profile_photo_id <- mconcat [ o A..:? "profile_photo_id", readMaybe <$> (o A..: "profile_photo_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteProfilePhoto { profile_photo_id = profile_photo_id }