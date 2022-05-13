{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchOutgoingDocumentMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for outgoing messages with content of the type messageDocument in all chats except secret chats. Returns the results in reverse chronological order
data SearchOutgoingDocumentMessages = SearchOutgoingDocumentMessages
  { -- | The maximum number of messages to be returned; up to 100
    limit :: Maybe Int,
    -- | Query to search for in document file name and message caption
    query :: Maybe String
  }
  deriving (Eq)

instance Show SearchOutgoingDocumentMessages where
  show
    SearchOutgoingDocumentMessages
      { limit = limit_,
        query = query_
      } =
      "SearchOutgoingDocumentMessages"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "query" query_
          ]

instance T.ToJSON SearchOutgoingDocumentMessages where
  toJSON
    SearchOutgoingDocumentMessages
      { limit = limit_,
        query = query_
      } =
      A.object
        [ "@type" A..= T.String "searchOutgoingDocumentMessages",
          "limit" A..= limit_,
          "query" A..= query_
        ]
