{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatDraftMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.DraftMessage as DraftMessage
import qualified Utils as U

-- |
-- Changes the draft message in a chat @chat_id Chat identifier @message_thread_id If not 0, a message thread identifier in which the draft was changed @draft_message New draft message; pass null to remove the draft
data SetChatDraftMessage = SetChatDraftMessage
  { -- |
    draft_message :: Maybe DraftMessage.DraftMessage,
    -- |
    message_thread_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatDraftMessage where
  show
    SetChatDraftMessage
      { draft_message = draft_message_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "SetChatDraftMessage"
        ++ U.cc
          [ U.p "draft_message" draft_message_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatDraftMessage where
  toJSON
    SetChatDraftMessage
      { draft_message = draft_message_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatDraftMessage",
          "draft_message" A..= draft_message_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
