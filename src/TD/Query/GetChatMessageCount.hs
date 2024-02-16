module TD.Query.GetChatMessageCount
  (GetChatMessageCount(..)
  , defaultGetChatMessageCount
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

-- | Returns approximate number of messages of the specified type in the chat. Returns 'TD.Data.Count.Count'
data GetChatMessageCount
  = GetChatMessageCount
    { chat_id                 :: Maybe Int                                       -- ^ Identifier of the chat in which to count messages
    , _filter                 :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Filter for message content; searchMessagesFilterEmpty is unsupported in this function
    , saved_messages_topic_id :: Maybe Int                                       -- ^ If not 0, only messages in the specified Saved Messages topic will be counted; pass 0 to count all messages, or for chats other than Saved Messages
    , return_local            :: Maybe Bool                                      -- ^ Pass true to get the number of messages without sending network requests, or -1 if the number of messages is unknown locally
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatMessageCount where
  shortShow
    GetChatMessageCount
      { chat_id                 = chat_id_
      , _filter                 = _filter_
      , saved_messages_topic_id = saved_messages_topic_id_
      , return_local            = return_local_
      }
        = "GetChatMessageCount"
          ++ I.cc
          [ "chat_id"                 `I.p` chat_id_
          , "_filter"                 `I.p` _filter_
          , "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          , "return_local"            `I.p` return_local_
          ]

instance AT.ToJSON GetChatMessageCount where
  toJSON
    GetChatMessageCount
      { chat_id                 = chat_id_
      , _filter                 = _filter_
      , saved_messages_topic_id = saved_messages_topic_id_
      , return_local            = return_local_
      }
        = A.object
          [ "@type"                   A..= AT.String "getChatMessageCount"
          , "chat_id"                 A..= chat_id_
          , "filter"                  A..= _filter_
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          , "return_local"            A..= return_local_
          ]

defaultGetChatMessageCount :: GetChatMessageCount
defaultGetChatMessageCount =
  GetChatMessageCount
    { chat_id                 = Nothing
    , _filter                 = Nothing
    , saved_messages_topic_id = Nothing
    , return_local            = Nothing
    }

