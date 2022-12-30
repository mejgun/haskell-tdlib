{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CallState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CallDiscardReason as CallDiscardReason
import qualified TD.Data.CallProtocol as CallProtocol
import qualified TD.Data.CallServer as CallServer
import qualified TD.Data.Error as Error
import qualified Utils as U

-- | Describes the current call state
data CallState
  = -- | The call is pending, waiting to be accepted by a user @is_created True, if the call has already been created by the server @is_received True, if the call has already been received by the other party
    CallStatePending
      { -- |
        is_received :: Maybe Bool,
        -- |
        is_created :: Maybe Bool
      }
  | -- | The call has been answered and encryption keys are being exchanged
    CallStateExchangingKeys
  | -- | The call is ready to use
    CallStateReady
      { -- | True, if peer-to-peer connection is allowed by users privacy settings
        allow_p2p :: Maybe Bool,
        -- | Encryption key emojis fingerprint
        emojis :: Maybe [String],
        -- | Call encryption key
        encryption_key :: Maybe String,
        -- | A JSON-encoded call config
        config :: Maybe String,
        -- | List of available call servers
        servers :: Maybe [CallServer.CallServer],
        -- | Call protocols supported by the peer
        protocol :: Maybe CallProtocol.CallProtocol
      }
  | -- | The call is hanging up after discardCall has been called
    CallStateHangingUp
  | -- | The call has ended successfully
    CallStateDiscarded
      { -- | True, if the call log must be sent to the server
        need_log :: Maybe Bool,
        -- | True, if the call debug information must be sent to the server
        need_debug_information :: Maybe Bool,
        -- | True, if the call rating must be sent to the server
        need_rating :: Maybe Bool,
        -- | The reason, why the call has ended
        reason :: Maybe CallDiscardReason.CallDiscardReason
      }
  | -- | The call has ended with an error @error Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
    CallStateError
      { -- |
        _error :: Maybe Error.Error
      }
  deriving (Eq)

instance Show CallState where
  show
    CallStatePending
      { is_received = is_received_,
        is_created = is_created_
      } =
      "CallStatePending"
        ++ U.cc
          [ U.p "is_received" is_received_,
            U.p "is_created" is_created_
          ]
  show CallStateExchangingKeys =
    "CallStateExchangingKeys"
      ++ U.cc
        []
  show
    CallStateReady
      { allow_p2p = allow_p2p_,
        emojis = emojis_,
        encryption_key = encryption_key_,
        config = config_,
        servers = servers_,
        protocol = protocol_
      } =
      "CallStateReady"
        ++ U.cc
          [ U.p "allow_p2p" allow_p2p_,
            U.p "emojis" emojis_,
            U.p "encryption_key" encryption_key_,
            U.p "config" config_,
            U.p "servers" servers_,
            U.p "protocol" protocol_
          ]
  show CallStateHangingUp =
    "CallStateHangingUp"
      ++ U.cc
        []
  show
    CallStateDiscarded
      { need_log = need_log_,
        need_debug_information = need_debug_information_,
        need_rating = need_rating_,
        reason = reason_
      } =
      "CallStateDiscarded"
        ++ U.cc
          [ U.p "need_log" need_log_,
            U.p "need_debug_information" need_debug_information_,
            U.p "need_rating" need_rating_,
            U.p "reason" reason_
          ]
  show
    CallStateError
      { _error = _error_
      } =
      "CallStateError"
        ++ U.cc
          [ U.p "_error" _error_
          ]

instance T.FromJSON CallState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callStatePending" -> parseCallStatePending v
      "callStateExchangingKeys" -> parseCallStateExchangingKeys v
      "callStateReady" -> parseCallStateReady v
      "callStateHangingUp" -> parseCallStateHangingUp v
      "callStateDiscarded" -> parseCallStateDiscarded v
      "callStateError" -> parseCallStateError v
      _ -> mempty
    where
      parseCallStatePending :: A.Value -> T.Parser CallState
      parseCallStatePending = A.withObject "CallStatePending" $ \o -> do
        is_received_ <- o A..:? "is_received"
        is_created_ <- o A..:? "is_created"
        return $ CallStatePending {is_received = is_received_, is_created = is_created_}

      parseCallStateExchangingKeys :: A.Value -> T.Parser CallState
      parseCallStateExchangingKeys = A.withObject "CallStateExchangingKeys" $ \_ -> return CallStateExchangingKeys

      parseCallStateReady :: A.Value -> T.Parser CallState
      parseCallStateReady = A.withObject "CallStateReady" $ \o -> do
        allow_p2p_ <- o A..:? "allow_p2p"
        emojis_ <- o A..:? "emojis"
        encryption_key_ <- o A..:? "encryption_key"
        config_ <- o A..:? "config"
        servers_ <- o A..:? "servers"
        protocol_ <- o A..:? "protocol"
        return $ CallStateReady {allow_p2p = allow_p2p_, emojis = emojis_, encryption_key = encryption_key_, config = config_, servers = servers_, protocol = protocol_}

      parseCallStateHangingUp :: A.Value -> T.Parser CallState
      parseCallStateHangingUp = A.withObject "CallStateHangingUp" $ \_ -> return CallStateHangingUp

      parseCallStateDiscarded :: A.Value -> T.Parser CallState
      parseCallStateDiscarded = A.withObject "CallStateDiscarded" $ \o -> do
        need_log_ <- o A..:? "need_log"
        need_debug_information_ <- o A..:? "need_debug_information"
        need_rating_ <- o A..:? "need_rating"
        reason_ <- o A..:? "reason"
        return $ CallStateDiscarded {need_log = need_log_, need_debug_information = need_debug_information_, need_rating = need_rating_, reason = reason_}

      parseCallStateError :: A.Value -> T.Parser CallState
      parseCallStateError = A.withObject "CallStateError" $ \o -> do
        _error_ <- o A..:? "error"
        return $ CallStateError {_error = _error_}
  parseJSON _ = mempty

instance T.ToJSON CallState where
  toJSON
    CallStatePending
      { is_received = is_received_,
        is_created = is_created_
      } =
      A.object
        [ "@type" A..= T.String "callStatePending",
          "is_received" A..= is_received_,
          "is_created" A..= is_created_
        ]
  toJSON CallStateExchangingKeys =
    A.object
      [ "@type" A..= T.String "callStateExchangingKeys"
      ]
  toJSON
    CallStateReady
      { allow_p2p = allow_p2p_,
        emojis = emojis_,
        encryption_key = encryption_key_,
        config = config_,
        servers = servers_,
        protocol = protocol_
      } =
      A.object
        [ "@type" A..= T.String "callStateReady",
          "allow_p2p" A..= allow_p2p_,
          "emojis" A..= emojis_,
          "encryption_key" A..= encryption_key_,
          "config" A..= config_,
          "servers" A..= servers_,
          "protocol" A..= protocol_
        ]
  toJSON CallStateHangingUp =
    A.object
      [ "@type" A..= T.String "callStateHangingUp"
      ]
  toJSON
    CallStateDiscarded
      { need_log = need_log_,
        need_debug_information = need_debug_information_,
        need_rating = need_rating_,
        reason = reason_
      } =
      A.object
        [ "@type" A..= T.String "callStateDiscarded",
          "need_log" A..= need_log_,
          "need_debug_information" A..= need_debug_information_,
          "need_rating" A..= need_rating_,
          "reason" A..= reason_
        ]
  toJSON
    CallStateError
      { _error = _error_
      } =
      A.object
        [ "@type" A..= T.String "callStateError",
          "error" A..= _error_
        ]
