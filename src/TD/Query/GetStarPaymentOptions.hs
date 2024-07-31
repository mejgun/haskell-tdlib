module TD.Query.GetStarPaymentOptions
  (GetStarPaymentOptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns available options for Telegram Stars purchase. Returns 'TD.Data.StarPaymentOptions.StarPaymentOptions'
data GetStarPaymentOptions
  = GetStarPaymentOptions
  deriving (Eq, Show)

instance I.ShortShow GetStarPaymentOptions where
  shortShow
    GetStarPaymentOptions
        = "GetStarPaymentOptions"

instance AT.ToJSON GetStarPaymentOptions where
  toJSON
    GetStarPaymentOptions
        = A.object
          [ "@type" A..= AT.String "getStarPaymentOptions"
          ]

