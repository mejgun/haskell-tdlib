{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputChatPhoto as InputChatPhoto
import qualified Utils as U

-- |
-- Changes a profile photo for the current user
data SetProfilePhoto = SetProfilePhoto
  { -- | Pass true to set a public photo, which will be visible even the main photo is hidden by privacy settings
    is_public :: Maybe Bool,
    -- | Profile photo to set
    photo :: Maybe InputChatPhoto.InputChatPhoto
  }
  deriving (Eq)

instance Show SetProfilePhoto where
  show
    SetProfilePhoto
      { is_public = is_public_,
        photo = photo_
      } =
      "SetProfilePhoto"
        ++ U.cc
          [ U.p "is_public" is_public_,
            U.p "photo" photo_
          ]

instance T.ToJSON SetProfilePhoto where
  toJSON
    SetProfilePhoto
      { is_public = is_public_,
        photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "setProfilePhoto",
          "is_public" A..= is_public_,
          "photo" A..= photo_
        ]
