module TD.Query.GetTonRevenueStatistics
  (GetTonRevenueStatistics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns detailed Toncoin revenue statistics of the current user. Returns 'TD.Data.TonRevenueStatistics.TonRevenueStatistics'
data GetTonRevenueStatistics
  = GetTonRevenueStatistics
    { is_dark :: Maybe Bool -- ^ Pass true if a dark theme is used by the application
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonRevenueStatistics where
  shortShow
    GetTonRevenueStatistics
      { is_dark = is_dark_
      }
        = "GetTonRevenueStatistics"
          ++ I.cc
          [ "is_dark" `I.p` is_dark_
          ]

instance AT.ToJSON GetTonRevenueStatistics where
  toJSON
    GetTonRevenueStatistics
      { is_dark = is_dark_
      }
        = A.object
          [ "@type"   A..= AT.String "getTonRevenueStatistics"
          , "is_dark" A..= is_dark_
          ]

