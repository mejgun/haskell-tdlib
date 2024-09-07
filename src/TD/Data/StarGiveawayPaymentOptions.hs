module TD.Data.StarGiveawayPaymentOptions
  (StarGiveawayPaymentOptions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StarGiveawayPaymentOption as StarGiveawayPaymentOption

data StarGiveawayPaymentOptions
  = StarGiveawayPaymentOptions -- ^ Contains a list of options for creating Telegram Star giveaway
    { options :: Maybe [StarGiveawayPaymentOption.StarGiveawayPaymentOption] -- ^ The list of options
    }
  deriving (Eq, Show)

instance I.ShortShow StarGiveawayPaymentOptions where
  shortShow StarGiveawayPaymentOptions
    { options = options_
    }
      = "StarGiveawayPaymentOptions"
        ++ I.cc
        [ "options" `I.p` options_
        ]

instance AT.FromJSON StarGiveawayPaymentOptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starGiveawayPaymentOptions" -> parseStarGiveawayPaymentOptions v
      _                            -> mempty
    
    where
      parseStarGiveawayPaymentOptions :: A.Value -> AT.Parser StarGiveawayPaymentOptions
      parseStarGiveawayPaymentOptions = A.withObject "StarGiveawayPaymentOptions" $ \o -> do
        options_ <- o A..:?  "options"
        pure $ StarGiveawayPaymentOptions
          { options = options_
          }
  parseJSON _ = mempty

