{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EndGroupCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Ends a group call. Requires groupCall.can_be_managed @group_call_id Group call identifier
data EndGroupCall = EndGroupCall
  { -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show EndGroupCall where
  show
    EndGroupCall
      { group_call_id = group_call_id
      } =
      "EndGroupCall"
        ++ U.cc
          [ U.p "group_call_id" group_call_id
          ]

instance T.ToJSON EndGroupCall where
  toJSON
    EndGroupCall
      { group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "endGroupCall",
          "group_call_id" A..= group_call_id
        ]
