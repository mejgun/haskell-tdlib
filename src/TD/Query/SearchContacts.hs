module TD.Query.SearchContacts(SearchContacts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SearchContacts -- ^ Searches for the specified query in the first names, last names and usernames of the known user contacts
  = SearchContacts
    { query :: Maybe T.Text -- ^ Query to search for; may be empty to return all contacts
    , limit :: Maybe Int    -- ^ The maximum number of users to be returned
    }
  deriving (Eq)

instance Show SearchContacts where
  show
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
