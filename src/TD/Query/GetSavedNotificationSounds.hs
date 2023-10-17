module TD.Query.GetSavedNotificationSounds
  (GetSavedNotificationSounds(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns list of saved notification sounds. If a sound isn't in the list, then default sound needs to be used
data GetSavedNotificationSounds
  = GetSavedNotificationSounds
  deriving (Eq, Show)

instance I.ShortShow GetSavedNotificationSounds where
  shortShow
    GetSavedNotificationSounds
        = "GetSavedNotificationSounds"

instance AT.ToJSON GetSavedNotificationSounds where
  toJSON
    GetSavedNotificationSounds
        = A.object
          [ "@type" A..= AT.String "getSavedNotificationSounds"
          ]

