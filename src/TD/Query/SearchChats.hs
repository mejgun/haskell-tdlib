{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { limit = limit_,
        query = query_
      } =
      "SearchChats"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "query" query_
          ]

instance T.ToJSON SearchChats where
  toJSON
    SearchChats
      { limit = limit_,
        query = query_
      } =
      A.object
        [ "@type" A..= T.String "searchChats",
          "limit" A..= limit_,
          "query" A..= query_
        ]
