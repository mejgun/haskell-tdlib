{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBlockedMessageSenders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns users and chats that were blocked by the current user @offset Number of users and chats to skip in the result; must be non-negative @limit The maximum number of users and chats to return; up to 100
data GetBlockedMessageSenders = GetBlockedMessageSenders
  { -- |
    limit :: Maybe Int,
    -- |
    offset :: Maybe Int
  }
  deriving (Eq)

instance Show GetBlockedMessageSenders where
  show
    GetBlockedMessageSenders
      { limit = limit_,
        offset = offset_
      } =
      "GetBlockedMessageSenders"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_
          ]

instance T.ToJSON GetBlockedMessageSenders where
  toJSON
    GetBlockedMessageSenders
      { limit = limit_,
        offset = offset_
      } =
      A.object
        [ "@type" A..= T.String "getBlockedMessageSenders",
          "limit" A..= limit_,
          "offset" A..= offset_
        ]
