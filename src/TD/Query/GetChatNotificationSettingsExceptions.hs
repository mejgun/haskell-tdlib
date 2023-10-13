module TD.Query.GetChatNotificationSettingsExceptions(GetChatNotificationSettingsExceptions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NotificationSettingsScope as NotificationSettingsScope

data GetChatNotificationSettingsExceptions -- ^ Returns list of chats with non-default notification settings for new messages
  = GetChatNotificationSettingsExceptions
    { scope         :: Maybe NotificationSettingsScope.NotificationSettingsScope -- ^ If specified, only chats from the scope will be returned; pass null to return chats from all scopes
    , compare_sound :: Maybe Bool                                                -- ^ Pass true to include in the response chats with only non-default sound
    }
  deriving (Eq)

instance Show GetChatNotificationSettingsExceptions where
  show
    GetChatNotificationSettingsExceptions
      { scope         = scope_
      , compare_sound = compare_sound_
      }
        = "GetChatNotificationSettingsExceptions"
          ++ I.cc
          [ "scope"         `I.p` scope_
          , "compare_sound" `I.p` compare_sound_
          ]

instance AT.ToJSON GetChatNotificationSettingsExceptions where
  toJSON
    GetChatNotificationSettingsExceptions
      { scope         = scope_
      , compare_sound = compare_sound_
      }
        = A.object
          [ "@type"         A..= AT.String "getChatNotificationSettingsExceptions"
          , "scope"         A..= scope_
          , "compare_sound" A..= compare_sound_
          ]
