module TD.Query.ClickPremiumSubscriptionButton
  (ClickPremiumSubscriptionButton(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data ClickPremiumSubscriptionButton -- ^ Informs TDLib that the user clicked Premium subscription button on the Premium features screen
  = ClickPremiumSubscriptionButton
  deriving (Eq)

instance Show ClickPremiumSubscriptionButton where
  show
    ClickPremiumSubscriptionButton
        = "ClickPremiumSubscriptionButton"

instance AT.ToJSON ClickPremiumSubscriptionButton where
  toJSON
    ClickPremiumSubscriptionButton
        = A.object
          [ "@type" A..= AT.String "clickPremiumSubscriptionButton"
          ]

