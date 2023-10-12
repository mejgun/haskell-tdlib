module TD.Query.ClickPremiumSubscriptionButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
