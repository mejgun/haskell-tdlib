{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderChatFilters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the order of chat filters @chat_filter_ids Identifiers of chat filters in the new correct order
data ReorderChatFilters = ReorderChatFilters
  { -- |
    chat_filter_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show ReorderChatFilters where
  show
    ReorderChatFilters
      { chat_filter_ids = chat_filter_ids_
      } =
      "ReorderChatFilters"
        ++ U.cc
          [ U.p "chat_filter_ids" chat_filter_ids_
          ]

instance T.ToJSON ReorderChatFilters where
  toJSON
    ReorderChatFilters
      { chat_filter_ids = chat_filter_ids_
      } =
      A.object
        [ "@type" A..= T.String "reorderChatFilters",
          "chat_filter_ids" A..= chat_filter_ids_
        ]
