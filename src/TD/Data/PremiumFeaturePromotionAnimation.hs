{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumFeaturePromotionAnimation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.PremiumFeature as PremiumFeature
import qualified Utils as U

-- |
data PremiumFeaturePromotionAnimation = -- | Describes a promotion animation for a Premium feature @feature Premium feature @animation Promotion animation for the feature
  PremiumFeaturePromotionAnimation
  { -- |
    animation :: Maybe Animation.Animation,
    -- |
    feature :: Maybe PremiumFeature.PremiumFeature
  }
  deriving (Eq)

instance Show PremiumFeaturePromotionAnimation where
  show
    PremiumFeaturePromotionAnimation
      { animation = animation_,
        feature = feature_
      } =
      "PremiumFeaturePromotionAnimation"
        ++ U.cc
          [ U.p "animation" animation_,
            U.p "feature" feature_
          ]

instance T.FromJSON PremiumFeaturePromotionAnimation where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumFeaturePromotionAnimation" -> parsePremiumFeaturePromotionAnimation v
      _ -> mempty
    where
      parsePremiumFeaturePromotionAnimation :: A.Value -> T.Parser PremiumFeaturePromotionAnimation
      parsePremiumFeaturePromotionAnimation = A.withObject "PremiumFeaturePromotionAnimation" $ \o -> do
        animation_ <- o A..:? "animation"
        feature_ <- o A..:? "feature"
        return $ PremiumFeaturePromotionAnimation {animation = animation_, feature = feature_}
  parseJSON _ = mempty

instance T.ToJSON PremiumFeaturePromotionAnimation where
  toJSON
    PremiumFeaturePromotionAnimation
      { animation = animation_,
        feature = feature_
      } =
      A.object
        [ "@type" A..= T.String "premiumFeaturePromotionAnimation",
          "animation" A..= animation_,
          "feature" A..= feature_
        ]
