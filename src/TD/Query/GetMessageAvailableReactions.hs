{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageAvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns reactions, which can be added to a message. The list can change after updateActiveEmojiReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message
data GetMessageAvailableReactions = GetMessageAvailableReactions
  { -- | Number of reaction per row, 5-25
    row_size :: Maybe Int,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageAvailableReactions where
  show
    GetMessageAvailableReactions
      { row_size = row_size_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageAvailableReactions"
        ++ U.cc
          [ U.p "row_size" row_size_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageAvailableReactions where
  toJSON
    GetMessageAvailableReactions
      { row_size = row_size_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageAvailableReactions",
          "row_size" A..= row_size_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
