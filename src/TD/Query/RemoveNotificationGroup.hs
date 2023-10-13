module TD.Query.RemoveNotificationGroup(RemoveNotificationGroup(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data RemoveNotificationGroup -- ^ Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user
  = RemoveNotificationGroup
    { notification_group_id :: Maybe Int -- ^ Notification group identifier
    , max_notification_id   :: Maybe Int -- ^ The maximum identifier of removed notifications
    }
  deriving (Eq)

instance Show RemoveNotificationGroup where
  show
    RemoveNotificationGroup
      { notification_group_id = notification_group_id_
      , max_notification_id   = max_notification_id_
      }
        = "RemoveNotificationGroup"
          ++ I.cc
          [ "notification_group_id" `I.p` notification_group_id_
          , "max_notification_id"   `I.p` max_notification_id_
          ]

instance AT.ToJSON RemoveNotificationGroup where
  toJSON
    RemoveNotificationGroup
      { notification_group_id = notification_group_id_
      , max_notification_id   = max_notification_id_
      }
        = A.object
          [ "@type"                 A..= AT.String "removeNotificationGroup"
          , "notification_group_id" A..= notification_group_id_
          , "max_notification_id"   A..= max_notification_id_
          ]
