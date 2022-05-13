{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a chat filter by its identifier @chat_filter_id Chat filter identifier
data GetChatFilter = GetChatFilter
  { -- |
    chat_filter_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatFilter where
  show
    GetChatFilter
      { chat_filter_id = chat_filter_id_
      } =
      "GetChatFilter"
        ++ U.cc
          [ U.p "chat_filter_id" chat_filter_id_
          ]

instance T.ToJSON GetChatFilter where
  toJSON
    GetChatFilter
      { chat_filter_id = chat_filter_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatFilter",
          "chat_filter_id" A..= chat_filter_id_
        ]
