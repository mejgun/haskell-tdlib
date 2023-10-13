module TD.Query.SetLocation
  (SetLocation(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location

-- | Changes the location of the current user. Needs to be called if getOption("is_location_visible") is true and location changes for more than 1 kilometer
data SetLocation
  = SetLocation
    { location :: Maybe Location.Location -- ^ The new location of the user
    }
  deriving (Eq)

instance Show SetLocation where
  show
    SetLocation
      { location = location_
      }
        = "SetLocation"
          ++ I.cc
          [ "location" `I.p` location_
          ]

instance AT.ToJSON SetLocation where
  toJSON
    SetLocation
      { location = location_
      }
        = A.object
          [ "@type"    A..= AT.String "setLocation"
          , "location" A..= location_
          ]

