module TD.Data.TonConnectConnectRequest
  ( TonConnectConnectRequest(..)    
  , defaultTonConnectConnectRequest 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TonConnectConnectItem as TonConnectConnectItem

data TonConnectConnectRequest
  = TonConnectConnectRequest -- ^ Contains information about a request to connect the user's TON wallet to a dApp using TON Connect
    { manifest_url :: Maybe T.Text                                        -- ^ URL of the manifest of the dApp
    , items        :: Maybe [TonConnectConnectItem.TonConnectConnectItem] -- ^ Items requested from the wallet
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectConnectRequest where
  shortShow TonConnectConnectRequest
    { manifest_url = manifest_url_
    , items        = items_
    }
      = "TonConnectConnectRequest"
        ++ I.cc
        [ "manifest_url" `I.p` manifest_url_
        , "items"        `I.p` items_
        ]

instance AT.FromJSON TonConnectConnectRequest where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectConnectRequest" -> parseTonConnectConnectRequest v
      _                          -> mempty
    
    where
      parseTonConnectConnectRequest :: A.Value -> AT.Parser TonConnectConnectRequest
      parseTonConnectConnectRequest = A.withObject "TonConnectConnectRequest" $ \o -> do
        manifest_url_ <- o A..:?  "manifest_url"
        items_        <- o A..:?  "items"
        pure $ TonConnectConnectRequest
          { manifest_url = manifest_url_
          , items        = items_
          }
  parseJSON _ = mempty

instance AT.ToJSON TonConnectConnectRequest where
  toJSON TonConnectConnectRequest
    { manifest_url = manifest_url_
    , items        = items_
    }
      = A.object
        [ "@type"        A..= AT.String "tonConnectConnectRequest"
        , "manifest_url" A..= manifest_url_
        , "items"        A..= items_
        ]

defaultTonConnectConnectRequest :: TonConnectConnectRequest
defaultTonConnectConnectRequest =
  TonConnectConnectRequest
    { manifest_url = Nothing
    , items        = Nothing
    }

