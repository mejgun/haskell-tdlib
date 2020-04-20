-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallConnection as CallConnection
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol
import {-# SOURCE #-} qualified API.CallDiscardReason as CallDiscardReason
import {-# SOURCE #-} qualified API.Error as Error

--main = putStrLn "ok"

data CallState = 
 CallStatePending { is_received :: Bool, is_created :: Bool }  
 | CallStateExchangingKeys 
 | CallStateReady { allow_p2p :: Bool, emojis :: [String], encryption_key :: String, config :: String, connections :: [CallConnection.CallConnection], protocol :: CallProtocol.CallProtocol }  
 | CallStateHangingUp 
 | CallStateDiscarded { need_debug_information :: Bool, need_rating :: Bool, reason :: CallDiscardReason.CallDiscardReason }  
 | CallStateError { _error :: Error.Error }  -- deriving (Show)

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
-- callStatePending CallState  { is_received :: Bool, is_created :: Bool } 

-- callStateExchangingKeys CallState 

-- callStateReady CallState  { allow_p2p :: Bool, emojis :: [String], encryption_key :: String, config :: String, connections :: [CallConnection.CallConnection], protocol :: CallProtocol.CallProtocol } 

-- callStateHangingUp CallState 

-- callStateDiscarded CallState  { need_debug_information :: Bool, need_rating :: Bool, reason :: CallDiscardReason.CallDiscardReason } 

-- callStateError CallState  { _error :: Error.Error } 



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
  where
   parseCallStatePending :: A.Value -> T.Parser CallState
   parseCallStatePending = A.withObject "CallStatePending" $ \o -> do
    is_received <- o A..: "is_received"
    is_created <- o A..: "is_created"
    return $ CallStatePending { is_received = is_received, is_created = is_created }

   parseCallStateExchangingKeys :: A.Value -> T.Parser CallState
   parseCallStateExchangingKeys = A.withObject "CallStateExchangingKeys" $ \o -> do
    return $ CallStateExchangingKeys {  }

   parseCallStateReady :: A.Value -> T.Parser CallState
   parseCallStateReady = A.withObject "CallStateReady" $ \o -> do
    allow_p2p <- o A..: "allow_p2p"
    emojis <- o A..: "emojis"
    encryption_key <- o A..: "encryption_key"
    config <- o A..: "config"
    connections <- o A..: "connections"
    protocol <- o A..: "protocol"
    return $ CallStateReady { allow_p2p = allow_p2p, emojis = emojis, encryption_key = encryption_key, config = config, connections = connections, protocol = protocol }

   parseCallStateHangingUp :: A.Value -> T.Parser CallState
   parseCallStateHangingUp = A.withObject "CallStateHangingUp" $ \o -> do
    return $ CallStateHangingUp {  }

   parseCallStateDiscarded :: A.Value -> T.Parser CallState
   parseCallStateDiscarded = A.withObject "CallStateDiscarded" $ \o -> do
    need_debug_information <- o A..: "need_debug_information"
    need_rating <- o A..: "need_rating"
    reason <- o A..: "reason"
    return $ CallStateDiscarded { need_debug_information = need_debug_information, need_rating = need_rating, reason = reason }

   parseCallStateError :: A.Value -> T.Parser CallState
   parseCallStateError = A.withObject "CallStateError" $ \o -> do
    _error <- o A..: "error"
    return $ CallStateError { _error = _error }