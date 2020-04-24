-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallState where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallConnection as CallConnection
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol
import {-# SOURCE #-} qualified API.CallDiscardReason as CallDiscardReason
import {-# SOURCE #-} qualified API.Error as Error

data CallState = 
 CallStatePending { is_received :: Maybe Bool, is_created :: Maybe Bool }  
 | CallStateExchangingKeys 
 | CallStateReady { allow_p2p :: Maybe Bool, emojis :: Maybe [String], encryption_key :: Maybe String, config :: Maybe String, connections :: Maybe [CallConnection.CallConnection], protocol :: Maybe CallProtocol.CallProtocol }  
 | CallStateHangingUp 
 | CallStateDiscarded { need_debug_information :: Maybe Bool, need_rating :: Maybe Bool, reason :: Maybe CallDiscardReason.CallDiscardReason }  
 | CallStateError { _error :: Maybe Error.Error }  deriving (Show, Eq)

instance T.ToJSON CallState where
 toJSON (CallStatePending { is_received = is_received, is_created = is_created }) =
  A.object [ "@type" A..= T.String "callStatePending", "is_received" A..= is_received, "is_created" A..= is_created ]

 toJSON (CallStateExchangingKeys {  }) =
  A.object [ "@type" A..= T.String "callStateExchangingKeys" ]

 toJSON (CallStateReady { allow_p2p = allow_p2p, emojis = emojis, encryption_key = encryption_key, config = config, connections = connections, protocol = protocol }) =
  A.object [ "@type" A..= T.String "callStateReady", "allow_p2p" A..= allow_p2p, "emojis" A..= emojis, "encryption_key" A..= encryption_key, "config" A..= config, "connections" A..= connections, "protocol" A..= protocol ]

 toJSON (CallStateHangingUp {  }) =
  A.object [ "@type" A..= T.String "callStateHangingUp" ]

 toJSON (CallStateDiscarded { need_debug_information = need_debug_information, need_rating = need_rating, reason = reason }) =
  A.object [ "@type" A..= T.String "callStateDiscarded", "need_debug_information" A..= need_debug_information, "need_rating" A..= need_rating, "reason" A..= reason ]

 toJSON (CallStateError { _error = _error }) =
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
    is_received <- optional $ o A..: "is_received"
    is_created <- optional $ o A..: "is_created"
    return $ CallStatePending { is_received = is_received, is_created = is_created }

   parseCallStateExchangingKeys :: A.Value -> T.Parser CallState
   parseCallStateExchangingKeys = A.withObject "CallStateExchangingKeys" $ \o -> do
    return $ CallStateExchangingKeys {  }

   parseCallStateReady :: A.Value -> T.Parser CallState
   parseCallStateReady = A.withObject "CallStateReady" $ \o -> do
    allow_p2p <- optional $ o A..: "allow_p2p"
    emojis <- optional $ o A..: "emojis"
    encryption_key <- optional $ o A..: "encryption_key"
    config <- optional $ o A..: "config"
    connections <- optional $ o A..: "connections"
    protocol <- optional $ o A..: "protocol"
    return $ CallStateReady { allow_p2p = allow_p2p, emojis = emojis, encryption_key = encryption_key, config = config, connections = connections, protocol = protocol }

   parseCallStateHangingUp :: A.Value -> T.Parser CallState
   parseCallStateHangingUp = A.withObject "CallStateHangingUp" $ \o -> do
    return $ CallStateHangingUp {  }

   parseCallStateDiscarded :: A.Value -> T.Parser CallState
   parseCallStateDiscarded = A.withObject "CallStateDiscarded" $ \o -> do
    need_debug_information <- optional $ o A..: "need_debug_information"
    need_rating <- optional $ o A..: "need_rating"
    reason <- optional $ o A..: "reason"
    return $ CallStateDiscarded { need_debug_information = need_debug_information, need_rating = need_rating, reason = reason }

   parseCallStateError :: A.Value -> T.Parser CallState
   parseCallStateError = A.withObject "CallStateError" $ \o -> do
    _error <- optional $ o A..: "error"
    return $ CallStateError { _error = _error }