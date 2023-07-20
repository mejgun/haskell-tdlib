{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchRecentlyFoundChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for the specified query in the title and username of up to 50 recently found chats; this is an offline request
data SearchRecentlyFoundChats = SearchRecentlyFoundChats
  { -- | The maximum number of chats to be returned
    limit :: Maybe Int,
    -- | Query to search for
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchRecentlyFoundChats where
  show
    SearchRecentlyFoundChats
      { limit = limit_,
        query = query_
      } =
      "SearchRecentlyFoundChats"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "query" query_
          ]

instance T.ToJSON SearchRecentlyFoundChats where
  toJSON
    SearchRecentlyFoundChats
      { limit = limit_,
        query = query_
      } =
      A.object
        [ "@type" A..= T.String "searchRecentlyFoundChats",
          "limit" A..= limit_,
          "query" A..= query_
        ]
