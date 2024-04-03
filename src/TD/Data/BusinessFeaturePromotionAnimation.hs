module TD.Data.BusinessFeaturePromotionAnimation
  (BusinessFeaturePromotionAnimation(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessFeature as BusinessFeature
import qualified TD.Data.Animation as Animation

data BusinessFeaturePromotionAnimation
  = BusinessFeaturePromotionAnimation -- ^ Describes a promotion animation for a Business feature
    { feature   :: Maybe BusinessFeature.BusinessFeature -- ^ Business feature
    , animation :: Maybe Animation.Animation             -- ^ Promotion animation for the feature
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessFeaturePromotionAnimation where
  shortShow BusinessFeaturePromotionAnimation
    { feature   = feature_
    , animation = animation_
    }
      = "BusinessFeaturePromotionAnimation"
        ++ I.cc
        [ "feature"   `I.p` feature_
        , "animation" `I.p` animation_
        ]

instance AT.FromJSON BusinessFeaturePromotionAnimation where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessFeaturePromotionAnimation" -> parseBusinessFeaturePromotionAnimation v
      _                                   -> mempty
    
    where
      parseBusinessFeaturePromotionAnimation :: A.Value -> AT.Parser BusinessFeaturePromotionAnimation
      parseBusinessFeaturePromotionAnimation = A.withObject "BusinessFeaturePromotionAnimation" $ \o -> do
        feature_   <- o A..:?  "feature"
        animation_ <- o A..:?  "animation"
        pure $ BusinessFeaturePromotionAnimation
          { feature   = feature_
          , animation = animation_
          }
  parseJSON _ = mempty

