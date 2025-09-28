module TD.Query.SetGiftResalePrice
  (SetGiftResalePrice(..)
  , defaultSetGiftResalePrice
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.GiftResalePrice as GiftResalePrice

-- | Changes resale price of a unique gift owned by the current user. Returns 'TD.Data.Ok.Ok'
data SetGiftResalePrice
  = SetGiftResalePrice
    { received_gift_id :: Maybe T.Text                          -- ^ Identifier of the unique gift
    , price            :: Maybe GiftResalePrice.GiftResalePrice -- ^ The new price for the unique gift; pass null to disallow gift resale. The current user will receive getOption("gift_resale_star_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for the gift if the gift price is in Telegram Stars or getOption("gift_resale_ton_earnings_per_mille") Toncoins for each 1000 Toncoins paid for the gift if the gift price is in Toncoins
    }
  deriving (Eq, Show)

instance I.ShortShow SetGiftResalePrice where
  shortShow
    SetGiftResalePrice
      { received_gift_id = received_gift_id_
      , price            = price_
      }
        = "SetGiftResalePrice"
          ++ I.cc
          [ "received_gift_id" `I.p` received_gift_id_
          , "price"            `I.p` price_
          ]

instance AT.ToJSON SetGiftResalePrice where
  toJSON
    SetGiftResalePrice
      { received_gift_id = received_gift_id_
      , price            = price_
      }
        = A.object
          [ "@type"            A..= AT.String "setGiftResalePrice"
          , "received_gift_id" A..= received_gift_id_
          , "price"            A..= price_
          ]

defaultSetGiftResalePrice :: SetGiftResalePrice
defaultSetGiftResalePrice =
  SetGiftResalePrice
    { received_gift_id = Nothing
    , price            = Nothing
    }

