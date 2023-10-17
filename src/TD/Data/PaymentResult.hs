module TD.Data.PaymentResult
  (PaymentResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data PaymentResult
  = PaymentResult -- ^ Contains the result of a payment request
    { success          :: Maybe Bool   -- ^ True, if the payment request was successful; otherwise, the verification_url will be non-empty
    , verification_url :: Maybe T.Text -- ^ URL for additional payment credentials verification
    }
  deriving (Eq, Show)

instance I.ShortShow PaymentResult where
  shortShow PaymentResult
    { success          = success_
    , verification_url = verification_url_
    }
      = "PaymentResult"
        ++ I.cc
        [ "success"          `I.p` success_
        , "verification_url" `I.p` verification_url_
        ]

instance AT.FromJSON PaymentResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paymentResult" -> parsePaymentResult v
      _               -> mempty
    
    where
      parsePaymentResult :: A.Value -> AT.Parser PaymentResult
      parsePaymentResult = A.withObject "PaymentResult" $ \o -> do
        success_          <- o A..:?  "success"
        verification_url_ <- o A..:?  "verification_url"
        pure $ PaymentResult
          { success          = success_
          , verification_url = verification_url_
          }
  parseJSON _ = mempty

