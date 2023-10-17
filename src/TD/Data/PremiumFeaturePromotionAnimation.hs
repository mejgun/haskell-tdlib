module TD.Data.PremiumFeaturePromotionAnimation
  (PremiumFeaturePromotionAnimation(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumFeature as PremiumFeature
import qualified TD.Data.Animation as Animation

data PremiumFeaturePromotionAnimation
  = PremiumFeaturePromotionAnimation -- ^ Describes a promotion animation for a Premium feature
    { feature   :: Maybe PremiumFeature.PremiumFeature -- ^ Premium feature
    , animation :: Maybe Animation.Animation           -- ^ Promotion animation for the feature
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumFeaturePromotionAnimation where
  shortShow PremiumFeaturePromotionAnimation
    { feature   = feature_
    , animation = animation_
    }
      = "PremiumFeaturePromotionAnimation"
        ++ I.cc
        [ "feature"   `I.p` feature_
        , "animation" `I.p` animation_
        ]

instance AT.FromJSON PremiumFeaturePromotionAnimation where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumFeaturePromotionAnimation" -> parsePremiumFeaturePromotionAnimation v
      _                                  -> mempty
    
    where
      parsePremiumFeaturePromotionAnimation :: A.Value -> AT.Parser PremiumFeaturePromotionAnimation
      parsePremiumFeaturePromotionAnimation = A.withObject "PremiumFeaturePromotionAnimation" $ \o -> do
        feature_   <- o A..:?  "feature"
        animation_ <- o A..:?  "animation"
        pure $ PremiumFeaturePromotionAnimation
          { feature   = feature_
          , animation = animation_
          }
  parseJSON _ = mempty

