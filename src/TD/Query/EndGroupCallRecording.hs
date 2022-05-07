{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EndGroupCallRecording where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Ends recording of an active group call. Requires groupCall.can_be_managed group call flag @group_call_id Group call identifier
data EndGroupCallRecording = EndGroupCallRecording
  { -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show EndGroupCallRecording where
  show
    EndGroupCallRecording
      { group_call_id = group_call_id
      } =
      "EndGroupCallRecording"
        ++ U.cc
          [ U.p "group_call_id" group_call_id
          ]

instance T.ToJSON EndGroupCallRecording where
  toJSON
    EndGroupCallRecording
      { group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "endGroupCallRecording",
          "group_call_id" A..= group_call_id
        ]
