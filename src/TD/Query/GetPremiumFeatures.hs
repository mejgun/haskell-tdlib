module TD.Query.GetPremiumFeatures(GetPremiumFeatures(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumSource as PremiumSource

data GetPremiumFeatures -- ^ Returns information about features, available to Premium users
  = GetPremiumFeatures
    { source :: Maybe PremiumSource.PremiumSource -- ^ Source of the request; pass null if the method is called from some non-standard source
    }
  deriving (Eq)

instance Show GetPremiumFeatures where
  show
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
