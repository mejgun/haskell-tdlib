module TD.Query.SearchRecentlyFoundChats
  (SearchRecentlyFoundChats(..)
  , defaultSearchRecentlyFoundChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.SearchChatTypeFilter as SearchChatTypeFilter

-- | Searches for the specified query in the title and username of up to 50 recently found chats. This is an offline method. Returns 'TD.Data.Chats.Chats'
data SearchRecentlyFoundChats
  = SearchRecentlyFoundChats
    { query       :: Maybe T.Text                                    -- ^ Query to search for
    , type_filter :: Maybe SearchChatTypeFilter.SearchChatTypeFilter -- ^ Additional filter for type of the chats to be returned; pass null to search for chats of all types
    , limit       :: Maybe Int                                       -- ^ The maximum number of chats to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow SearchRecentlyFoundChats where
  shortShow
    SearchRecentlyFoundChats
      { query       = query_
      , type_filter = type_filter_
      , limit       = limit_
      }
        = "SearchRecentlyFoundChats"
          ++ I.cc
          [ "query"       `I.p` query_
          , "type_filter" `I.p` type_filter_
          , "limit"       `I.p` limit_
          ]

instance AT.ToJSON SearchRecentlyFoundChats where
  toJSON
    SearchRecentlyFoundChats
      { query       = query_
      , type_filter = type_filter_
      , limit       = limit_
      }
        = A.object
          [ "@type"       A..= AT.String "searchRecentlyFoundChats"
          , "query"       A..= query_
          , "type_filter" A..= type_filter_
          , "limit"       A..= limit_
          ]

defaultSearchRecentlyFoundChats :: SearchRecentlyFoundChats
defaultSearchRecentlyFoundChats =
  SearchRecentlyFoundChats
    { query       = Nothing
    , type_filter = Nothing
    , limit       = Nothing
    }

