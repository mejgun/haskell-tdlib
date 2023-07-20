{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetRecentlyOpenedChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns recently opened chats; this is an offline request. Returns chats in the order of last opening @limit The maximum number of chats to be returned
data GetRecentlyOpenedChats = GetRecentlyOpenedChats
  { -- |
    limit :: Maybe Int
  }
  deriving (Eq)

instance Show GetRecentlyOpenedChats where
  show
    GetRecentlyOpenedChats
      { limit = limit_
      } =
      "GetRecentlyOpenedChats"
        ++ U.cc
          [ U.p "limit" limit_
          ]

instance T.ToJSON GetRecentlyOpenedChats where
  toJSON
    GetRecentlyOpenedChats
      { limit = limit_
      } =
      A.object
        [ "@type" A..= T.String "getRecentlyOpenedChats",
          "limit" A..= limit_
        ]
