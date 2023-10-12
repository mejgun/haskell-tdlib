module TD.Query.GetStoryNotificationSettingsExceptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
