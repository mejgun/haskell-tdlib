module TD.Query.GetChatMessagePosition
  (GetChatMessagePosition(..)
  , defaultGetChatMessagePosition
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageTopic as MessageTopic
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

-- | Returns approximate 1-based position of a message among messages, which can be found by the specified filter in the chat and topic. Cannot be used in secret chats. Returns 'TD.Data.Count.Count'
data GetChatMessagePosition
  = GetChatMessagePosition
    { chat_id    :: Maybe Int                                       -- ^ Identifier of the chat in which to find message position
    , topic_id   :: Maybe MessageTopic.MessageTopic                 -- ^ Pass topic identifier to get position among messages only in specific topic; pass null to get position among all chat messages
    , _filter    :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Filter for message content; searchMessagesFilterEmpty, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, and searchMessagesFilterFailedToSend are unsupported in this function
    , message_id :: Maybe Int                                       -- ^ Message identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatMessagePosition where
  shortShow
    GetChatMessagePosition
      { chat_id    = chat_id_
      , topic_id   = topic_id_
      , _filter    = _filter_
      , message_id = message_id_
      }
        = "GetChatMessagePosition"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "topic_id"   `I.p` topic_id_
          , "_filter"    `I.p` _filter_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetChatMessagePosition where
  toJSON
    GetChatMessagePosition
      { chat_id    = chat_id_
      , topic_id   = topic_id_
      , _filter    = _filter_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getChatMessagePosition"
          , "chat_id"    A..= chat_id_
          , "topic_id"   A..= topic_id_
          , "filter"     A..= _filter_
          , "message_id" A..= message_id_
          ]

defaultGetChatMessagePosition :: GetChatMessagePosition
defaultGetChatMessagePosition =
  GetChatMessagePosition
    { chat_id    = Nothing
    , topic_id   = Nothing
    , _filter    = Nothing
    , message_id = Nothing
    }

