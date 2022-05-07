{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditChatFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFilter as ChatFilter
import qualified Utils as U

-- |
-- Edits existing chat filter. Returns information about the edited chat filter @chat_filter_id Chat filter identifier @filter The edited chat filter
data EditChatFilter = EditChatFilter
  { -- |
    _filter :: Maybe ChatFilter.ChatFilter,
    -- |
    chat_filter_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditChatFilter where
  show
    EditChatFilter
      { _filter = _filter,
        chat_filter_id = chat_filter_id
      } =
      "EditChatFilter"
        ++ U.cc
          [ U.p "_filter" _filter,
            U.p "chat_filter_id" chat_filter_id
          ]

instance T.ToJSON EditChatFilter where
  toJSON
    EditChatFilter
      { _filter = _filter,
        chat_filter_id = chat_filter_id
      } =
      A.object
        [ "@type" A..= T.String "editChatFilter",
          "filter" A..= _filter,
          "chat_filter_id" A..= chat_filter_id
        ]
