{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatSponsoredMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns sponsored message to be shown in a chat; for channel chats only. Returns a 404 error if there is no sponsored message in the chat @chat_id Identifier of the chat
data GetChatSponsoredMessage = GetChatSponsoredMessage
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatSponsoredMessage where
  show
    GetChatSponsoredMessage
      { chat_id = chat_id_
      } =
      "GetChatSponsoredMessage"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatSponsoredMessage where
  toJSON
    GetChatSponsoredMessage
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatSponsoredMessage",
          "chat_id" A..= chat_id_
        ]
