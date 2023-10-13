module TD.Query.GetNetworkStatistics
  (GetNetworkStatistics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetNetworkStatistics -- ^ Returns network data usage statistics. Can be called before authorization
  = GetNetworkStatistics
    { only_current :: Maybe Bool -- ^ Pass true to get statistics only for the current library launch
    }
  deriving (Eq)

instance Show GetNetworkStatistics where
  show
    GetNetworkStatistics
      { only_current = only_current_
      }
        = "GetNetworkStatistics"
          ++ I.cc
          [ "only_current" `I.p` only_current_
          ]

instance AT.ToJSON GetNetworkStatistics where
  toJSON
    GetNetworkStatistics
      { only_current = only_current_
      }
        = A.object
          [ "@type"        A..= AT.String "getNetworkStatistics"
          , "only_current" A..= only_current_
          ]

