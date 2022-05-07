{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchCallMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
data SearchCallMessages = SearchCallMessages
  { -- | Pass true to search only for messages with missed/declined calls
    only_missed :: Maybe Bool,
    -- | The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Identifier of the message from which to search; use 0 to get results from the last message
    from_message_id :: Maybe Int
  }
  deriving (Eq)

instance Show SearchCallMessages where
  show
    SearchCallMessages
      { only_missed = only_missed,
        limit = limit,
        from_message_id = from_message_id
      } =
      "SearchCallMessages"
        ++ U.cc
          [ U.p "only_missed" only_missed,
            U.p "limit" limit,
            U.p "from_message_id" from_message_id
          ]

instance T.ToJSON SearchCallMessages where
  toJSON
    SearchCallMessages
      { only_missed = only_missed,
        limit = limit,
        from_message_id = from_message_id
      } =
      A.object
        [ "@type" A..= T.String "searchCallMessages",
          "only_missed" A..= only_missed,
          "limit" A..= limit,
          "from_message_id" A..= from_message_id
        ]
