module TD.Query.GetPremiumInfoSticker
  (GetPremiumInfoSticker(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the sticker to be used as representation of the Telegram Premium subscription. Returns 'TD.Data.Sticker.Sticker'
data GetPremiumInfoSticker
  = GetPremiumInfoSticker
    { month_count :: Maybe Int -- ^ Number of months the Telegram Premium subscription will be active
    }
  deriving (Eq, Show)

instance I.ShortShow GetPremiumInfoSticker where
  shortShow
    GetPremiumInfoSticker
      { month_count = month_count_
      }
        = "GetPremiumInfoSticker"
          ++ I.cc
          [ "month_count" `I.p` month_count_
          ]

instance AT.ToJSON GetPremiumInfoSticker where
  toJSON
    GetPremiumInfoSticker
      { month_count = month_count_
      }
        = A.object
          [ "@type"       A..= AT.String "getPremiumInfoSticker"
          , "month_count" A..= month_count_
          ]

