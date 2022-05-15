{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes a profile photo @profile_photo_id Identifier of the profile photo to delete
data DeleteProfilePhoto = DeleteProfilePhoto
  { -- |
    profile_photo_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteProfilePhoto where
  show
    DeleteProfilePhoto
      { profile_photo_id = profile_photo_id_
      } =
      "DeleteProfilePhoto"
        ++ U.cc
          [ U.p "profile_photo_id" profile_photo_id_
          ]

instance T.ToJSON DeleteProfilePhoto where
  toJSON
    DeleteProfilePhoto
      { profile_photo_id = profile_photo_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteProfilePhoto",
          "profile_photo_id" A..= U.toS profile_photo_id_
        ]
