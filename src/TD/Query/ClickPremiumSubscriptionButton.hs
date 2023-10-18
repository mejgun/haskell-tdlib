module TD.Query.ClickPremiumSubscriptionButton
  (ClickPremiumSubscriptionButton(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the user clicked Premium subscription button on the Premium features screen. Returns 'TD.Data.Ok.Ok'
data ClickPremiumSubscriptionButton
  = ClickPremiumSubscriptionButton
  deriving (Eq, Show)

instance I.ShortShow ClickPremiumSubscriptionButton where
  shortShow
    ClickPremiumSubscriptionButton
        = "ClickPremiumSubscriptionButton"

instance AT.ToJSON ClickPremiumSubscriptionButton where
  toJSON
    ClickPremiumSubscriptionButton
        = A.object
          [ "@type" A..= AT.String "clickPremiumSubscriptionButton"
          ]

