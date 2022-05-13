{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStorageStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns storage usage statistics. Can be called before authorization @chat_limit The maximum number of chats with the largest storage usage for which separate statistics need to be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
data GetStorageStatistics = GetStorageStatistics
  { -- |
    chat_limit :: Maybe Int
  }
  deriving (Eq)

instance Show GetStorageStatistics where
  show
    GetStorageStatistics
      { chat_limit = chat_limit_
      } =
      "GetStorageStatistics"
        ++ U.cc
          [ U.p "chat_limit" chat_limit_
          ]

instance T.ToJSON GetStorageStatistics where
  toJSON
    GetStorageStatistics
      { chat_limit = chat_limit_
      } =
      A.object
        [ "@type" A..= T.String "getStorageStatistics",
          "chat_limit" A..= chat_limit_
        ]
