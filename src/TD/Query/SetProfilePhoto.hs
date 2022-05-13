{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputChatPhoto as InputChatPhoto
import qualified Utils as U

-- |
-- Changes a profile photo for the current user @photo Profile photo to set
data SetProfilePhoto = SetProfilePhoto
  { -- |
    photo :: Maybe InputChatPhoto.InputChatPhoto
  }
  deriving (Eq)

instance Show SetProfilePhoto where
  show
    SetProfilePhoto
      { photo = photo_
      } =
      "SetProfilePhoto"
        ++ U.cc
          [ U.p "photo" photo_
          ]

instance T.ToJSON SetProfilePhoto where
  toJSON
    SetProfilePhoto
      { photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "setProfilePhoto",
          "photo" A..= photo_
        ]
