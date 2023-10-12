module TD.Data.NotificationGroupType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data NotificationGroupType -- ^ Describes the type of notifications in a notification group
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
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "notificationGroupTypeMessages"   -> pure NotificationGroupTypeMessages
      "notificationGroupTypeMentions"   -> pure NotificationGroupTypeMentions
      "notificationGroupTypeSecretChat" -> pure NotificationGroupTypeSecretChat
      "notificationGroupTypeCalls"      -> pure NotificationGroupTypeCalls
      _                                 -> mempty
    

instance AT.ToJSON NotificationGroupType where
  toJSON NotificationGroupTypeMessages
      = A.object
        [ "@type" A..= AT.String "notificationGroupTypeMessages"
        ]
  toJSON NotificationGroupTypeMentions
      = A.object
        [ "@type" A..= AT.String "notificationGroupTypeMentions"
        ]
  toJSON NotificationGroupTypeSecretChat
      = A.object
        [ "@type" A..= AT.String "notificationGroupTypeSecretChat"
        ]
  toJSON NotificationGroupTypeCalls
      = A.object
        [ "@type" A..= AT.String "notificationGroupTypeCalls"
        ]
