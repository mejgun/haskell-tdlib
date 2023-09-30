{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchStringsByPrefix where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches specified query by word prefixes in the provided strings. Returns 0-based positions of strings that matched. Can be called synchronously
data SearchStringsByPrefix = SearchStringsByPrefix
  { -- | Pass true to receive no results for an empty query
    return_none_for_empty_query :: Maybe Bool,
    -- | The maximum number of objects to return
    limit :: Maybe Int,
    -- | Query to search for
    query :: Maybe String,
    -- | The strings to search in for the query
    strings :: Maybe [String]
  }
  deriving (Eq)

instance Show SearchStringsByPrefix where
  show
    SearchStringsByPrefix
      { return_none_for_empty_query = return_none_for_empty_query_,
        limit = limit_,
        query = query_,
        strings = strings_
      } =
      "SearchStringsByPrefix"
        ++ U.cc
          [ U.p "return_none_for_empty_query" return_none_for_empty_query_,
            U.p "limit" limit_,
            U.p "query" query_,
            U.p "strings" strings_
          ]

instance T.ToJSON SearchStringsByPrefix where
  toJSON
    SearchStringsByPrefix
      { return_none_for_empty_query = return_none_for_empty_query_,
        limit = limit_,
        query = query_,
        strings = strings_
      } =
      A.object
        [ "@type" A..= T.String "searchStringsByPrefix",
          "return_none_for_empty_query" A..= return_none_for_empty_query_,
          "limit" A..= limit_,
          "query" A..= query_,
          "strings" A..= strings_
        ]
