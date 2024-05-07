module TD.Query.SetReactionNotificationSettings
  (SetReactionNotificationSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionNotificationSettings as ReactionNotificationSettings

-- | Changes notification settings for reactions. Returns 'TD.Data.Ok.Ok'
data SetReactionNotificationSettings
  = SetReactionNotificationSettings
    { notification_settings :: Maybe ReactionNotificationSettings.ReactionNotificationSettings -- ^ The new notification settings for reactions
    }
  deriving (Eq, Show)

instance I.ShortShow SetReactionNotificationSettings where
  shortShow
    SetReactionNotificationSettings
      { notification_settings = notification_settings_
      }
        = "SetReactionNotificationSettings"
          ++ I.cc
          [ "notification_settings" `I.p` notification_settings_
          ]

instance AT.ToJSON SetReactionNotificationSettings where
  toJSON
    SetReactionNotificationSettings
      { notification_settings = notification_settings_
      }
        = A.object
          [ "@type"                 A..= AT.String "setReactionNotificationSettings"
          , "notification_settings" A..= notification_settings_
          ]

