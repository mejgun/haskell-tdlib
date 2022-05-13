{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RemoveNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes an active notification from notification list. Needs to be called only if the notification is removed by the current user @notification_group_id Identifier of notification group to which the notification belongs @notification_id Identifier of removed notification
data RemoveNotification = RemoveNotification
  { -- |
    notification_id :: Maybe Int,
    -- |
    notification_group_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveNotification where
  show
    RemoveNotification
      { notification_id = notification_id_,
        notification_group_id = notification_group_id_
      } =
      "RemoveNotification"
        ++ U.cc
          [ U.p "notification_id" notification_id_,
            U.p "notification_group_id" notification_group_id_
          ]

instance T.ToJSON RemoveNotification where
  toJSON
    RemoveNotification
      { notification_id = notification_id_,
        notification_group_id = notification_group_id_
      } =
      A.object
        [ "@type" A..= T.String "removeNotification",
          "notification_id" A..= notification_id_,
          "notification_group_id" A..= notification_group_id_
        ]
