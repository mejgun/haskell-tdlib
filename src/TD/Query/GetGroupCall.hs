{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetGroupCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a group call @group_call_id Group call identifier
data GetGroupCall = GetGroupCall
  { -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetGroupCall where
  show
    GetGroupCall
      { group_call_id = group_call_id
      } =
      "GetGroupCall"
        ++ U.cc
          [ U.p "group_call_id" group_call_id
          ]

instance T.ToJSON GetGroupCall where
  toJSON
    GetGroupCall
      { group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "getGroupCall",
          "group_call_id" A..= group_call_id
        ]
