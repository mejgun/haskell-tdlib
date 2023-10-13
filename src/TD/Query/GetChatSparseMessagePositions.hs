module TD.Query.GetChatSparseMessagePositions(GetChatSparseMessagePositions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

data GetChatSparseMessagePositions -- ^ Returns sparse positions of messages of the specified type in the chat to be used for shared media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id). Cannot be used in secret chats or with searchMessagesFilterFailedToSend filter without an enabled message database
  = GetChatSparseMessagePositions
    { chat_id         :: Maybe Int                                       -- ^ Identifier of the chat in which to return information about message positions
    , _filter         :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
    , from_message_id :: Maybe Int                                       -- ^ The message identifier from which to return information about message positions
    , limit           :: Maybe Int                                       -- ^ The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
    }
  deriving (Eq)

instance Show GetChatSparseMessagePositions where
  show
    GetChatSparseMessagePositions
      { chat_id         = chat_id_
      , _filter         = _filter_
      , from_message_id = from_message_id_
      , limit           = limit_
      }
        = "GetChatSparseMessagePositions"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "_filter"         `I.p` _filter_
          , "from_message_id" `I.p` from_message_id_
          , "limit"           `I.p` limit_
          ]

instance AT.ToJSON GetChatSparseMessagePositions where
  toJSON
    GetChatSparseMessagePositions
      { chat_id         = chat_id_
      , _filter         = _filter_
      , from_message_id = from_message_id_
      , limit           = limit_
      }
        = A.object
          [ "@type"           A..= AT.String "getChatSparseMessagePositions"
          , "chat_id"         A..= chat_id_
          , "filter"          A..= _filter_
          , "from_message_id" A..= from_message_id_
          , "limit"           A..= limit_
          ]
