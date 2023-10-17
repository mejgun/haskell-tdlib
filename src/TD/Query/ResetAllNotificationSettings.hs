module TD.Query.ResetAllNotificationSettings
  (ResetAllNotificationSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resets all notification settings to their default values. By default, all chats are unmuted and message previews are shown
data ResetAllNotificationSettings
  = ResetAllNotificationSettings
  deriving (Eq, Show)

instance I.ShortShow ResetAllNotificationSettings where
  shortShow
    ResetAllNotificationSettings
        = "ResetAllNotificationSettings"

instance AT.ToJSON ResetAllNotificationSettings where
  toJSON
    ResetAllNotificationSettings
        = A.object
          [ "@type" A..= AT.String "resetAllNotificationSettings"
          ]

