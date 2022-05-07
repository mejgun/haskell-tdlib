{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchChatRecentLocationMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user @chat_id Chat identifier @limit The maximum number of messages to be returned
data SearchChatRecentLocationMessages = SearchChatRecentLocationMessages
  { -- |
    limit :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SearchChatRecentLocationMessages where
  show
    SearchChatRecentLocationMessages
      { limit = limit,
        chat_id = chat_id
      } =
      "SearchChatRecentLocationMessages"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SearchChatRecentLocationMessages where
  toJSON
    SearchChatRecentLocationMessages
      { limit = limit,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "searchChatRecentLocationMessages",
          "limit" A..= limit,
          "chat_id" A..= chat_id
        ]
