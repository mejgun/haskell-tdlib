module TD.Query.SearchChats
  (SearchChats(..)
  , defaultSearchChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for the specified query in the title and username of already known chats; this is an offline request. Returns chats in the order seen in the main chat list. Returns 'TD.Data.Chats.Chats'
data SearchChats
  = SearchChats
    { query :: Maybe T.Text -- ^ Query to search for. If the query is empty, returns up to 50 recently found chats
    , limit :: Maybe Int    -- ^ The maximum number of chats to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow SearchChats where
  shortShow
    SearchChats
      { query = query_
      , limit = limit_
      }
        = "SearchChats"
          ++ I.cc
          [ "query" `I.p` query_
          , "limit" `I.p` limit_
          ]

instance AT.ToJSON SearchChats where
  toJSON
    SearchChats
      { query = query_
      , limit = limit_
      }
        = A.object
          [ "@type" A..= AT.String "searchChats"
          , "query" A..= query_
          , "limit" A..= limit_
          ]

defaultSearchChats :: SearchChats
defaultSearchChats =
  SearchChats
    { query = Nothing
    , limit = Nothing
    }

