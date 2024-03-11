module TD.Query.SetBusinessAwayMessageSettings
  (SetBusinessAwayMessageSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessAwayMessageSettings as BusinessAwayMessageSettings

-- | Changes the business away message settings of the current user. Requires Telegram Business subscription. Returns 'TD.Data.Ok.Ok'
data SetBusinessAwayMessageSettings
  = SetBusinessAwayMessageSettings
    { away_message_settings :: Maybe BusinessAwayMessageSettings.BusinessAwayMessageSettings -- ^ The new settings for the away message of the business; pass null to disable the away message
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessAwayMessageSettings where
  shortShow
    SetBusinessAwayMessageSettings
      { away_message_settings = away_message_settings_
      }
        = "SetBusinessAwayMessageSettings"
          ++ I.cc
          [ "away_message_settings" `I.p` away_message_settings_
          ]

instance AT.ToJSON SetBusinessAwayMessageSettings where
  toJSON
    SetBusinessAwayMessageSettings
      { away_message_settings = away_message_settings_
      }
        = A.object
          [ "@type"                 A..= AT.String "setBusinessAwayMessageSettings"
          , "away_message_settings" A..= away_message_settings_
          ]

