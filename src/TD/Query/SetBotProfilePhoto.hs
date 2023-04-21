{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetBotProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputChatPhoto as InputChatPhoto
import qualified Utils as U

-- |
-- Changes a profile photo for a bot @bot_user_id Identifier of the target bot @photo Profile photo to set; pass null to delete the chat photo
data SetBotProfilePhoto = SetBotProfilePhoto
  { -- |
    photo :: Maybe InputChatPhoto.InputChatPhoto,
    -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetBotProfilePhoto where
  show
    SetBotProfilePhoto
      { photo = photo_,
        bot_user_id = bot_user_id_
      } =
      "SetBotProfilePhoto"
        ++ U.cc
          [ U.p "photo" photo_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON SetBotProfilePhoto where
  toJSON
    SetBotProfilePhoto
      { photo = photo_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "setBotProfilePhoto",
          "photo" A..= photo_,
          "bot_user_id" A..= bot_user_id_
        ]
