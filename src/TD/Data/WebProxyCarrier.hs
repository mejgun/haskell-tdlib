module TD.Data.WebProxyCarrier
  (WebProxyCarrier(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data WebProxyCarrier
  = WebProxyCarrier -- ^ Describes a web proxy carrier: an HTTPS relay page, which carries traffic of a web proxy and must be loaded by the application as the top-level document of a hidden web view. Before loading the page, the application must arrange for an object named carrier.bridge_object_name to be defined in the top-level document whenever its origin is exactly carrier.origin, and in no other document or frame. The object must be read-only and must have two members: a method postMessage(value), which passes an ArrayBuffer or a typed array to processWebProxyCarrierMessage as webProxyCarrierMessageBinary, passes a string as webProxyCarrierMessageText, and rejects any other value; and a property onmessage, which the page sets to a function. The application delivers data to the page by calling that function with an object {data: value}, where value is an ArrayBuffer for binary data and a string for text. Each carrier needs its own web view
    { _id                :: Maybe Int    -- ^ Unique identifier of the carrier
    , proxy_id           :: Maybe Int    -- ^ Identifier of the added proxy that uses the carrier; 0 if the carrier is used by pingProxy or testProxy
    , url                :: Maybe T.Text -- ^ The HTTPS URL to load. The URL contains the capability for the proxy and a fragment, which must be kept; the URL must never be logged or shown to the user
    , origin             :: Maybe T.Text -- ^ Origin of the relay page, for example, "https://proxy.example.com". The web view must not be allowed to navigate to another origin
    , path_prefix        :: Maybe T.Text -- ^ The only path prefix on carrier.origin from which the page may load resources or to which it may send requests, for example, "/" or "/relay/"
    , bridge_object_name :: Maybe T.Text -- ^ Name of the object to define in the top-level document; currently, always "TelegramWebProxy"
    , is_temporary       :: Maybe Bool   -- ^ True, if the carrier is needed only to test the proxy and will be closed after the test. The application may refuse to open such carriers, for example, to avoid creating a web view for every saved proxy
    }
  deriving (Eq, Show)

instance I.ShortShow WebProxyCarrier where
  shortShow WebProxyCarrier
    { _id                = _id_
    , proxy_id           = proxy_id_
    , url                = url_
    , origin             = origin_
    , path_prefix        = path_prefix_
    , bridge_object_name = bridge_object_name_
    , is_temporary       = is_temporary_
    }
      = "WebProxyCarrier"
        ++ I.cc
        [ "_id"                `I.p` _id_
        , "proxy_id"           `I.p` proxy_id_
        , "url"                `I.p` url_
        , "origin"             `I.p` origin_
        , "path_prefix"        `I.p` path_prefix_
        , "bridge_object_name" `I.p` bridge_object_name_
        , "is_temporary"       `I.p` is_temporary_
        ]

instance AT.FromJSON WebProxyCarrier where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webProxyCarrier" -> parseWebProxyCarrier v
      _                 -> mempty
    
    where
      parseWebProxyCarrier :: A.Value -> AT.Parser WebProxyCarrier
      parseWebProxyCarrier = A.withObject "WebProxyCarrier" $ \o -> do
        _id_                <- o A..:?  "id"
        proxy_id_           <- o A..:?  "proxy_id"
        url_                <- o A..:?  "url"
        origin_             <- o A..:?  "origin"
        path_prefix_        <- o A..:?  "path_prefix"
        bridge_object_name_ <- o A..:?  "bridge_object_name"
        is_temporary_       <- o A..:?  "is_temporary"
        pure $ WebProxyCarrier
          { _id                = _id_
          , proxy_id           = proxy_id_
          , url                = url_
          , origin             = origin_
          , path_prefix        = path_prefix_
          , bridge_object_name = bridge_object_name_
          , is_temporary       = is_temporary_
          }
  parseJSON _ = mempty

