module TD.Query.GetStarGiveawayPaymentOptions
  (GetStarGiveawayPaymentOptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns available options for Telegram Star giveaway creation. Returns 'TD.Data.StarGiveawayPaymentOptions.StarGiveawayPaymentOptions'
data GetStarGiveawayPaymentOptions
  = GetStarGiveawayPaymentOptions
  deriving (Eq, Show)

instance I.ShortShow GetStarGiveawayPaymentOptions where
  shortShow
    GetStarGiveawayPaymentOptions
        = "GetStarGiveawayPaymentOptions"

instance AT.ToJSON GetStarGiveawayPaymentOptions where
  toJSON
    GetStarGiveawayPaymentOptions
        = A.object
          [ "@type" A..= AT.String "getStarGiveawayPaymentOptions"
          ]

