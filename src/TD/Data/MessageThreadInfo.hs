{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageThreadInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.DraftMessage as DraftMessage
import qualified TD.Data.Message as Message
import qualified TD.Data.MessageReplyInfo as MessageReplyInfo
import qualified Utils as U

data MessageThreadInfo = -- | Contains information about a message thread
  MessageThreadInfo
  { -- | A draft of a message in the message thread; may be null
    draft_message :: Maybe DraftMessage.DraftMessage,
    -- | The messages from which the thread starts. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id)
    messages :: Maybe [Message.Message],
    -- | Approximate number of unread messages in the message thread
    unread_message_count :: Maybe Int,
    -- | Information about the message thread
    reply_info :: Maybe MessageReplyInfo.MessageReplyInfo,
    -- | Message thread identifier, unique within the chat
    message_thread_id :: Maybe Int,
    -- | Identifier of the chat to which the message thread belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show MessageThreadInfo where
  show
    MessageThreadInfo
      { draft_message = draft_message_,
        messages = messages_,
        unread_message_count = unread_message_count_,
        reply_info = reply_info_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "MessageThreadInfo"
        ++ U.cc
          [ U.p "draft_message" draft_message_,
            U.p "messages" messages_,
            U.p "unread_message_count" unread_message_count_,
            U.p "reply_info" reply_info_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.FromJSON MessageThreadInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageThreadInfo" -> parseMessageThreadInfo v
      _ -> mempty
    where
      parseMessageThreadInfo :: A.Value -> T.Parser MessageThreadInfo
      parseMessageThreadInfo = A.withObject "MessageThreadInfo" $ \o -> do
        draft_message_ <- o A..:? "draft_message"
        messages_ <- o A..:? "messages"
        unread_message_count_ <- mconcat [o A..:? "unread_message_count", U.rm <$> (o A..: "unread_message_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        reply_info_ <- o A..:? "reply_info"
        message_thread_id_ <- mconcat [o A..:? "message_thread_id", U.rm <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageThreadInfo {draft_message = draft_message_, messages = messages_, unread_message_count = unread_message_count_, reply_info = reply_info_, message_thread_id = message_thread_id_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON MessageThreadInfo where
  toJSON
    MessageThreadInfo
      { draft_message = draft_message_,
        messages = messages_,
        unread_message_count = unread_message_count_,
        reply_info = reply_info_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "messageThreadInfo",
          "draft_message" A..= draft_message_,
          "messages" A..= messages_,
          "unread_message_count" A..= unread_message_count_,
          "reply_info" A..= reply_info_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
