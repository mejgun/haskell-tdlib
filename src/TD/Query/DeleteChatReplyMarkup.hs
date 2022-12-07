{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteChatReplyMarkup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a replyMarkupForceReply reply markup has been used. An updateChatReplyMarkup update will be sent if the reply markup is changed
data DeleteChatReplyMarkup = DeleteChatReplyMarkup
  { -- | The message identifier of the used keyboard
    message_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChatReplyMarkup where
  show
    DeleteChatReplyMarkup
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "DeleteChatReplyMarkup"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON DeleteChatReplyMarkup where
  toJSON
    DeleteChatReplyMarkup
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteChatReplyMarkup",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
