{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.NotificationGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Notification as Notification
import qualified TD.Data.NotificationGroupType as NotificationGroupType
import qualified Utils as U

-- |
data NotificationGroup = -- | Describes a group of notifications
  NotificationGroup
  { -- | The list of active notifications
    notifications :: Maybe [Notification.Notification],
    -- | Total number of active notifications in the group
    total_count :: Maybe Int,
    -- | Identifier of a chat to which all notifications in the group belong
    chat_id :: Maybe Int,
    -- | Type of the group
    _type :: Maybe NotificationGroupType.NotificationGroupType,
    -- | Unique persistent auto-incremented from 1 identifier of the notification group
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show NotificationGroup where
  show
    NotificationGroup
      { notifications = notifications_,
        total_count = total_count_,
        chat_id = chat_id_,
        _type = _type_,
        _id = _id_
      } =
      "NotificationGroup"
        ++ U.cc
          [ U.p "notifications" notifications_,
            U.p "total_count" total_count_,
            U.p "chat_id" chat_id_,
            U.p "_type" _type_,
            U.p "_id" _id_
          ]

instance T.FromJSON NotificationGroup where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notificationGroup" -> parseNotificationGroup v
      _ -> mempty
    where
      parseNotificationGroup :: A.Value -> T.Parser NotificationGroup
      parseNotificationGroup = A.withObject "NotificationGroup" $ \o -> do
        notifications_ <- o A..:? "notifications"
        total_count_ <- o A..:? "total_count"
        chat_id_ <- o A..:? "chat_id"
        _type_ <- o A..:? "type"
        _id_ <- o A..:? "id"
        return $ NotificationGroup {notifications = notifications_, total_count = total_count_, chat_id = chat_id_, _type = _type_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON NotificationGroup where
  toJSON
    NotificationGroup
      { notifications = notifications_,
        total_count = total_count_,
        chat_id = chat_id_,
        _type = _type_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "notificationGroup",
          "notifications" A..= notifications_,
          "total_count" A..= total_count_,
          "chat_id" A..= chat_id_,
          "type" A..= _type_,
          "id" A..= _id_
        ]
