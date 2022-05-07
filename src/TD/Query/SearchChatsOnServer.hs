{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchChatsOnServer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list @query Query to search for @limit The maximum number of chats to be returned
data SearchChatsOnServer = SearchChatsOnServer
  { -- |
    limit :: Maybe Int,
    -- |
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchChatsOnServer where
  show
    SearchChatsOnServer
      { limit = limit,
        query = query
      } =
      "SearchChatsOnServer"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "query" query
          ]

instance T.ToJSON SearchChatsOnServer where
  toJSON
    SearchChatsOnServer
      { limit = limit,
        query = query
      } =
      A.object
        [ "@type" A..= T.String "searchChatsOnServer",
          "limit" A..= limit,
          "query" A..= query
        ]
