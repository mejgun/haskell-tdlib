{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for the specified query in the first names, last names and usernames of the known user contacts
data SearchContacts = SearchContacts
  { -- | The maximum number of users to be returned
    limit :: Maybe Int,
    -- | Query to search for; may be empty to return all contacts
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchContacts where
  show
    SearchContacts
      { limit = limit_,
        query = query_
      } =
      "SearchContacts"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "query" query_
          ]

instance T.ToJSON SearchContacts where
  toJSON
    SearchContacts
      { limit = limit_,
        query = query_
      } =
      A.object
        [ "@type" A..= T.String "searchContacts",
          "limit" A..= limit_,
          "query" A..= query_
        ]
