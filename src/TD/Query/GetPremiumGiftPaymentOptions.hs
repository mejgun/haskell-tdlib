module TD.Query.GetPremiumGiftPaymentOptions
  (GetPremiumGiftPaymentOptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns available options for gifting Telegram Premium to a user. Returns 'TD.Data.PremiumGiftPaymentOptions.PremiumGiftPaymentOptions'
data GetPremiumGiftPaymentOptions
  = GetPremiumGiftPaymentOptions
  deriving (Eq, Show)

instance I.ShortShow GetPremiumGiftPaymentOptions where
  shortShow
    GetPremiumGiftPaymentOptions
        = "GetPremiumGiftPaymentOptions"

instance AT.ToJSON GetPremiumGiftPaymentOptions where
  toJSON
    GetPremiumGiftPaymentOptions
        = A.object
          [ "@type" A..= AT.String "getPremiumGiftPaymentOptions"
          ]

