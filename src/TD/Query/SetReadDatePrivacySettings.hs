module TD.Query.SetReadDatePrivacySettings
  (SetReadDatePrivacySettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReadDatePrivacySettings as ReadDatePrivacySettings

-- | Changes privacy settings for message read date. Returns 'TD.Data.Ok.Ok'
data SetReadDatePrivacySettings
  = SetReadDatePrivacySettings
    { settings :: Maybe ReadDatePrivacySettings.ReadDatePrivacySettings -- ^ New settings
    }
  deriving (Eq, Show)

instance I.ShortShow SetReadDatePrivacySettings where
  shortShow
    SetReadDatePrivacySettings
      { settings = settings_
      }
        = "SetReadDatePrivacySettings"
          ++ I.cc
          [ "settings" `I.p` settings_
          ]

instance AT.ToJSON SetReadDatePrivacySettings where
  toJSON
    SetReadDatePrivacySettings
      { settings = settings_
      }
        = A.object
          [ "@type"    A..= AT.String "setReadDatePrivacySettings"
          , "settings" A..= settings_
          ]

