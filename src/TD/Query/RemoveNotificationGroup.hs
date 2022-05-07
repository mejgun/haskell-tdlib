{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveNotificationGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user @notification_group_id Notification group identifier @max_notification_id The maximum identifier of removed notifications
data RemoveNotificationGroup = RemoveNotificationGroup
  { -- |
    max_notification_id :: Maybe Int,
    -- |
    notification_group_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveNotificationGroup where
  show
    RemoveNotificationGroup
      { max_notification_id = max_notification_id,
        notification_group_id = notification_group_id
      } =
      "RemoveNotificationGroup"
        ++ U.cc
          [ U.p "max_notification_id" max_notification_id,
            U.p "notification_group_id" notification_group_id
          ]

instance T.ToJSON RemoveNotificationGroup where
  toJSON
    RemoveNotificationGroup
      { max_notification_id = max_notification_id,
        notification_group_id = notification_group_id
      } =
      A.object
        [ "@type" A..= T.String "removeNotificationGroup",
          "max_notification_id" A..= max_notification_id,
          "notification_group_id" A..= notification_group_id
        ]
