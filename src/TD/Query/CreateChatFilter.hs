{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateChatFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFilter as ChatFilter
import qualified Utils as U

-- |
-- Creates new chat filter. Returns information about the created chat filter @filter Chat filter
data CreateChatFilter = CreateChatFilter
  { -- |
    _filter :: Maybe ChatFilter.ChatFilter
  }
  deriving (Eq)

instance Show CreateChatFilter where
  show
    CreateChatFilter
      { _filter = _filter_
      } =
      "CreateChatFilter"
        ++ U.cc
          [ U.p "_filter" _filter_
          ]

instance T.ToJSON CreateChatFilter where
  toJSON
    CreateChatFilter
      { _filter = _filter_
      } =
      A.object
        [ "@type" A..= T.String "createChatFilter",
          "filter" A..= _filter_
        ]
