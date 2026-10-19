module TD.Query.CreateTonConnectSession
  (CreateTonConnectSession(..)
  , defaultCreateTonConnectSession
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a TON Connect session; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.TonConnectSession.TonConnectSession'
data CreateTonConnectSession
  = CreateTonConnectSession
    { dapp_client_id :: Maybe T.Text -- ^ Hex-encoded public X25519 key of the dApp
    , manifest_url   :: Maybe T.Text -- ^ URL of the manifest of the dApp
    }
  deriving (Eq, Show)

instance I.ShortShow CreateTonConnectSession where
  shortShow
    CreateTonConnectSession
      { dapp_client_id = dapp_client_id_
      , manifest_url   = manifest_url_
      }
        = "CreateTonConnectSession"
          ++ I.cc
          [ "dapp_client_id" `I.p` dapp_client_id_
          , "manifest_url"   `I.p` manifest_url_
          ]

instance AT.ToJSON CreateTonConnectSession where
  toJSON
    CreateTonConnectSession
      { dapp_client_id = dapp_client_id_
      , manifest_url   = manifest_url_
      }
        = A.object
          [ "@type"          A..= AT.String "createTonConnectSession"
          , "dapp_client_id" A..= dapp_client_id_
          , "manifest_url"   A..= manifest_url_
          ]

defaultCreateTonConnectSession :: CreateTonConnectSession
defaultCreateTonConnectSession =
  CreateTonConnectSession
    { dapp_client_id = Nothing
    , manifest_url   = Nothing
    }

