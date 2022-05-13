{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.LeaveGroupCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Leaves a group call @group_call_id Group call identifier
data LeaveGroupCall = LeaveGroupCall
  { -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show LeaveGroupCall where
  show
    LeaveGroupCall
      { group_call_id = group_call_id_
      } =
      "LeaveGroupCall"
        ++ U.cc
          [ U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON LeaveGroupCall where
  toJSON
    LeaveGroupCall
      { group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "leaveGroupCall",
          "group_call_id" A..= group_call_id_
        ]
