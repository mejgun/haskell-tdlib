module TD.Query.ResetAllNotificationSettings
  (ResetAllNotificationSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Resets all notification settings to their default values. By default, all chats are unmuted and message previews are shown
data ResetAllNotificationSettings
  = ResetAllNotificationSettings
  deriving (Eq)

instance Show ResetAllNotificationSettings where
  show
    ResetAllNotificationSettings
        = "ResetAllNotificationSettings"

instance AT.ToJSON ResetAllNotificationSettings where
  toJSON
    ResetAllNotificationSettings
        = A.object
          [ "@type" A..= AT.String "resetAllNotificationSettings"
          ]

