{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SuggestUserProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputChatPhoto as InputChatPhoto
import qualified Utils as U

-- |
-- Suggests a profile photo to another regular user with common messages @user_id User identifier @photo Profile photo to suggest; inputChatPhotoPrevious isn't supported in this function
data SuggestUserProfilePhoto = SuggestUserProfilePhoto
  { -- |
    photo :: Maybe InputChatPhoto.InputChatPhoto,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SuggestUserProfilePhoto where
  show
    SuggestUserProfilePhoto
      { photo = photo_,
        user_id = user_id_
      } =
      "SuggestUserProfilePhoto"
        ++ U.cc
          [ U.p "photo" photo_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON SuggestUserProfilePhoto where
  toJSON
    SuggestUserProfilePhoto
      { photo = photo_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "suggestUserProfilePhoto",
          "photo" A..= photo_,
          "user_id" A..= user_id_
        ]
