module TD.Query.GetBusinessFeatures
  (GetBusinessFeatures(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessFeature as BusinessFeature

-- | Returns information about features, available to Business users. Returns 'TD.Data.BusinessFeatures.BusinessFeatures'
data GetBusinessFeatures
  = GetBusinessFeatures
    { source :: Maybe BusinessFeature.BusinessFeature -- ^ Source of the request; pass null if the method is called from settings or some non-standard source
    }
  deriving (Eq, Show)

instance I.ShortShow GetBusinessFeatures where
  shortShow
    GetBusinessFeatures
      { source = source_
      }
        = "GetBusinessFeatures"
          ++ I.cc
          [ "source" `I.p` source_
          ]

instance AT.ToJSON GetBusinessFeatures where
  toJSON
    GetBusinessFeatures
      { source = source_
      }
        = A.object
          [ "@type"  A..= AT.String "getBusinessFeatures"
          , "source" A..= source_
          ]

