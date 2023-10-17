module TD.Data.NotificationGroupType
  (NotificationGroupType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the type of notifications in a notification group
data NotificationGroupType
  = NotificationGroupTypeMessages -- ^ A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with ordinary unread messages
  | NotificationGroupTypeMentions -- ^ A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with unread mentions of the current user, replies to their messages, or a pinned message
  | NotificationGroupTypeSecretChat -- ^ A group containing a notification of type notificationTypeNewSecretChat
  | NotificationGroupTypeCalls -- ^ A group containing notifications of type notificationTypeNewCall
  deriving (Eq, Show)

instance I.ShortShow NotificationGroupType where
  shortShow NotificationGroupTypeMessages
      = "NotificationGroupTypeMessages"
  shortShow NotificationGroupTypeMentions
      = "NotificationGroupTypeMentions"
  shortShow NotificationGroupTypeSecretChat
      = "NotificationGroupTypeSecretChat"
  shortShow NotificationGroupTypeCalls
      = "NotificationGroupTypeCalls"

instance AT.FromJSON NotificationGroupType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "notificationGroupTypeMessages"   -> pure NotificationGroupTypeMessages
      "notificationGroupTypeMentions"   -> pure NotificationGroupTypeMentions
      "notificationGroupTypeSecretChat" -> pure NotificationGroupTypeSecretChat
      "notificationGroupTypeCalls"      -> pure NotificationGroupTypeCalls
      _                                 -> mempty
    
  parseJSON _ = mempty

