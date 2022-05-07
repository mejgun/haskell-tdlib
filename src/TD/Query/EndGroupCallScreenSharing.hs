{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EndGroupCallScreenSharing where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Ends screen sharing in a joined group call @group_call_id Group call identifier
data EndGroupCallScreenSharing = EndGroupCallScreenSharing
  { -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show EndGroupCallScreenSharing where
  show
    EndGroupCallScreenSharing
      { group_call_id = group_call_id
      } =
      "EndGroupCallScreenSharing"
        ++ U.cc
          [ U.p "group_call_id" group_call_id
          ]

instance T.ToJSON EndGroupCallScreenSharing where
  toJSON
    EndGroupCallScreenSharing
      { group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "endGroupCallScreenSharing",
          "group_call_id" A..= group_call_id
        ]
