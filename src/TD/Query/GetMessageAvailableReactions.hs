{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageAvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns reactions, which can be added to a message. The list can change after updateReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message. The method will return Premium reactions, even the current user has no Premium subscription
data GetMessageAvailableReactions = GetMessageAvailableReactions
  { -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageAvailableReactions where
  show
    GetMessageAvailableReactions
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageAvailableReactions"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageAvailableReactions where
  toJSON
    GetMessageAvailableReactions
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageAvailableReactions",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
