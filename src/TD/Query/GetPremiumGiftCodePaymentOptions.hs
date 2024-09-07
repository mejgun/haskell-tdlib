module TD.Query.GetPremiumGiftCodePaymentOptions
  (GetPremiumGiftCodePaymentOptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns available options for Telegram Premium gift code or Telegram Premium giveaway creation. Returns 'TD.Data.PremiumGiftCodePaymentOptions.PremiumGiftCodePaymentOptions'
data GetPremiumGiftCodePaymentOptions
  = GetPremiumGiftCodePaymentOptions
    { boosted_chat_id :: Maybe Int -- ^ Identifier of the supergroup or channel chat, which will be automatically boosted by receivers of the gift codes and which is administered by the user; 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow GetPremiumGiftCodePaymentOptions where
  shortShow
    GetPremiumGiftCodePaymentOptions
      { boosted_chat_id = boosted_chat_id_
      }
        = "GetPremiumGiftCodePaymentOptions"
          ++ I.cc
          [ "boosted_chat_id" `I.p` boosted_chat_id_
          ]

instance AT.ToJSON GetPremiumGiftCodePaymentOptions where
  toJSON
    GetPremiumGiftCodePaymentOptions
      { boosted_chat_id = boosted_chat_id_
      }
        = A.object
          [ "@type"           A..= AT.String "getPremiumGiftCodePaymentOptions"
          , "boosted_chat_id" A..= boosted_chat_id_
          ]

