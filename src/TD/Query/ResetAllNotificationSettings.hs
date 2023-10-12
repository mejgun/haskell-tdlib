module TD.Query.ResetAllNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ResetAllNotificationSettings -- ^ Resets all notification settings to their default values. By default, all chats are unmuted and message previews are shown
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
