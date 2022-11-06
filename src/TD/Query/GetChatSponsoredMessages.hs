{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatSponsoredMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns sponsored messages to be shown in a chat; for channel chats only @chat_id Identifier of the chat
data GetChatSponsoredMessages = GetChatSponsoredMessages
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatSponsoredMessages where
  show
    GetChatSponsoredMessages
      { chat_id = chat_id_
      } =
      "GetChatSponsoredMessages"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatSponsoredMessages where
  toJSON
    GetChatSponsoredMessages
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatSponsoredMessages",
          "chat_id" A..= chat_id_
        ]
