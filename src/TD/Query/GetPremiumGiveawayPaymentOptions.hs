module TD.Query.GetPremiumGiveawayPaymentOptions
  (GetPremiumGiveawayPaymentOptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns available options for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members. Returns 'TD.Data.PremiumGiveawayPaymentOptions.PremiumGiveawayPaymentOptions'
data GetPremiumGiveawayPaymentOptions
  = GetPremiumGiveawayPaymentOptions
    { boosted_chat_id :: Maybe Int -- ^ Identifier of the supergroup or channel chat, which will be automatically boosted by receivers of the gift codes and which is administered by the user
    }
  deriving (Eq, Show)

instance I.ShortShow GetPremiumGiveawayPaymentOptions where
  shortShow
    GetPremiumGiveawayPaymentOptions
      { boosted_chat_id = boosted_chat_id_
      }
        = "GetPremiumGiveawayPaymentOptions"
          ++ I.cc
          [ "boosted_chat_id" `I.p` boosted_chat_id_
          ]

instance AT.ToJSON GetPremiumGiveawayPaymentOptions where
  toJSON
    GetPremiumGiveawayPaymentOptions
      { boosted_chat_id = boosted_chat_id_
      }
        = A.object
          [ "@type"           A..= AT.String "getPremiumGiveawayPaymentOptions"
          , "boosted_chat_id" A..= boosted_chat_id_
          ]

