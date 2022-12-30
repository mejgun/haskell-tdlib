{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumFeatures where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified TD.Data.PremiumFeature as PremiumFeature
import qualified TD.Data.PremiumLimit as PremiumLimit
import qualified Utils as U

-- |
data PremiumFeatures = -- | Contains information about features, available to Premium users
  PremiumFeatures
  { -- | An internal link to be opened to pay for Telegram Premium if store payment isn't possible; may be null if direct payment isn't available
    payment_link :: Maybe InternalLinkType.InternalLinkType,
    -- | The list of limits, increased for Premium users
    limits :: Maybe [PremiumLimit.PremiumLimit],
    -- | The list of available features
    features :: Maybe [PremiumFeature.PremiumFeature]
  }
  deriving (Eq)

instance Show PremiumFeatures where
  show
    PremiumFeatures
      { payment_link = payment_link_,
        limits = limits_,
        features = features_
      } =
      "PremiumFeatures"
        ++ U.cc
          [ U.p "payment_link" payment_link_,
            U.p "limits" limits_,
            U.p "features" features_
          ]

instance T.FromJSON PremiumFeatures where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumFeatures" -> parsePremiumFeatures v
      _ -> mempty
    where
      parsePremiumFeatures :: A.Value -> T.Parser PremiumFeatures
      parsePremiumFeatures = A.withObject "PremiumFeatures" $ \o -> do
        payment_link_ <- o A..:? "payment_link"
        limits_ <- o A..:? "limits"
        features_ <- o A..:? "features"
        return $ PremiumFeatures {payment_link = payment_link_, limits = limits_, features = features_}
  parseJSON _ = mempty

instance T.ToJSON PremiumFeatures where
  toJSON
    PremiumFeatures
      { payment_link = payment_link_,
        limits = limits_,
        features = features_
      } =
      A.object
        [ "@type" A..= T.String "premiumFeatures",
          "payment_link" A..= payment_link_,
          "limits" A..= limits_,
          "features" A..= features_
        ]
