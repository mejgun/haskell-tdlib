module TD.Data.PaymentOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data PaymentOption
  = PaymentOption -- ^ Describes an additional payment option
    { title :: Maybe T.Text -- ^ Title for the payment option
    , url   :: Maybe T.Text -- ^ Payment form URL to be opened in a web view
    }
  deriving (Eq)

instance Show PaymentOption where
  show PaymentOption
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

instance AT.ToJSON PaymentOption where
  toJSON PaymentOption
    { title = title_
    , url   = url_
    }
      = A.object
        [ "@type" A..= AT.String "paymentOption"
        , "title" A..= title_
        , "url"   A..= url_
        ]
