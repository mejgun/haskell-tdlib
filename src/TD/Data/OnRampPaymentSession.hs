module TD.Data.OnRampPaymentSession
  (OnRampPaymentSession(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data OnRampPaymentSession
  = OnRampPaymentSession -- ^ Describes a session for an on-ramp purchase
    { session_id      :: Maybe T.Text -- ^ Identifier of the session
    , expiration_date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the session will expire
    , url             :: Maybe T.Text -- ^ HTTPS URL to be opened in a WebView to complete the purchase
    }
  deriving (Eq, Show)

instance I.ShortShow OnRampPaymentSession where
  shortShow OnRampPaymentSession
    { session_id      = session_id_
    , expiration_date = expiration_date_
    , url             = url_
    }
      = "OnRampPaymentSession"
        ++ I.cc
        [ "session_id"      `I.p` session_id_
        , "expiration_date" `I.p` expiration_date_
        , "url"             `I.p` url_
        ]

instance AT.FromJSON OnRampPaymentSession where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "onRampPaymentSession" -> parseOnRampPaymentSession v
      _                      -> mempty
    
    where
      parseOnRampPaymentSession :: A.Value -> AT.Parser OnRampPaymentSession
      parseOnRampPaymentSession = A.withObject "OnRampPaymentSession" $ \o -> do
        session_id_      <- o A..:?  "session_id"
        expiration_date_ <- o A..:?  "expiration_date"
        url_             <- o A..:?  "url"
        pure $ OnRampPaymentSession
          { session_id      = session_id_
          , expiration_date = expiration_date_
          , url             = url_
          }
  parseJSON _ = mempty

