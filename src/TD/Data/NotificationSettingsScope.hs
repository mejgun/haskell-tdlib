module TD.Data.NotificationSettingsScope where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data NotificationSettingsScope -- ^ Describes the types of chats to which notification settings are relevant
  = NotificationSettingsScopePrivateChats -- ^ Notification settings applied to all private and secret chats when the corresponding chat setting has a default value
  | NotificationSettingsScopeGroupChats -- ^ Notification settings applied to all basic group and supergroup chats when the corresponding chat setting has a default value
  | NotificationSettingsScopeChannelChats -- ^ Notification settings applied to all channel chats when the corresponding chat setting has a default value
  deriving (Eq)

instance Show NotificationSettingsScope where
  show NotificationSettingsScopePrivateChats
      = "NotificationSettingsScopePrivateChats"
  show NotificationSettingsScopeGroupChats
      = "NotificationSettingsScopeGroupChats"
  show NotificationSettingsScopeChannelChats
      = "NotificationSettingsScopeChannelChats"

instance AT.FromJSON NotificationSettingsScope where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "notificationSettingsScopePrivateChats" -> pure NotificationSettingsScopePrivateChats
      "notificationSettingsScopeGroupChats"   -> pure NotificationSettingsScopeGroupChats
      "notificationSettingsScopeChannelChats" -> pure NotificationSettingsScopeChannelChats
      _                                       -> mempty
    

instance AT.ToJSON NotificationSettingsScope where
  toJSON NotificationSettingsScopePrivateChats
      = A.object
        [ "@type" A..= AT.String "notificationSettingsScopePrivateChats"
        ]
  toJSON NotificationSettingsScopeGroupChats
      = A.object
        [ "@type" A..= AT.String "notificationSettingsScopeGroupChats"
        ]
  toJSON NotificationSettingsScopeChannelChats
      = A.object
        [ "@type" A..= AT.String "notificationSettingsScopeChannelChats"
        ]
