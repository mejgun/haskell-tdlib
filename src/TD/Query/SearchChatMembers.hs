module TD.Query.SearchChatMembers
  (SearchChatMembers(..)
  , defaultSearchChatMembers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatMembersFilter as ChatMembersFilter

-- | Searches for a specified query in the first name, last name and usernames of the members of a specified chat. Requires administrator rights if the chat is a channel. Returns 'TD.Data.ChatMembers.ChatMembers'
data SearchChatMembers
  = SearchChatMembers
    { chat_id :: Maybe Int                                 -- ^ Chat identifier
    , query   :: Maybe T.Text                              -- ^ Query to search for
    , limit   :: Maybe Int                                 -- ^ The maximum number of users to be returned; up to 200
    , _filter :: Maybe ChatMembersFilter.ChatMembersFilter -- ^ The type of users to search for; pass null to search among all chat members
    }
  deriving (Eq, Show)

instance I.ShortShow SearchChatMembers where
  shortShow
    SearchChatMembers
      { chat_id = chat_id_
      , query   = query_
      , limit   = limit_
      , _filter = _filter_
      }
        = "SearchChatMembers"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "query"   `I.p` query_
          , "limit"   `I.p` limit_
          , "_filter" `I.p` _filter_
          ]

instance AT.ToJSON SearchChatMembers where
  toJSON
    SearchChatMembers
      { chat_id = chat_id_
      , query   = query_
      , limit   = limit_
      , _filter = _filter_
      }
        = A.object
          [ "@type"   A..= AT.String "searchChatMembers"
          , "chat_id" A..= chat_id_
          , "query"   A..= query_
          , "limit"   A..= limit_
          , "filter"  A..= _filter_
          ]

defaultSearchChatMembers :: SearchChatMembers
defaultSearchChatMembers =
  SearchChatMembers
    { chat_id = Nothing
    , query   = Nothing
    , limit   = Nothing
    , _filter = Nothing
    }

