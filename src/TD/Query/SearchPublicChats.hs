module TD.Query.SearchPublicChats
  (SearchPublicChats(..)
  , defaultSearchPublicChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.SearchChatTypeFilter as SearchChatTypeFilter

-- | Searches public chats by looking for specified query in their username and title. Currently, only private chats, supergroups and channels can be public. Returns a meaningful number of results. Excludes private chats with contacts and chats from the chat list from the results. Returns 'TD.Data.Chats.Chats'
data SearchPublicChats
  = SearchPublicChats
    { query       :: Maybe T.Text                                    -- ^ Query to search for
    , type_filter :: Maybe SearchChatTypeFilter.SearchChatTypeFilter -- ^ Additional filter for type of the chats to be returned; pass null to search for chats of all types
    }
  deriving (Eq, Show)

instance I.ShortShow SearchPublicChats where
  shortShow
    SearchPublicChats
      { query       = query_
      , type_filter = type_filter_
      }
        = "SearchPublicChats"
          ++ I.cc
          [ "query"       `I.p` query_
          , "type_filter" `I.p` type_filter_
          ]

instance AT.ToJSON SearchPublicChats where
  toJSON
    SearchPublicChats
      { query       = query_
      , type_filter = type_filter_
      }
        = A.object
          [ "@type"       A..= AT.String "searchPublicChats"
          , "query"       A..= query_
          , "type_filter" A..= type_filter_
          ]

defaultSearchPublicChats :: SearchPublicChats
defaultSearchPublicChats =
  SearchPublicChats
    { query       = Nothing
    , type_filter = Nothing
    }

