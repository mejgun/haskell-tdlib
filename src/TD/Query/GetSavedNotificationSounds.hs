module TD.Query.GetSavedNotificationSounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetSavedNotificationSounds -- ^ Returns list of saved notification sounds. If a sound isn't in the list, then default sound needs to be used
  = GetSavedNotificationSounds
  deriving (Eq)

instance Show GetSavedNotificationSounds where
  show
    GetSavedNotificationSounds
        = "GetSavedNotificationSounds"

instance AT.ToJSON GetSavedNotificationSounds where
  toJSON
    GetSavedNotificationSounds
        = A.object
          [ "@type" A..= AT.String "getSavedNotificationSounds"
          ]
