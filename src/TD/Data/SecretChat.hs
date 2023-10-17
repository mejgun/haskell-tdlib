module TD.Data.SecretChat
  (SecretChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SecretChatState as SecretChatState
import qualified Data.ByteString as BS

data SecretChat
  = SecretChat -- ^ Represents a secret chat
    { _id         :: Maybe Int                             -- ^ Secret chat identifier
    , user_id     :: Maybe Int                             -- ^ Identifier of the chat partner
    , state       :: Maybe SecretChatState.SecretChatState -- ^ State of the secret chat
    , is_outbound :: Maybe Bool                            -- ^ True, if the chat was created by the current user; false otherwise
    , key_hash    :: Maybe BS.ByteString                   -- ^ Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 little-endian bytes, which must be split into groups of 2 bits, each denoting a pixel of one of 4 colors FFFFFF, D5E6F3, 2D5775, and 2F99C9. The pixels must be used to make a 12x12 square image filled from left to right, top to bottom. Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers
    , layer       :: Maybe Int                             -- ^ Secret chat layer; determines features supported by the chat partner's application. Nested text entities and underline and strikethrough entities are supported if the layer >= 101, files bigger than 2000MB are supported if the layer >= 143, spoiler and custom emoji text entities are supported if the layer >= 144
    }
  deriving (Eq, Show)

instance I.ShortShow SecretChat where
  shortShow SecretChat
    { _id         = _id_
    , user_id     = user_id_
    , state       = state_
    , is_outbound = is_outbound_
    , key_hash    = key_hash_
    , layer       = layer_
    }
      = "SecretChat"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "user_id"     `I.p` user_id_
        , "state"       `I.p` state_
        , "is_outbound" `I.p` is_outbound_
        , "key_hash"    `I.p` key_hash_
        , "layer"       `I.p` layer_
        ]

instance AT.FromJSON SecretChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "secretChat" -> parseSecretChat v
      _            -> mempty
    
    where
      parseSecretChat :: A.Value -> AT.Parser SecretChat
      parseSecretChat = A.withObject "SecretChat" $ \o -> do
        _id_         <- o A..:?                       "id"
        user_id_     <- o A..:?                       "user_id"
        state_       <- o A..:?                       "state"
        is_outbound_ <- o A..:?                       "is_outbound"
        key_hash_    <- fmap I.readBytes <$> o A..:?  "key_hash"
        layer_       <- o A..:?                       "layer"
        pure $ SecretChat
          { _id         = _id_
          , user_id     = user_id_
          , state       = state_
          , is_outbound = is_outbound_
          , key_hash    = key_hash_
          , layer       = layer_
          }
  parseJSON _ = mempty

