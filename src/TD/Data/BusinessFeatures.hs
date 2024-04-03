module TD.Data.BusinessFeatures
  (BusinessFeatures(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessFeature as BusinessFeature

data BusinessFeatures
  = BusinessFeatures -- ^ Contains information about features, available to Business user accounts
    { features :: Maybe [BusinessFeature.BusinessFeature] -- ^ The list of available business features
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessFeatures where
  shortShow BusinessFeatures
    { features = features_
    }
      = "BusinessFeatures"
        ++ I.cc
        [ "features" `I.p` features_
        ]

instance AT.FromJSON BusinessFeatures where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessFeatures" -> parseBusinessFeatures v
      _                  -> mempty
    
    where
      parseBusinessFeatures :: A.Value -> AT.Parser BusinessFeatures
      parseBusinessFeatures = A.withObject "BusinessFeatures" $ \o -> do
        features_ <- o A..:?  "features"
        pure $ BusinessFeatures
          { features = features_
          }
  parseJSON _ = mempty

