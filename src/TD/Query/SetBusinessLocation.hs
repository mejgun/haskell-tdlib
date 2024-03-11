module TD.Query.SetBusinessLocation
  (SetBusinessLocation(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessLocation as BusinessLocation

-- | Changes the business location of the current user. Requires Telegram Business subscription. Returns 'TD.Data.Ok.Ok'
data SetBusinessLocation
  = SetBusinessLocation
    { location :: Maybe BusinessLocation.BusinessLocation -- ^ The new location of the business; pass null to remove the location
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessLocation where
  shortShow
    SetBusinessLocation
      { location = location_
      }
        = "SetBusinessLocation"
          ++ I.cc
          [ "location" `I.p` location_
          ]

instance AT.ToJSON SetBusinessLocation where
  toJSON
    SetBusinessLocation
      { location = location_
      }
        = A.object
          [ "@type"    A..= AT.String "setBusinessLocation"
          , "location" A..= location_
          ]

