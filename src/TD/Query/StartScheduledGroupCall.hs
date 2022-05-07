{-# LANGUAGE OverloadedStrings #-}

module TD.Query.StartScheduledGroupCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Starts a scheduled group call @group_call_id Group call identifier
data StartScheduledGroupCall = StartScheduledGroupCall
  { -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show StartScheduledGroupCall where
  show
    StartScheduledGroupCall
      { group_call_id = group_call_id
      } =
      "StartScheduledGroupCall"
        ++ U.cc
          [ U.p "group_call_id" group_call_id
          ]

instance T.ToJSON StartScheduledGroupCall where
  toJSON
    StartScheduledGroupCall
      { group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "startScheduledGroupCall",
          "group_call_id" A..= group_call_id
        ]
