{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputChatPhoto as InputChatPhoto
import qualified Utils as U

-- |
-- Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
data SetChatPhoto = SetChatPhoto
  { -- |
    photo :: Maybe InputChatPhoto.InputChatPhoto,
    -- | Chat identifier @photo New chat photo; pass null to delete the chat photo
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatPhoto where
  show
    SetChatPhoto
      { photo = photo_,
        chat_id = chat_id_
      } =
      "SetChatPhoto"
        ++ U.cc
          [ U.p "photo" photo_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatPhoto where
  toJSON
    SetChatPhoto
      { photo = photo_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatPhoto",
          "photo" A..= photo_,
          "chat_id" A..= chat_id_
        ]
