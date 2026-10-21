module TD.Query.SetTonConnectSessionWalletClientId
  (SetTonConnectSessionWalletClientId(..)
  , defaultSetTonConnectSessionWalletClientId
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets wallet_client_id for a pending TON Connect session. Then, sendTonConnectSessionConnectResult must be used to accept or reject the session. If the session was created for an OAuth request, then acceptOauthRequest must be used instead. Returns 'TD.Data.TonConnectChallenge.TonConnectChallenge'
data SetTonConnectSessionWalletClientId
  = SetTonConnectSessionWalletClientId
    { session_id       :: Maybe Int    -- ^ Unique identifier of the session
    , wallet_client_id :: Maybe T.Text -- ^ Hex-encoded public X25519 key of the current user's application calculated from the TON wallet private key and session parameters
    }
  deriving (Eq, Show)

instance I.ShortShow SetTonConnectSessionWalletClientId where
  shortShow
    SetTonConnectSessionWalletClientId
      { session_id       = session_id_
      , wallet_client_id = wallet_client_id_
      }
        = "SetTonConnectSessionWalletClientId"
          ++ I.cc
          [ "session_id"       `I.p` session_id_
          , "wallet_client_id" `I.p` wallet_client_id_
          ]

instance AT.ToJSON SetTonConnectSessionWalletClientId where
  toJSON
    SetTonConnectSessionWalletClientId
      { session_id       = session_id_
      , wallet_client_id = wallet_client_id_
      }
        = A.object
          [ "@type"            A..= AT.String "setTonConnectSessionWalletClientId"
          , "session_id"       A..= fmap I.writeInt64  session_id_
          , "wallet_client_id" A..= wallet_client_id_
          ]

defaultSetTonConnectSessionWalletClientId :: SetTonConnectSessionWalletClientId
defaultSetTonConnectSessionWalletClientId =
  SetTonConnectSessionWalletClientId
    { session_id       = Nothing
    , wallet_client_id = Nothing
    }

