module TD.Query.GetPremiumFeatures
  (GetPremiumFeatures(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumSource as PremiumSource

-- | Returns information about features, available to Premium users. Returns 'TD.Data.PremiumFeatures.PremiumFeatures'
data GetPremiumFeatures
  = GetPremiumFeatures
    { source :: Maybe PremiumSource.PremiumSource -- ^ Source of the request; pass null if the method is called from some non-standard source
    }
  deriving (Eq, Show)

instance I.ShortShow GetPremiumFeatures where
  shortShow
    GetPremiumFeatures
      { source = source_
      }
        = "GetPremiumFeatures"
          ++ I.cc
          [ "source" `I.p` source_
          ]

instance AT.ToJSON GetPremiumFeatures where
  toJSON
    GetPremiumFeatures
      { source = source_
      }
        = A.object
          [ "@type"  A..= AT.String "getPremiumFeatures"
          , "source" A..= source_
          ]

