{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderChatFilters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the order of chat filters @chat_filter_ids Identifiers of chat filters in the new correct order @main_chat_list_position Position of the main chat list among chat filters, 0-based. Can be non-zero only for Premium users
data ReorderChatFilters = ReorderChatFilters
  { -- |
    main_chat_list_position :: Maybe Int,
    -- |
    chat_filter_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show ReorderChatFilters where
  show
    ReorderChatFilters
      { main_chat_list_position = main_chat_list_position_,
        chat_filter_ids = chat_filter_ids_
      } =
      "ReorderChatFilters"
        ++ U.cc
          [ U.p "main_chat_list_position" main_chat_list_position_,
            U.p "chat_filter_ids" chat_filter_ids_
          ]

instance T.ToJSON ReorderChatFilters where
  toJSON
    ReorderChatFilters
      { main_chat_list_position = main_chat_list_position_,
        chat_filter_ids = chat_filter_ids_
      } =
      A.object
        [ "@type" A..= T.String "reorderChatFilters",
          "main_chat_list_position" A..= main_chat_list_position_,
          "chat_filter_ids" A..= chat_filter_ids_
        ]
