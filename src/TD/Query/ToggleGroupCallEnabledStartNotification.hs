{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleGroupCallEnabledStartNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether the current user will receive a notification when the group call will start; scheduled group calls only
data ToggleGroupCallEnabledStartNotification = ToggleGroupCallEnabledStartNotification
  { -- |
    enabled_start_notification :: Maybe Bool,
    -- | Group call identifier @enabled_start_notification New value of the enabled_start_notification setting
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGroupCallEnabledStartNotification where
  show
    ToggleGroupCallEnabledStartNotification
      { enabled_start_notification = enabled_start_notification_,
        group_call_id = group_call_id_
      } =
      "ToggleGroupCallEnabledStartNotification"
        ++ U.cc
          [ U.p "enabled_start_notification" enabled_start_notification_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON ToggleGroupCallEnabledStartNotification where
  toJSON
    ToggleGroupCallEnabledStartNotification
      { enabled_start_notification = enabled_start_notification_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleGroupCallEnabledStartNotification",
          "enabled_start_notification" A..= enabled_start_notification_,
          "group_call_id" A..= group_call_id_
        ]
