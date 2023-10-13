module TD.Data.NotificationGroupType
  (NotificationGroupType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Describes the type of notifications in a notification group
data NotificationGroupType
  = NotificationGroupTypeMessages -- ^ A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with ordinary unread messages
  | NotificationGroupTypeMentions -- ^ A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with unread mentions of the current user, replies to their messages, or a pinned message
  | NotificationGroupTypeSecretChat -- ^ A group containing a notification of type notificationTypeNewSecretChat
  | NotificationGroupTypeCalls -- ^ A group containing notifications of type notificationTypeNewCall
  deriving (Eq)

instance Show NotificationGroupType where
  show NotificationGroupTypeMessages
      = "NotificationGroupTypeMessages"
  show NotificationGroupTypeMentions
      = "NotificationGroupTypeMentions"
  show NotificationGroupTypeSecretChat
      = "NotificationGroupTypeSecretChat"
  show NotificationGroupTypeCalls
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

