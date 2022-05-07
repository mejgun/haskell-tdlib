{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for the specified query in the first names, last names and usernames of the known user contacts @query Query to search for; may be empty to return all contacts @limit The maximum number of users to be returned
data SearchContacts = SearchContacts
  { -- |
    limit :: Maybe Int,
    -- |
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchContacts where
  show
    SearchContacts
      { limit = limit,
        query = query
      } =
      "SearchContacts"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "query" query
          ]

instance T.ToJSON SearchContacts where
  toJSON
    SearchContacts
      { limit = limit,
        query = query
      } =
      A.object
        [ "@type" A..= T.String "searchContacts",
          "limit" A..= limit,
          "query" A..= query
        ]
