-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SecretChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SecretChatState as SecretChatState

data SecretChat = 
 SecretChat { layer :: Maybe Int, key_hash :: Maybe String, ttl :: Maybe Int, is_outbound :: Maybe Bool, state :: Maybe SecretChatState.SecretChatState, user_id :: Maybe Int, _id :: Maybe Int }  deriving (Show)

instance T.ToJSON SecretChat where
 toJSON (SecretChat { layer = layer, key_hash = key_hash, ttl = ttl, is_outbound = is_outbound, state = state, user_id = user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "secretChat", "layer" A..= layer, "key_hash" A..= key_hash, "ttl" A..= ttl, "is_outbound" A..= is_outbound, "state" A..= state, "user_id" A..= user_id, "id" A..= _id ]

instance T.FromJSON SecretChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "secretChat" -> parseSecretChat v
   _ -> mempty
  where
   parseSecretChat :: A.Value -> T.Parser SecretChat
   parseSecretChat = A.withObject "SecretChat" $ \o -> do
    layer <- optional $ o A..: "layer"
    key_hash <- optional $ o A..: "key_hash"
    ttl <- optional $ o A..: "ttl"
    is_outbound <- optional $ o A..: "is_outbound"
    state <- optional $ o A..: "state"
    user_id <- optional $ o A..: "user_id"
    _id <- optional $ o A..: "id"
    return $ SecretChat { layer = layer, key_hash = key_hash, ttl = ttl, is_outbound = is_outbound, state = state, user_id = user_id, _id = _id }