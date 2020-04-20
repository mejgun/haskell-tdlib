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

