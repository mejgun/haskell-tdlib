module TD.Query.GetGramRevenueStatistics
  (GetGramRevenueStatistics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns detailed TON Gram revenue statistics of the current user. Returns 'TD.Data.GramRevenueStatistics.GramRevenueStatistics'
data GetGramRevenueStatistics
  = GetGramRevenueStatistics
    { is_dark :: Maybe Bool -- ^ Pass true if a dark theme is used by the application
    }
  deriving (Eq, Show)

instance I.ShortShow GetGramRevenueStatistics where
  shortShow
    GetGramRevenueStatistics
      { is_dark = is_dark_
      }
        = "GetGramRevenueStatistics"
          ++ I.cc
          [ "is_dark" `I.p` is_dark_
          ]

instance AT.ToJSON GetGramRevenueStatistics where
  toJSON
    GetGramRevenueStatistics
      { is_dark = is_dark_
      }
        = A.object
          [ "@type"   A..= AT.String "getGramRevenueStatistics"
          , "is_dark" A..= is_dark_
          ]

