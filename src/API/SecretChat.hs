-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SecretChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SecretChatState as SecretChatState

-- |
-- 
-- Represents a secret chat
-- 
-- __id__ Secret chat identifier
-- 
-- __user_id__ Identifier of the chat partner
-- 
-- __state__ State of the secret chat
-- 
-- __is_outbound__ True, if the chat was created by the current user; otherwise false
-- 
-- __ttl__ Current message Time To Live setting (self-destruct timer) for the chat, in seconds
-- 
-- __key_hash__ Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 little-endian bytes, which must be split into groups of 2 bits, each denoting a pixel of one of 4 colors FFFFFF, D5E6F3, 2D5775, and 2F99C9.
-- 
-- -The pixels must be used to make a 12x12 square image filled from left to right, top to bottom. Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers
-- 
-- __layer__ Secret chat layer; determines features supported by the other client. Video notes are supported if the layer >= 66; nested text entities and underline and strikethrough entities are supported if the layer >= 101
data SecretChat = 

 SecretChat { layer :: Maybe Int, key_hash :: Maybe String, ttl :: Maybe Int, is_outbound :: Maybe Bool, state :: Maybe SecretChatState.SecretChatState, user_id :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

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
    layer <- mconcat [ o A..:? "layer", readMaybe <$> (o A..: "layer" :: T.Parser String)] :: T.Parser (Maybe Int)
    key_hash <- o A..:? "key_hash"
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_outbound <- o A..:? "is_outbound"
    state <- o A..:? "state"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SecretChat { layer = layer, key_hash = key_hash, ttl = ttl, is_outbound = is_outbound, state = state, user_id = user_id, _id = _id }