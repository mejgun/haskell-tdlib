module TD.Query.ClaimTonConnectRequest
  (ClaimTonConnectRequest(..)
  , defaultClaimTonConnectRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Claims a request received through TON Connect for processing on this device. Returns 'TD.Data.Ok.Ok'
data ClaimTonConnectRequest
  = ClaimTonConnectRequest
    { session_id      :: Maybe Int    -- ^ Unique identifier of the TON Connect session
    , message_id      :: Maybe Int    -- ^ Identifier of the message with the request
    , dapp_request_id :: Maybe T.Text -- ^ Identifier of the request assigned by the dApp
    , is_rejected     :: Maybe Bool   -- ^ Pass true to reject the request
    }
  deriving (Eq, Show)

instance I.ShortShow ClaimTonConnectRequest where
  shortShow
    ClaimTonConnectRequest
      { session_id      = session_id_
      , message_id      = message_id_
      , dapp_request_id = dapp_request_id_
      , is_rejected     = is_rejected_
      }
        = "ClaimTonConnectRequest"
          ++ I.cc
          [ "session_id"      `I.p` session_id_
          , "message_id"      `I.p` message_id_
          , "dapp_request_id" `I.p` dapp_request_id_
          , "is_rejected"     `I.p` is_rejected_
          ]

instance AT.ToJSON ClaimTonConnectRequest where
  toJSON
    ClaimTonConnectRequest
      { session_id      = session_id_
      , message_id      = message_id_
      , dapp_request_id = dapp_request_id_
      , is_rejected     = is_rejected_
      }
        = A.object
          [ "@type"           A..= AT.String "claimTonConnectRequest"
          , "session_id"      A..= fmap I.writeInt64  session_id_
          , "message_id"      A..= message_id_
          , "dapp_request_id" A..= dapp_request_id_
          , "is_rejected"     A..= is_rejected_
          ]

defaultClaimTonConnectRequest :: ClaimTonConnectRequest
defaultClaimTonConnectRequest =
  ClaimTonConnectRequest
    { session_id      = Nothing
    , message_id      = Nothing
    , dapp_request_id = Nothing
    , is_rejected     = Nothing
    }

