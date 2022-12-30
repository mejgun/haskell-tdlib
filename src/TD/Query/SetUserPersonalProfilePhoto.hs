{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetUserPersonalProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputChatPhoto as InputChatPhoto
import qualified Utils as U

-- |
-- Changes a personal profile photo of a contact user @user_id User identifier @photo Profile photo to set; pass null to delete the photo; inputChatPhotoPrevious isn't supported in this function
data SetUserPersonalProfilePhoto = SetUserPersonalProfilePhoto
  { -- |
    photo :: Maybe InputChatPhoto.InputChatPhoto,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetUserPersonalProfilePhoto where
  show
    SetUserPersonalProfilePhoto
      { photo = photo_,
        user_id = user_id_
      } =
      "SetUserPersonalProfilePhoto"
        ++ U.cc
          [ U.p "photo" photo_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON SetUserPersonalProfilePhoto where
  toJSON
    SetUserPersonalProfilePhoto
      { photo = photo_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "setUserPersonalProfilePhoto",
          "photo" A..= photo_,
          "user_id" A..= user_id_
        ]
