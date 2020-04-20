-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SecretChatState as SecretChatState

--main = putStrLn "ok"

data SecretChat = 
 SecretChat { layer :: Int, key_hash :: String, ttl :: Int, is_outbound :: Bool, state :: SecretChatState.SecretChatState, user_id :: Int, _id :: Int }  -- deriving (Show)

instance T.ToJSON SecretChat where
 toJSON (SecretChat { layer = layer, key_hash = key_hash, ttl = ttl, is_outbound = is_outbound, state = state, user_id = user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "secretChat", "layer" A..= layer, "key_hash" A..= key_hash, "ttl" A..= ttl, "is_outbound" A..= is_outbound, "state" A..= state, "user_id" A..= user_id, "id" A..= _id ]
-- secretChat SecretChat  { layer :: Int, key_hash :: String, ttl :: Int, is_outbound :: Bool, state :: SecretChatState.SecretChatState, user_id :: Int, _id :: Int } 

