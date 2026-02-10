module TD.Query.EditProxy
  (EditProxy(..)
  , defaultEditProxy
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Proxy as Proxy

-- | Edits an existing proxy server for network requests. Can be called before authorization. Returns 'TD.Data.AddedProxy.AddedProxy'
data EditProxy
  = EditProxy
    { proxy_id :: Maybe Int         -- ^ Proxy identifier
    , proxy    :: Maybe Proxy.Proxy -- ^ The new information about the proxy
    , enable   :: Maybe Bool        -- ^ Pass true to immediately enable the proxy
    }
  deriving (Eq, Show)

instance I.ShortShow EditProxy where
  shortShow
    EditProxy
      { proxy_id = proxy_id_
      , proxy    = proxy_
      , enable   = enable_
      }
        = "EditProxy"
          ++ I.cc
          [ "proxy_id" `I.p` proxy_id_
          , "proxy"    `I.p` proxy_
          , "enable"   `I.p` enable_
          ]

instance AT.ToJSON EditProxy where
  toJSON
    EditProxy
      { proxy_id = proxy_id_
      , proxy    = proxy_
      , enable   = enable_
      }
        = A.object
          [ "@type"    A..= AT.String "editProxy"
          , "proxy_id" A..= proxy_id_
          , "proxy"    A..= proxy_
          , "enable"   A..= enable_
          ]

defaultEditProxy :: EditProxy
defaultEditProxy =
  EditProxy
    { proxy_id = Nothing
    , proxy    = Nothing
    , enable   = Nothing
    }

