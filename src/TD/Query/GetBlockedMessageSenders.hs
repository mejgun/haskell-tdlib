{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBlockedMessageSenders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BlockList as BlockList
import qualified Utils as U

-- |
-- Returns users and chats that were blocked by the current user
data GetBlockedMessageSenders = GetBlockedMessageSenders
  { -- | The maximum number of users and chats to return; up to 100
    limit :: Maybe Int,
    -- | Number of users and chats to skip in the result; must be non-negative
    offset :: Maybe Int,
    -- | Block list from which to return users
    block_list :: Maybe BlockList.BlockList
  }
  deriving (Eq)

instance Show GetBlockedMessageSenders where
  show
    GetBlockedMessageSenders
      { limit = limit_,
        offset = offset_,
        block_list = block_list_
      } =
      "GetBlockedMessageSenders"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "block_list" block_list_
          ]

instance T.ToJSON GetBlockedMessageSenders where
  toJSON
    GetBlockedMessageSenders
      { limit = limit_,
        offset = offset_,
        block_list = block_list_
      } =
      A.object
        [ "@type" A..= T.String "getBlockedMessageSenders",
          "limit" A..= limit_,
          "offset" A..= offset_,
          "block_list" A..= block_list_
        ]
