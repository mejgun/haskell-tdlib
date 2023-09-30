{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetTopChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TopChatCategory as TopChatCategory
import qualified Utils as U

-- |
-- Returns a list of frequently used chats @category Category of chats to be returned @limit The maximum number of chats to be returned; up to 30
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
      { limit = limit_,
        category = category_
      } =
      "GetTopChats"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "category" category_
          ]

instance T.ToJSON GetTopChats where
  toJSON
    GetTopChats
      { limit = limit_,
        category = category_
      } =
      A.object
        [ "@type" A..= T.String "getTopChats",
          "limit" A..= limit_,
          "category" A..= category_
        ]
