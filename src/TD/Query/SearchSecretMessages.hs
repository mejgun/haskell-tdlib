module TD.Query.SearchSecretMessages
  (SearchSecretMessages(..)
  , defaultSearchSecretMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter

-- | Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance, the number of returned messages is chosen by TDLib. Returns 'TD.Data.FoundMessages.FoundMessages'
data SearchSecretMessages
  = SearchSecretMessages
    { chat_id :: Maybe Int                                       -- ^ Identifier of the chat in which to search. Specify 0 to search in all secret chats
    , query   :: Maybe T.Text                                    -- ^ Query to search for. If empty, searchChatMessages must be used instead
    , offset  :: Maybe T.Text                                    -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit   :: Maybe Int                                       -- ^ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    , _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter -- ^ Additional filter for messages to search; pass null to search for all messages
    }
  deriving (Eq, Show)

instance I.ShortShow SearchSecretMessages where
  shortShow
    SearchSecretMessages
      { chat_id = chat_id_
      , query   = query_
      , offset  = offset_
      , limit   = limit_
      , _filter = _filter_
      }
        = "SearchSecretMessages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "query"   `I.p` query_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          , "_filter" `I.p` _filter_
          ]

instance AT.ToJSON SearchSecretMessages where
  toJSON
    SearchSecretMessages
      { chat_id = chat_id_
      , query   = query_
      , offset  = offset_
      , limit   = limit_
      , _filter = _filter_
      }
        = A.object
          [ "@type"   A..= AT.String "searchSecretMessages"
          , "chat_id" A..= chat_id_
          , "query"   A..= query_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          , "filter"  A..= _filter_
          ]

defaultSearchSecretMessages :: SearchSecretMessages
defaultSearchSecretMessages =
  SearchSecretMessages
    { chat_id = Nothing
    , query   = Nothing
    , offset  = Nothing
    , limit   = Nothing
    , _filter = Nothing
    }

