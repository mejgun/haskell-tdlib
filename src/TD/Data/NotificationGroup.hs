module TD.Data.NotificationGroup
  (NotificationGroup(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NotificationGroupType as NotificationGroupType
import qualified TD.Data.Notification as Notification

data NotificationGroup
  = NotificationGroup -- ^ Describes a group of notifications
    { _id           :: Maybe Int                                         -- ^ Unique persistent auto-incremented from 1 identifier of the notification group
    , _type         :: Maybe NotificationGroupType.NotificationGroupType -- ^ Type of the group
    , chat_id       :: Maybe Int                                         -- ^ Identifier of a chat to which all notifications in the group belong
    , total_count   :: Maybe Int                                         -- ^ Total number of active notifications in the group
    , notifications :: Maybe [Notification.Notification]                 -- ^ The list of active notifications
    }
  deriving (Eq, Show)

instance I.ShortShow NotificationGroup where
  shortShow NotificationGroup
    { _id           = _id_
    , _type         = _type_
    , chat_id       = chat_id_
    , total_count   = total_count_
    , notifications = notifications_
    }
      = "NotificationGroup"
        ++ I.cc
        [ "_id"           `I.p` _id_
        , "_type"         `I.p` _type_
        , "chat_id"       `I.p` chat_id_
        , "total_count"   `I.p` total_count_
        , "notifications" `I.p` notifications_
        ]

instance AT.FromJSON NotificationGroup where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "notificationGroup" -> parseNotificationGroup v
      _                   -> mempty
    
    where
      parseNotificationGroup :: A.Value -> AT.Parser NotificationGroup
      parseNotificationGroup = A.withObject "NotificationGroup" $ \o -> do
        _id_           <- o A..:?  "id"
        _type_         <- o A..:?  "type"
        chat_id_       <- o A..:?  "chat_id"
        total_count_   <- o A..:?  "total_count"
        notifications_ <- o A..:?  "notifications"
        pure $ NotificationGroup
          { _id           = _id_
          , _type         = _type_
          , chat_id       = chat_id_
          , total_count   = total_count_
          , notifications = notifications_
          }
  parseJSON _ = mempty

