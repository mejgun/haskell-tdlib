module TD.Data.PaymentOption
  (PaymentOption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data PaymentOption
  = PaymentOption -- ^ Describes an additional payment option
    { title :: Maybe T.Text -- ^ Title for the payment option
    , url   :: Maybe T.Text -- ^ Payment form URL to be opened in a web view
    }
  deriving (Eq, Show)

instance I.ShortShow PaymentOption where
  shortShow PaymentOption
    { title = title_
    , url   = url_
    }
      = "PaymentOption"
        ++ I.cc
        [ "title" `I.p` title_
        , "url"   `I.p` url_
        ]

instance AT.FromJSON PaymentOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paymentOption" -> parsePaymentOption v
      _               -> mempty
    
    where
      parsePaymentOption :: A.Value -> AT.Parser PaymentOption
      parsePaymentOption = A.withObject "PaymentOption" $ \o -> do
        title_ <- o A..:?  "title"
        url_   <- o A..:?  "url"
        pure $ PaymentOption
          { title = title_
          , url   = url_
          }
  parseJSON _ = mempty

