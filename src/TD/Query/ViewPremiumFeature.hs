{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ViewPremiumFeature where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PremiumFeature as PremiumFeature
import qualified Utils as U

-- |
-- Informs TDLib that the user viewed detailed information about a Premium feature on the Premium features screen @feature The viewed premium feature
data ViewPremiumFeature = ViewPremiumFeature
  { -- |
    feature :: Maybe PremiumFeature.PremiumFeature
  }
  deriving (Eq)

instance Show ViewPremiumFeature where
  show
    ViewPremiumFeature
      { feature = feature_
      } =
      "ViewPremiumFeature"
        ++ U.cc
          [ U.p "feature" feature_
          ]

instance T.ToJSON ViewPremiumFeature where
  toJSON
    ViewPremiumFeature
      { feature = feature_
      } =
      A.object
        [ "@type" A..= T.String "viewPremiumFeature",
          "feature" A..= feature_
        ]
