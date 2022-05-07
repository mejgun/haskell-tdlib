{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetTopChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.TopChatCategory as TopChatCategory
import qualified Utils as U

-- |
-- Returns a list of frequently used chats. Supported only if the chat info database is enabled @category Category of chats to be returned @limit The maximum number of chats to be returned; up to 30
data GetTopChats = GetTopChats
  { -- |
    limit :: Maybe Int,
    -- |
    category :: Maybe TopChatCategory.TopChatCategory
  }
  deriving (Eq)

instance Show GetTopChats where
  show
    GetTopChats
      { limit = limit,
        category = category
      } =
      "GetTopChats"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "category" category
          ]

instance T.ToJSON GetTopChats where
  toJSON
    GetTopChats
      { limit = limit,
        category = category
      } =
      A.object
        [ "@type" A..= T.String "getTopChats",
          "limit" A..= limit,
          "category" A..= category
        ]
