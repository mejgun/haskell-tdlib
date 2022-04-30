-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.CallServer as CallServer
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol
import {-# SOURCE #-} qualified API.CallDiscardReason as CallDiscardReason
import {-# SOURCE #-} qualified API.Error as Error

-- |
-- 
-- Describes the current call state
data CallState = 
 -- |
 -- 
 -- The call is pending, waiting to be accepted by a user 
 -- 
 -- __is_created__ True, if the call has already been created by the server
 -- 
 -- __is_received__ True, if the call has already been received by the other party
 CallStatePending { is_received :: Maybe Bool, is_created :: Maybe Bool }  |
 -- |
 -- 
 -- The call has been answered and encryption keys are being exchanged
 CallStateExchangingKeys |
 -- |
 -- 
 -- The call is ready to use 
 -- 
 -- __protocol__ Call protocols supported by the peer
 -- 
 -- __servers__ List of available call servers
 -- 
 -- __config__ A JSON-encoded call config
 -- 
 -- __encryption_key__ Call encryption key
 -- 
 -- __emojis__ Encryption key emojis fingerprint
 -- 
 -- __allow_p2p__ True, if peer-to-peer connection is allowed by users privacy settings
 CallStateReady { allow_p2p :: Maybe Bool, emojis :: Maybe [String], encryption_key :: Maybe String, config :: Maybe String, servers :: Maybe [CallServer.CallServer], protocol :: Maybe CallProtocol.CallProtocol }  |
 -- |
 -- 
 -- The call is hanging up after discardCall has been called
 CallStateHangingUp |
 -- |
 -- 
 -- The call has ended successfully 
 -- 
 -- __reason__ The reason, why the call has ended
 -- 
 -- __need_rating__ True, if the call rating must be sent to the server
 -- 
 -- __need_debug_information__ True, if the call debug information must be sent to the server
 -- 
 -- __need_log__ True, if the call log must be sent to the server
 CallStateDiscarded { need_log :: Maybe Bool, need_debug_information :: Maybe Bool, need_rating :: Maybe Bool, reason :: Maybe CallDiscardReason.CallDiscardReason }  |
 -- |
 -- 
 -- The call has ended with an error 
 -- 
 -- __error__ Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
 CallStateError { _error :: Maybe Error.Error }  deriving (Eq)

instance Show CallState where
 show CallStatePending { is_received=is_received, is_created=is_created } =
  "CallStatePending" ++ U.cc [U.p "is_received" is_received, U.p "is_created" is_created ]

 show CallStateExchangingKeys {  } =
  "CallStateExchangingKeys" ++ U.cc [ ]

 show CallStateReady { allow_p2p=allow_p2p, emojis=emojis, encryption_key=encryption_key, config=config, servers=servers, protocol=protocol } =
  "CallStateReady" ++ U.cc [U.p "allow_p2p" allow_p2p, U.p "emojis" emojis, U.p "encryption_key" encryption_key, U.p "config" config, U.p "servers" servers, U.p "protocol" protocol ]

 show CallStateHangingUp {  } =
  "CallStateHangingUp" ++ U.cc [ ]

 show CallStateDiscarded { need_log=need_log, need_debug_information=need_debug_information, need_rating=need_rating, reason=reason } =
  "CallStateDiscarded" ++ U.cc [U.p "need_log" need_log, U.p "need_debug_information" need_debug_information, U.p "need_rating" need_rating, U.p "reason" reason ]

 show CallStateError { _error=_error } =
  "CallStateError" ++ U.cc [U.p "_error" _error ]

instance T.ToJSON CallState where
 toJSON CallStatePending { is_received = is_received, is_created = is_created } =
  A.object [ "@type" A..= T.String "callStatePending", "is_received" A..= is_received, "is_created" A..= is_created ]

 toJSON CallStateExchangingKeys {  } =
  A.object [ "@type" A..= T.String "callStateExchangingKeys" ]

 toJSON CallStateReady { allow_p2p = allow_p2p, emojis = emojis, encryption_key = encryption_key, config = config, servers = servers, protocol = protocol } =
  A.object [ "@type" A..= T.String "callStateReady", "allow_p2p" A..= allow_p2p, "emojis" A..= emojis, "encryption_key" A..= encryption_key, "config" A..= config, "servers" A..= servers, "protocol" A..= protocol ]

 toJSON CallStateHangingUp {  } =
  A.object [ "@type" A..= T.String "callStateHangingUp" ]

 toJSON CallStateDiscarded { need_log = need_log, need_debug_information = need_debug_information, need_rating = need_rating, reason = reason } =
  A.object [ "@type" A..= T.String "callStateDiscarded", "need_log" A..= need_log, "need_debug_information" A..= need_debug_information, "need_rating" A..= need_rating, "reason" A..= reason ]

 toJSON CallStateError { _error = _error } =
  A.object [ "@type" A..= T.String "callStateError", "error" A..= _error ]

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
    is_received <- o A..:? "is_received"
    is_created <- o A..:? "is_created"
    return $ CallStatePending { is_received = is_received, is_created = is_created }

   parseCallStateExchangingKeys :: A.Value -> T.Parser CallState
   parseCallStateExchangingKeys = A.withObject "CallStateExchangingKeys" $ \o -> do
    return $ CallStateExchangingKeys {  }

   parseCallStateReady :: A.Value -> T.Parser CallState
   parseCallStateReady = A.withObject "CallStateReady" $ \o -> do
    allow_p2p <- o A..:? "allow_p2p"
    emojis <- o A..:? "emojis"
    encryption_key <- o A..:? "encryption_key"
    config <- o A..:? "config"
    servers <- o A..:? "servers"
    protocol <- o A..:? "protocol"
    return $ CallStateReady { allow_p2p = allow_p2p, emojis = emojis, encryption_key = encryption_key, config = config, servers = servers, protocol = protocol }

   parseCallStateHangingUp :: A.Value -> T.Parser CallState
   parseCallStateHangingUp = A.withObject "CallStateHangingUp" $ \o -> do
    return $ CallStateHangingUp {  }

   parseCallStateDiscarded :: A.Value -> T.Parser CallState
   parseCallStateDiscarded = A.withObject "CallStateDiscarded" $ \o -> do
    need_log <- o A..:? "need_log"
    need_debug_information <- o A..:? "need_debug_information"
    need_rating <- o A..:? "need_rating"
    reason <- o A..:? "reason"
    return $ CallStateDiscarded { need_log = need_log, need_debug_information = need_debug_information, need_rating = need_rating, reason = reason }

   parseCallStateError :: A.Value -> T.Parser CallState
   parseCallStateError = A.withObject "CallStateError" $ \o -> do
    _error <- o A..:? "error"
    return $ CallStateError { _error = _error }
 parseJSON _ = mempty
