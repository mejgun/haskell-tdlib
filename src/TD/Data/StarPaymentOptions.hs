module TD.Data.StarPaymentOptions
  (StarPaymentOptions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StarPaymentOption as StarPaymentOption

data StarPaymentOptions
  = StarPaymentOptions -- ^ Contains a list of options for buying Telegram Stars
    { options :: Maybe [StarPaymentOption.StarPaymentOption] -- ^ The list of options
    }
  deriving (Eq, Show)

instance I.ShortShow StarPaymentOptions where
  shortShow StarPaymentOptions
    { options = options_
    }
      = "StarPaymentOptions"
        ++ I.cc
        [ "options" `I.p` options_
        ]

instance AT.FromJSON StarPaymentOptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starPaymentOptions" -> parseStarPaymentOptions v
      _                    -> mempty
    
    where
      parseStarPaymentOptions :: A.Value -> AT.Parser StarPaymentOptions
      parseStarPaymentOptions = A.withObject "StarPaymentOptions" $ \o -> do
        options_ <- o A..:?  "options"
        pure $ StarPaymentOptions
          { options = options_
          }
  parseJSON _ = mempty

