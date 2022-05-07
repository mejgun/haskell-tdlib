{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.NotificationGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Notification as Notification
import qualified TD.Reply.NotificationGroupType as NotificationGroupType
import qualified Utils as U

data NotificationGroup = -- | Describes a group of notifications @id Unique persistent auto-incremented from 1 identifier of the notification group @type Type of the group
  NotificationGroup
  { -- |
    notifications :: Maybe [Notification.Notification],
    -- | Total number of active notifications in the group @notifications The list of active notifications
    total_count :: Maybe Int,
    -- | Identifier of a chat to which all notifications in the group belong
    chat_id :: Maybe Int,
    -- |
    _type :: Maybe NotificationGroupType.NotificationGroupType,
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show NotificationGroup where
  show
    NotificationGroup
      { notifications = notifications,
        total_count = total_count,
        chat_id = chat_id,
        _type = _type,
        _id = _id
      } =
      "NotificationGroup"
        ++ U.cc
          [ U.p "notifications" notifications,
            U.p "total_count" total_count,
            U.p "chat_id" chat_id,
            U.p "_type" _type,
            U.p "_id" _id
          ]

instance T.FromJSON NotificationGroup where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notificationGroup" -> parseNotificationGroup v
      _ -> fail ""
    where
      parseNotificationGroup :: A.Value -> T.Parser NotificationGroup
      parseNotificationGroup = A.withObject "NotificationGroup" $ \o -> do
        notifications_ <- o A..:? "notifications"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _type_ <- o A..:? "type"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ NotificationGroup {notifications = notifications_, total_count = total_count_, chat_id = chat_id_, _type = _type_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON NotificationGroup where
  toJSON
    NotificationGroup
      { notifications = notifications,
        total_count = total_count,
        chat_id = chat_id,
        _type = _type,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "notificationGroup",
          "notifications" A..= notifications,
          "total_count" A..= total_count,
          "chat_id" A..= chat_id,
          "type" A..= _type,
          "id" A..= _id
        ]
