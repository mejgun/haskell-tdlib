module TD.Data.PremiumGiveawayPaymentOptions
  (PremiumGiveawayPaymentOptions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumGiveawayPaymentOption as PremiumGiveawayPaymentOption

data PremiumGiveawayPaymentOptions
  = PremiumGiveawayPaymentOptions -- ^ Contains a list of options for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members
    { options :: Maybe [PremiumGiveawayPaymentOption.PremiumGiveawayPaymentOption] -- ^ The list of options
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiveawayPaymentOptions where
  shortShow PremiumGiveawayPaymentOptions
    { options = options_
    }
      = "PremiumGiveawayPaymentOptions"
        ++ I.cc
        [ "options" `I.p` options_
        ]

instance AT.FromJSON PremiumGiveawayPaymentOptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiveawayPaymentOptions" -> parsePremiumGiveawayPaymentOptions v
      _                               -> mempty
    
    where
      parsePremiumGiveawayPaymentOptions :: A.Value -> AT.Parser PremiumGiveawayPaymentOptions
      parsePremiumGiveawayPaymentOptions = A.withObject "PremiumGiveawayPaymentOptions" $ \o -> do
        options_ <- o A..:?  "options"
        pure $ PremiumGiveawayPaymentOptions
          { options = options_
          }
  parseJSON _ = mempty

