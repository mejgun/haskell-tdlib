module TD.Query.ResetAllNotificationSettings
  (ResetAllNotificationSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resets all chat and scope notification settings to their default values. By default, all chats are unmuted and message previews are shown. Returns 'TD.Data.Ok.Ok'
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

