{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleGroupCallScreenSharingIsPaused where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Pauses or unpauses screen sharing in a joined group call @group_call_id Group call identifier @is_paused True, if screen sharing is paused
data ToggleGroupCallScreenSharingIsPaused = ToggleGroupCallScreenSharingIsPaused
  { -- |
    is_paused :: Maybe Bool,
    -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGroupCallScreenSharingIsPaused where
  show
    ToggleGroupCallScreenSharingIsPaused
      { is_paused = is_paused_,
        group_call_id = group_call_id_
      } =
      "ToggleGroupCallScreenSharingIsPaused"
        ++ U.cc
          [ U.p "is_paused" is_paused_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON ToggleGroupCallScreenSharingIsPaused where
  toJSON
    ToggleGroupCallScreenSharingIsPaused
      { is_paused = is_paused_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleGroupCallScreenSharingIsPaused",
          "is_paused" A..= is_paused_,
          "group_call_id" A..= group_call_id_
        ]
