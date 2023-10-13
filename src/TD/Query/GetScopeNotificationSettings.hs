module TD.Query.GetScopeNotificationSettings(GetScopeNotificationSettings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NotificationSettingsScope as NotificationSettingsScope

data GetScopeNotificationSettings -- ^ Returns the notification settings for chats of a given type
  = GetScopeNotificationSettings
    { scope :: Maybe NotificationSettingsScope.NotificationSettingsScope -- ^ Types of chats for which to return the notification settings information
    }
  deriving (Eq)

instance Show GetScopeNotificationSettings where
  show
    GetScopeNotificationSettings
      { scope = scope_
      }
        = "GetScopeNotificationSettings"
          ++ I.cc
          [ "scope" `I.p` scope_
          ]

instance AT.ToJSON GetScopeNotificationSettings where
  toJSON
    GetScopeNotificationSettings
      { scope = scope_
      }
        = A.object
          [ "@type" A..= AT.String "getScopeNotificationSettings"
          , "scope" A..= scope_
          ]
