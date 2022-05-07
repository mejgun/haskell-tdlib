{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatFilterDefaultIconName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatFilter as ChatFilter
import qualified Utils as U

-- |
-- Returns default icon name for a filter. Can be called synchronously @filter Chat filter
data GetChatFilterDefaultIconName = GetChatFilterDefaultIconName
  { -- |
    _filter :: Maybe ChatFilter.ChatFilter
  }
  deriving (Eq)

instance Show GetChatFilterDefaultIconName where
  show
    GetChatFilterDefaultIconName
      { _filter = _filter
      } =
      "GetChatFilterDefaultIconName"
        ++ U.cc
          [ U.p "_filter" _filter
          ]

instance T.ToJSON GetChatFilterDefaultIconName where
  toJSON
    GetChatFilterDefaultIconName
      { _filter = _filter
      } =
      A.object
        [ "@type" A..= T.String "getChatFilterDefaultIconName",
          "filter" A..= _filter
        ]
