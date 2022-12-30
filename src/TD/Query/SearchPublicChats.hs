{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchPublicChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches public chats by looking for specified query in their username and title. Currently, only private chats, supergroups and channels can be public. Returns a meaningful number of results.
-- Excludes private chats with contacts and chats from the chat list from the results
data SearchPublicChats = SearchPublicChats
  { -- | Query to search for
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchPublicChats where
  show
    SearchPublicChats
      { query = query_
      } =
      "SearchPublicChats"
        ++ U.cc
          [ U.p "query" query_
          ]

instance T.ToJSON SearchPublicChats where
  toJSON
    SearchPublicChats
      { query = query_
      } =
      A.object
        [ "@type" A..= T.String "searchPublicChats",
          "query" A..= query_
        ]
