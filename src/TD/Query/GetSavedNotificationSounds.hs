module TD.Query.GetSavedNotificationSounds
  (GetSavedNotificationSounds(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

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

