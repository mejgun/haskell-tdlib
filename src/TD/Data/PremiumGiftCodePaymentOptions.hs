module TD.Data.PremiumGiftCodePaymentOptions
  (PremiumGiftCodePaymentOptions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumGiftCodePaymentOption as PremiumGiftCodePaymentOption

data PremiumGiftCodePaymentOptions
  = PremiumGiftCodePaymentOptions -- ^ Contains a list of options for creating Telegram Premium gift codes or Telegram Premium giveaway
    { options :: Maybe [PremiumGiftCodePaymentOption.PremiumGiftCodePaymentOption] -- ^ The list of options
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiftCodePaymentOptions where
  shortShow PremiumGiftCodePaymentOptions
    { options = options_
    }
      = "PremiumGiftCodePaymentOptions"
        ++ I.cc
        [ "options" `I.p` options_
        ]

instance AT.FromJSON PremiumGiftCodePaymentOptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiftCodePaymentOptions" -> parsePremiumGiftCodePaymentOptions v
      _                               -> mempty
    
    where
      parsePremiumGiftCodePaymentOptions :: A.Value -> AT.Parser PremiumGiftCodePaymentOptions
      parsePremiumGiftCodePaymentOptions = A.withObject "PremiumGiftCodePaymentOptions" $ \o -> do
        options_ <- o A..:?  "options"
        pure $ PremiumGiftCodePaymentOptions
          { options = options_
          }
  parseJSON _ = mempty

