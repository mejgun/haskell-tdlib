module TD.Data.CallState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.CallProtocol as CallProtocol
import qualified TD.Data.CallServer as CallServer
import qualified TD.Data.CallDiscardReason as CallDiscardReason
import qualified TD.Data.Error as Error

data CallState -- ^ Describes the current call state
  = CallStatePending -- ^ The call is pending, waiting to be accepted by a user
    { is_created  :: Maybe Bool -- ^ True, if the call has already been created by the server
    , is_received :: Maybe Bool -- ^ True, if the call has already been received by the other party
    }
  | CallStateExchangingKeys -- ^ The call has been answered and encryption keys are being exchanged
  | CallStateReady -- ^ The call is ready to use
    { protocol       :: Maybe CallProtocol.CallProtocol -- ^ Call protocols supported by the peer
    , servers        :: Maybe [CallServer.CallServer]   -- ^ List of available call servers
    , config         :: Maybe T.Text                    -- ^ A JSON-encoded call config
    , encryption_key :: Maybe BS.ByteString             -- ^ Call encryption key
    , emojis         :: Maybe [T.Text]                  -- ^ Encryption key emojis fingerprint
    , allow_p2p      :: Maybe Bool                      -- ^ True, if peer-to-peer connection is allowed by users privacy settings
    }
  | CallStateHangingUp -- ^ The call is hanging up after discardCall has been called
  | CallStateDiscarded -- ^ The call has ended successfully
    { reason                 :: Maybe CallDiscardReason.CallDiscardReason -- ^ The reason, why the call has ended
    , need_rating            :: Maybe Bool                                -- ^ True, if the call rating must be sent to the server
    , need_debug_information :: Maybe Bool                                -- ^ True, if the call debug information must be sent to the server
    , need_log               :: Maybe Bool                                -- ^ True, if the call log must be sent to the server
    }
  | CallStateError -- ^ The call has ended with an error
    { _error :: Maybe Error.Error -- ^ Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
    }
  deriving (Eq)

instance Show CallState where
  show CallStatePending
    { is_created  = is_created_
    , is_received = is_received_
    }
      = "CallStatePending"
        ++ I.cc
        [ "is_created"  `I.p` is_created_
        , "is_received" `I.p` is_received_
        ]
  show CallStateExchangingKeys
      = "CallStateExchangingKeys"
  show CallStateReady
    { protocol       = protocol_
    , servers        = servers_
    , config         = config_
    , encryption_key = encryption_key_
    , emojis         = emojis_
    , allow_p2p      = allow_p2p_
    }
      = "CallStateReady"
        ++ I.cc
        [ "protocol"       `I.p` protocol_
        , "servers"        `I.p` servers_
        , "config"         `I.p` config_
        , "encryption_key" `I.p` encryption_key_
        , "emojis"         `I.p` emojis_
        , "allow_p2p"      `I.p` allow_p2p_
        ]
  show CallStateHangingUp
      = "CallStateHangingUp"
  show CallStateDiscarded
    { reason                 = reason_
    , need_rating            = need_rating_
    , need_debug_information = need_debug_information_
    , need_log               = need_log_
    }
      = "CallStateDiscarded"
        ++ I.cc
        [ "reason"                 `I.p` reason_
        , "need_rating"            `I.p` need_rating_
        , "need_debug_information" `I.p` need_debug_information_
        , "need_log"               `I.p` need_log_
        ]
  show CallStateError
    { _error = _error_
    }
      = "CallStateError"
        ++ I.cc
        [ "_error" `I.p` _error_
        ]

instance AT.FromJSON CallState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callStatePending"        -> parseCallStatePending v
      "callStateExchangingKeys" -> pure CallStateExchangingKeys
      "callStateReady"          -> parseCallStateReady v
      "callStateHangingUp"      -> pure CallStateHangingUp
      "callStateDiscarded"      -> parseCallStateDiscarded v
      "callStateError"          -> parseCallStateError v
      _                         -> mempty
    
    where
      parseCallStatePending :: A.Value -> AT.Parser CallState
      parseCallStatePending = A.withObject "CallStatePending" $ \o -> do
        is_created_  <- o A..:?  "is_created"
        is_received_ <- o A..:?  "is_received"
        pure $ CallStatePending
          { is_created  = is_created_
          , is_received = is_received_
          }
      parseCallStateReady :: A.Value -> AT.Parser CallState
      parseCallStateReady = A.withObject "CallStateReady" $ \o -> do
        protocol_       <- o A..:?                       "protocol"
        servers_        <- o A..:?                       "servers"
        config_         <- o A..:?                       "config"
        encryption_key_ <- fmap I.readBytes <$> o A..:?  "encryption_key"
        emojis_         <- o A..:?                       "emojis"
        allow_p2p_      <- o A..:?                       "allow_p2p"
        pure $ CallStateReady
          { protocol       = protocol_
          , servers        = servers_
          , config         = config_
          , encryption_key = encryption_key_
          , emojis         = emojis_
          , allow_p2p      = allow_p2p_
          }
      parseCallStateDiscarded :: A.Value -> AT.Parser CallState
      parseCallStateDiscarded = A.withObject "CallStateDiscarded" $ \o -> do
        reason_                 <- o A..:?  "reason"
        need_rating_            <- o A..:?  "need_rating"
        need_debug_information_ <- o A..:?  "need_debug_information"
        need_log_               <- o A..:?  "need_log"
        pure $ CallStateDiscarded
          { reason                 = reason_
          , need_rating            = need_rating_
          , need_debug_information = need_debug_information_
          , need_log               = need_log_
          }
      parseCallStateError :: A.Value -> AT.Parser CallState
      parseCallStateError = A.withObject "CallStateError" $ \o -> do
        _error_ <- o A..:?  "error"
        pure $ CallStateError
          { _error = _error_
          }

instance AT.ToJSON CallState where
  toJSON CallStatePending
    { is_created  = is_created_
    , is_received = is_received_
    }
      = A.object
        [ "@type"       A..= AT.String "callStatePending"
        , "is_created"  A..= is_created_
        , "is_received" A..= is_received_
        ]
  toJSON CallStateExchangingKeys
      = A.object
        [ "@type" A..= AT.String "callStateExchangingKeys"
        ]
  toJSON CallStateReady
    { protocol       = protocol_
    , servers        = servers_
    , config         = config_
    , encryption_key = encryption_key_
    , emojis         = emojis_
    , allow_p2p      = allow_p2p_
    }
      = A.object
        [ "@type"          A..= AT.String "callStateReady"
        , "protocol"       A..= protocol_
        , "servers"        A..= servers_
        , "config"         A..= config_
        , "encryption_key" A..= fmap I.writeBytes  encryption_key_
        , "emojis"         A..= emojis_
        , "allow_p2p"      A..= allow_p2p_
        ]
  toJSON CallStateHangingUp
      = A.object
        [ "@type" A..= AT.String "callStateHangingUp"
        ]
  toJSON CallStateDiscarded
    { reason                 = reason_
    , need_rating            = need_rating_
    , need_debug_information = need_debug_information_
    , need_log               = need_log_
    }
      = A.object
        [ "@type"                  A..= AT.String "callStateDiscarded"
        , "reason"                 A..= reason_
        , "need_rating"            A..= need_rating_
        , "need_debug_information" A..= need_debug_information_
        , "need_log"               A..= need_log_
        ]
  toJSON CallStateError
    { _error = _error_
    }
      = A.object
        [ "@type" A..= AT.String "callStateError"
        , "error" A..= _error_
        ]
