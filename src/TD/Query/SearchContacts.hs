module TD.Query.SearchContacts
  (SearchContacts(..)
  , defaultSearchContacts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for the specified query in the first names, last names and usernames of the known user contacts. Returns 'TD.Data.Users.Users'
data SearchContacts
  = SearchContacts
    { query :: Maybe T.Text -- ^ Query to search for; may be empty to return all contacts
    , limit :: Maybe Int    -- ^ The maximum number of users to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow SearchContacts where
  shortShow
    SearchContacts
      { query = query_
      , limit = limit_
      }
        = "SearchContacts"
          ++ I.cc
          [ "query" `I.p` query_
          , "limit" `I.p` limit_
          ]

instance AT.ToJSON SearchContacts where
  toJSON
    SearchContacts
      { query = query_
      , limit = limit_
      }
        = A.object
          [ "@type" A..= AT.String "searchContacts"
          , "query" A..= query_
          , "limit" A..= limit_
          ]

defaultSearchContacts :: SearchContacts
defaultSearchContacts =
  SearchContacts
    { query = Nothing
    , limit = Nothing
    }

