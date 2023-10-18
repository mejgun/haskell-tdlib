module TD.Query.SearchChatRecentLocationMessages
  (SearchChatRecentLocationMessages(..)
  , defaultSearchChatRecentLocationMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user. Returns 'TD.Data.Messages.Messages'
data SearchChatRecentLocationMessages
  = SearchChatRecentLocationMessages
    { chat_id :: Maybe Int -- ^ Chat identifier
    , limit   :: Maybe Int -- ^ The maximum number of messages to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow SearchChatRecentLocationMessages where
  shortShow
    SearchChatRecentLocationMessages
      { chat_id = chat_id_
      , limit   = limit_
      }
        = "SearchChatRecentLocationMessages"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON SearchChatRecentLocationMessages where
  toJSON
    SearchChatRecentLocationMessages
      { chat_id = chat_id_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "searchChatRecentLocationMessages"
          , "chat_id" A..= chat_id_
          , "limit"   A..= limit_
          ]

defaultSearchChatRecentLocationMessages :: SearchChatRecentLocationMessages
defaultSearchChatRecentLocationMessages =
  SearchChatRecentLocationMessages
    { chat_id = Nothing
    , limit   = Nothing
    }

