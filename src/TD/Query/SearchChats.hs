{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for the specified query in the title and username of already known chats, this is an offline request. Returns chats in the order seen in the main chat list @query Query to search for. If the query is empty, returns up to 50 recently found chats @limit The maximum number of chats to be returned
data SearchChats = SearchChats
  { -- |
    limit :: Maybe Int,
    -- |
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchChats where
  show
    SearchChats
      { limit = limit,
        query = query
      } =
      "SearchChats"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "query" query
          ]

instance T.ToJSON SearchChats where
  toJSON
    SearchChats
      { limit = limit,
        query = query
      } =
      A.object
        [ "@type" A..= T.String "searchChats",
          "limit" A..= limit,
          "query" A..= query
        ]
