module TD.Query.GetStoryNotificationSettingsExceptions
  (GetStoryNotificationSettingsExceptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetStoryNotificationSettingsExceptions -- ^ Returns list of chats with non-default notification settings for stories
  = GetStoryNotificationSettingsExceptions
  deriving (Eq)

instance Show GetStoryNotificationSettingsExceptions where
  show
    GetStoryNotificationSettingsExceptions
        = "GetStoryNotificationSettingsExceptions"

instance AT.ToJSON GetStoryNotificationSettingsExceptions where
  toJSON
    GetStoryNotificationSettingsExceptions
        = A.object
          [ "@type" A..= AT.String "getStoryNotificationSettingsExceptions"
          ]

