module TD.Data.AddedProxy
  (AddedProxy(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Proxy as Proxy

data AddedProxy
  = AddedProxy -- ^ Contains information about a proxy server added to the list of proxies
    { _id            :: Maybe Int         -- ^ Unique identifier of the proxy
    , last_used_date :: Maybe Int         -- ^ Point in time (Unix timestamp) when the proxy was last used; 0 if never
    , is_enabled     :: Maybe Bool        -- ^ True, if the proxy is enabled now
    , comment        :: Maybe T.Text      -- ^ Comment for the proxy added by the user
    , proxy          :: Maybe Proxy.Proxy -- ^ The proxy
    }
  deriving (Eq, Show)

instance I.ShortShow AddedProxy where
  shortShow AddedProxy
    { _id            = _id_
    , last_used_date = last_used_date_
    , is_enabled     = is_enabled_
    , comment        = comment_
    , proxy          = proxy_
    }
      = "AddedProxy"
        ++ I.cc
        [ "_id"            `I.p` _id_
        , "last_used_date" `I.p` last_used_date_
        , "is_enabled"     `I.p` is_enabled_
        , "comment"        `I.p` comment_
        , "proxy"          `I.p` proxy_
        ]

instance AT.FromJSON AddedProxy where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "addedProxy" -> parseAddedProxy v
      _            -> mempty
    
    where
      parseAddedProxy :: A.Value -> AT.Parser AddedProxy
      parseAddedProxy = A.withObject "AddedProxy" $ \o -> do
        _id_            <- o A..:?  "id"
        last_used_date_ <- o A..:?  "last_used_date"
        is_enabled_     <- o A..:?  "is_enabled"
        comment_        <- o A..:?  "comment"
        proxy_          <- o A..:?  "proxy"
        pure $ AddedProxy
          { _id            = _id_
          , last_used_date = last_used_date_
          , is_enabled     = is_enabled_
          , comment        = comment_
          , proxy          = proxy_
          }
  parseJSON _ = mempty

