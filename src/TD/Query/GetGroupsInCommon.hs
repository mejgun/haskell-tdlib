{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetGroupsInCommon where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a list of common group chats with a given user. Chats are sorted by their type and creation date
data GetGroupsInCommon = GetGroupsInCommon
  { -- | The maximum number of chats to be returned; up to 100
    limit :: Maybe Int,
    -- | Chat identifier starting from which to return chats; use 0 for the first request
    offset_chat_id :: Maybe Int,
    -- | User identifier
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetGroupsInCommon where
  show
    GetGroupsInCommon
      { limit = limit_,
        offset_chat_id = offset_chat_id_,
        user_id = user_id_
      } =
      "GetGroupsInCommon"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset_chat_id" offset_chat_id_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON GetGroupsInCommon where
  toJSON
    GetGroupsInCommon
      { limit = limit_,
        offset_chat_id = offset_chat_id_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "getGroupsInCommon",
          "limit" A..= limit_,
          "offset_chat_id" A..= offset_chat_id_,
          "user_id" A..= user_id_
        ]
