module TD.Data.WebProxyCarrierError
  (WebProxyCarrierError(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes the reason why a web proxy carrier failed
data WebProxyCarrierError
  = WebProxyCarrierErrorUnsupported -- ^ The application can't open the carrier, because the platform can't create hidden web views or define the bridge object; TDLib will not retry until the proxy is enabled again
  | WebProxyCarrierErrorPaused -- ^ The application can't open the carrier now, for example, because it is in the background; TDLib will request it again after the next call to setNetworkType or after a delay
  | WebProxyCarrierErrorLoadFailed -- ^ The page failed to load: a network, TLS, or HTTP error, or a forbidden navigation
    { message :: Maybe T.Text -- ^ The error to be logged; must not contain the URL
    }
  | WebProxyCarrierErrorTerminated -- ^ The web view or its renderer process was terminated, or passing data between the application and the page failed
  | WebProxyCarrierErrorRefused -- ^ The application refused to open a temporary carrier
  deriving (Eq, Show)

instance I.ShortShow WebProxyCarrierError where
  shortShow WebProxyCarrierErrorUnsupported
      = "WebProxyCarrierErrorUnsupported"
  shortShow WebProxyCarrierErrorPaused
      = "WebProxyCarrierErrorPaused"
  shortShow WebProxyCarrierErrorLoadFailed
    { message = message_
    }
      = "WebProxyCarrierErrorLoadFailed"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  shortShow WebProxyCarrierErrorTerminated
      = "WebProxyCarrierErrorTerminated"
  shortShow WebProxyCarrierErrorRefused
      = "WebProxyCarrierErrorRefused"

instance AT.FromJSON WebProxyCarrierError where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webProxyCarrierErrorUnsupported" -> pure WebProxyCarrierErrorUnsupported
      "webProxyCarrierErrorPaused"      -> pure WebProxyCarrierErrorPaused
      "webProxyCarrierErrorLoadFailed"  -> parseWebProxyCarrierErrorLoadFailed v
      "webProxyCarrierErrorTerminated"  -> pure WebProxyCarrierErrorTerminated
      "webProxyCarrierErrorRefused"     -> pure WebProxyCarrierErrorRefused
      _                                 -> mempty
    
    where
      parseWebProxyCarrierErrorLoadFailed :: A.Value -> AT.Parser WebProxyCarrierError
      parseWebProxyCarrierErrorLoadFailed = A.withObject "WebProxyCarrierErrorLoadFailed" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ WebProxyCarrierErrorLoadFailed
          { message = message_
          }
  parseJSON _ = mempty

instance AT.ToJSON WebProxyCarrierError where
  toJSON WebProxyCarrierErrorUnsupported
      = A.object
        [ "@type" A..= AT.String "webProxyCarrierErrorUnsupported"
        ]
  toJSON WebProxyCarrierErrorPaused
      = A.object
        [ "@type" A..= AT.String "webProxyCarrierErrorPaused"
        ]
  toJSON WebProxyCarrierErrorLoadFailed
    { message = message_
    }
      = A.object
        [ "@type"   A..= AT.String "webProxyCarrierErrorLoadFailed"
        , "message" A..= message_
        ]
  toJSON WebProxyCarrierErrorTerminated
      = A.object
        [ "@type" A..= AT.String "webProxyCarrierErrorTerminated"
        ]
  toJSON WebProxyCarrierErrorRefused
      = A.object
        [ "@type" A..= AT.String "webProxyCarrierErrorRefused"
        ]

