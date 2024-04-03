module TD.Query.SetBusinessOpeningHours
  (SetBusinessOpeningHours(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessOpeningHours as BusinessOpeningHours

-- | Changes the business opening hours of the current user. Requires Telegram Business subscription. Returns 'TD.Data.Ok.Ok'
data SetBusinessOpeningHours
  = SetBusinessOpeningHours
    { opening_hours :: Maybe BusinessOpeningHours.BusinessOpeningHours -- ^ The new opening hours of the business; pass null to remove the opening hours; up to 28 time intervals can be specified
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessOpeningHours where
  shortShow
    SetBusinessOpeningHours
      { opening_hours = opening_hours_
      }
        = "SetBusinessOpeningHours"
          ++ I.cc
          [ "opening_hours" `I.p` opening_hours_
          ]

instance AT.ToJSON SetBusinessOpeningHours where
  toJSON
    SetBusinessOpeningHours
      { opening_hours = opening_hours_
      }
        = A.object
          [ "@type"         A..= AT.String "setBusinessOpeningHours"
          , "opening_hours" A..= opening_hours_
          ]

