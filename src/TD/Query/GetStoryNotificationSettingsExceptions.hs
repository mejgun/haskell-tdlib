module TD.Query.GetStoryNotificationSettingsExceptions
  (GetStoryNotificationSettingsExceptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of chats with non-default notification settings for stories. Returns 'TD.Data.Chats.Chats'
data GetStoryNotificationSettingsExceptions
  = GetStoryNotificationSettingsExceptions
  deriving (Eq, Show)

instance I.ShortShow GetStoryNotificationSettingsExceptions where
  shortShow
    GetStoryNotificationSettingsExceptions
        = "GetStoryNotificationSettingsExceptions"

instance AT.ToJSON GetStoryNotificationSettingsExceptions where
  toJSON
    GetStoryNotificationSettingsExceptions
        = A.object
          [ "@type" A..= AT.String "getStoryNotificationSettingsExceptions"
          ]

