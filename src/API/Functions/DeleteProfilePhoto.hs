-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteProfilePhoto = 
 DeleteProfilePhoto { profile_photo_id :: Int }  -- deriving (Show)

instance T.ToJSON DeleteProfilePhoto where
 toJSON (DeleteProfilePhoto { profile_photo_id = profile_photo_id }) =
  A.object [ "@type" A..= T.String "deleteProfilePhoto", "profile_photo_id" A..= profile_photo_id ]
-- deleteProfilePhoto DeleteProfilePhoto  { profile_photo_id :: Int } 

