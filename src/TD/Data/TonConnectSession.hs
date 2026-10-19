module TD.Data.TonConnectSession
  (TonConnectSession(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TonConnectManifest as TonConnectManifest
import qualified Data.ByteString as BS
import qualified TD.Data.TonConnectSessionState as TonConnectSessionState

data TonConnectSession
  = TonConnectSession -- ^ Represents a TON Connect session. See https://github.com/ton-blockchain/ton-connect/tree/main/spec for full TON Connect protocol documentation
    { _id              :: Maybe Int                                           -- ^ Unique identifier of the session
    , dapp_client_id   :: Maybe T.Text                                        -- ^ Hex-encoded public X25519 key of the dApp
    , wallet_client_id :: Maybe T.Text                                        -- ^ Hex-encoded public X25519 key of the current user's application; may be empty if none
    , creation_date    :: Maybe Int                                           -- ^ Point in time (Unix timestamp) when the session was created
    , manifest         :: Maybe TonConnectManifest.TonConnectManifest         -- ^ Manifest of the dApp
    , nonce            :: Maybe BS.ByteString                                 -- ^ Nonce used for the session
    , state            :: Maybe TonConnectSessionState.TonConnectSessionState -- ^ Session state
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectSession where
  shortShow TonConnectSession
    { _id              = _id_
    , dapp_client_id   = dapp_client_id_
    , wallet_client_id = wallet_client_id_
    , creation_date    = creation_date_
    , manifest         = manifest_
    , nonce            = nonce_
    , state            = state_
    }
      = "TonConnectSession"
        ++ I.cc
        [ "_id"              `I.p` _id_
        , "dapp_client_id"   `I.p` dapp_client_id_
        , "wallet_client_id" `I.p` wallet_client_id_
        , "creation_date"    `I.p` creation_date_
        , "manifest"         `I.p` manifest_
        , "nonce"            `I.p` nonce_
        , "state"            `I.p` state_
        ]

instance AT.FromJSON TonConnectSession where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectSession" -> parseTonConnectSession v
      _                   -> mempty
    
    where
      parseTonConnectSession :: A.Value -> AT.Parser TonConnectSession
      parseTonConnectSession = A.withObject "TonConnectSession" $ \o -> do
        _id_              <- fmap I.readInt64 <$> o A..:?  "id"
        dapp_client_id_   <- o A..:?                       "dapp_client_id"
        wallet_client_id_ <- o A..:?                       "wallet_client_id"
        creation_date_    <- o A..:?                       "creation_date"
        manifest_         <- o A..:?                       "manifest"
        nonce_            <- fmap I.readBytes <$> o A..:?  "nonce"
        state_            <- o A..:?                       "state"
        pure $ TonConnectSession
          { _id              = _id_
          , dapp_client_id   = dapp_client_id_
          , wallet_client_id = wallet_client_id_
          , creation_date    = creation_date_
          , manifest         = manifest_
          , nonce            = nonce_
          , state            = state_
          }
  parseJSON _ = mempty

