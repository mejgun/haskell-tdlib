module TD.Query.SearchRecentlyFoundChats
  (SearchRecentlyFoundChats(..)
  , defaultSearchRecentlyFoundChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for the specified query in the title and username of up to 50 recently found chats; this is an offline request. Returns 'TD.Data.Chats.Chats'
data SearchRecentlyFoundChats
  = SearchRecentlyFoundChats
    { query :: Maybe T.Text -- ^ Query to search for
    , limit :: Maybe Int    -- ^ The maximum number of chats to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow SearchRecentlyFoundChats where
  shortShow
    SearchRecentlyFoundChats
      { query = query_
      , limit = limit_
      }
        = "SearchRecentlyFoundChats"
          ++ I.cc
          [ "query" `I.p` query_
          , "limit" `I.p` limit_
          ]

instance AT.ToJSON SearchRecentlyFoundChats where
  toJSON
    SearchRecentlyFoundChats
      { query = query_
      , limit = limit_
      }
        = A.object
          [ "@type" A..= AT.String "searchRecentlyFoundChats"
          , "query" A..= query_
          , "limit" A..= limit_
          ]

defaultSearchRecentlyFoundChats :: SearchRecentlyFoundChats
defaultSearchRecentlyFoundChats =
  SearchRecentlyFoundChats
    { query = Nothing
    , limit = Nothing
    }

