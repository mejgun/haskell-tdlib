module TD.Query.ViewPremiumFeature(ViewPremiumFeature(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumFeature as PremiumFeature

data ViewPremiumFeature -- ^ Informs TDLib that the user viewed detailed information about a Premium feature on the Premium features screen
  = ViewPremiumFeature
    { feature :: Maybe PremiumFeature.PremiumFeature -- ^ The viewed premium feature
    }
  deriving (Eq)

instance Show ViewPremiumFeature where
  show
    ViewPremiumFeature
      { feature = feature_
      }
        = "ViewPremiumFeature"
          ++ I.cc
          [ "feature" `I.p` feature_
          ]

instance AT.ToJSON ViewPremiumFeature where
  toJSON
    ViewPremiumFeature
      { feature = feature_
      }
        = A.object
          [ "@type"   A..= AT.String "viewPremiumFeature"
          , "feature" A..= feature_
          ]
