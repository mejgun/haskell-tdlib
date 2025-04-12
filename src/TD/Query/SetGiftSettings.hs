module TD.Query.SetGiftSettings
  (SetGiftSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiftSettings as GiftSettings

-- | Changes settings for gift receiving for the current user. Returns 'TD.Data.Ok.Ok'
data SetGiftSettings
  = SetGiftSettings
    { settings :: Maybe GiftSettings.GiftSettings -- ^ The new settings
    }
  deriving (Eq, Show)

instance I.ShortShow SetGiftSettings where
  shortShow
    SetGiftSettings
      { settings = settings_
      }
        = "SetGiftSettings"
          ++ I.cc
          [ "settings" `I.p` settings_
          ]

instance AT.ToJSON SetGiftSettings where
  toJSON
    SetGiftSettings
      { settings = settings_
      }
        = A.object
          [ "@type"    A..= AT.String "setGiftSettings"
          , "settings" A..= settings_
          ]

