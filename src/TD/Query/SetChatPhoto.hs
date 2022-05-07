{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputChatPhoto as InputChatPhoto
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
      { photo = photo,
        chat_id = chat_id
      } =
      "SetChatPhoto"
        ++ U.cc
          [ U.p "photo" photo,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatPhoto where
  toJSON
    SetChatPhoto
      { photo = photo,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatPhoto",
          "photo" A..= photo,
          "chat_id" A..= chat_id
        ]
