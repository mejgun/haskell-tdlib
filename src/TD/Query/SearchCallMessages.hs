{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchCallMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for call messages. Returns the results in reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
data SearchCallMessages = SearchCallMessages
  { -- | Pass true to search only for messages with missed/declined calls
    only_missed :: Maybe Bool,
    -- | The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String
  }
  deriving (Eq)

instance Show SearchCallMessages where
  show
    SearchCallMessages
      { only_missed = only_missed_,
        limit = limit_,
        offset = offset_
      } =
      "SearchCallMessages"
        ++ U.cc
          [ U.p "only_missed" only_missed_,
            U.p "limit" limit_,
            U.p "offset" offset_
          ]

instance T.ToJSON SearchCallMessages where
  toJSON
    SearchCallMessages
      { only_missed = only_missed_,
        limit = limit_,
        offset = offset_
      } =
      A.object
        [ "@type" A..= T.String "searchCallMessages",
          "only_missed" A..= only_missed_,
          "limit" A..= limit_,
          "offset" A..= offset_
        ]
