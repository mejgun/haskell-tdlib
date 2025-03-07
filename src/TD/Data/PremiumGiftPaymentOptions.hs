module TD.Data.PremiumGiftPaymentOptions
  (PremiumGiftPaymentOptions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumGiftPaymentOption as PremiumGiftPaymentOption

data PremiumGiftPaymentOptions
  = PremiumGiftPaymentOptions -- ^ Contains a list of options for gifting Telegram Premium to a user
    { options :: Maybe [PremiumGiftPaymentOption.PremiumGiftPaymentOption] -- ^ The list of options sorted by Telegram Premium subscription duration
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiftPaymentOptions where
  shortShow PremiumGiftPaymentOptions
    { options = options_
    }
      = "PremiumGiftPaymentOptions"
        ++ I.cc
        [ "options" `I.p` options_
        ]

instance AT.FromJSON PremiumGiftPaymentOptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiftPaymentOptions" -> parsePremiumGiftPaymentOptions v
      _                           -> mempty
    
    where
      parsePremiumGiftPaymentOptions :: A.Value -> AT.Parser PremiumGiftPaymentOptions
      parsePremiumGiftPaymentOptions = A.withObject "PremiumGiftPaymentOptions" $ \o -> do
        options_ <- o A..:?  "options"
        pure $ PremiumGiftPaymentOptions
          { options = options_
          }
  parseJSON _ = mempty

