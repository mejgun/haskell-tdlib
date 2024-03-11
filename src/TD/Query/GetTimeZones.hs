module TD.Query.GetTimeZones
  (GetTimeZones(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of supported time zones. Returns 'TD.Data.TimeZones.TimeZones'
data GetTimeZones
  = GetTimeZones
  deriving (Eq, Show)

instance I.ShortShow GetTimeZones where
  shortShow
    GetTimeZones
        = "GetTimeZones"

instance AT.ToJSON GetTimeZones where
  toJSON
    GetTimeZones
        = A.object
          [ "@type" A..= AT.String "getTimeZones"
          ]

