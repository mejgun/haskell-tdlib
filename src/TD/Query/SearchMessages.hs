module TD.Query.SearchMessages(SearchMessages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList
import qualified Data.Text as T
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

data SearchMessages -- ^ Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)). For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  = SearchMessages
    { chat_list :: Maybe ChatList.ChatList                         -- ^ Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
    , query     :: Maybe T.Text                                    -- ^ Query to search for
    , offset    :: Maybe T.Text                                    -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit     :: Maybe Int                                       -- ^ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    , _filter   :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function
    , min_date  :: Maybe Int                                       -- ^ If not 0, the minimum date of the messages to return
    , max_date  :: Maybe Int                                       -- ^ If not 0, the maximum date of the messages to return
    }
  deriving (Eq)

instance Show SearchMessages where
  show
    SearchMessages
      { chat_list = chat_list_
      , query     = query_
      , offset    = offset_
      , limit     = limit_
      , _filter   = _filter_
      , min_date  = min_date_
      , max_date  = max_date_
      }
        = "SearchMessages"
          ++ I.cc
          [ "chat_list" `I.p` chat_list_
          , "query"     `I.p` query_
          , "offset"    `I.p` offset_
          , "limit"     `I.p` limit_
          , "_filter"   `I.p` _filter_
          , "min_date"  `I.p` min_date_
          , "max_date"  `I.p` max_date_
          ]

instance AT.ToJSON SearchMessages where
  toJSON
    SearchMessages
      { chat_list = chat_list_
      , query     = query_
      , offset    = offset_
      , limit     = limit_
      , _filter   = _filter_
      , min_date  = min_date_
      , max_date  = max_date_
      }
        = A.object
          [ "@type"     A..= AT.String "searchMessages"
          , "chat_list" A..= chat_list_
          , "query"     A..= query_
          , "offset"    A..= offset_
          , "limit"     A..= limit_
          , "filter"    A..= _filter_
          , "min_date"  A..= min_date_
          , "max_date"  A..= max_date_
          ]
