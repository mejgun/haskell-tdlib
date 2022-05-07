{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.SecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.SecretChatState as SecretChatState
import qualified Utils as U

data SecretChat = -- | Represents a secret chat
  SecretChat
  { -- | Secret chat layer; determines features supported by the chat partner's application. Nested text entities and underline and strikethrough entities are supported if the layer >= 101
    layer :: Maybe Int,
    -- | Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 little-endian bytes, which must be split into groups of 2 bits, each denoting a pixel of one of 4 colors FFFFFF, D5E6F3, 2D5775, and 2F99C9.
    -- The pixels must be used to make a 12x12 square image filled from left to right, top to bottom. Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers
    key_hash :: Maybe String,
    -- | True, if the chat was created by the current user; otherwise false
    is_outbound :: Maybe Bool,
    -- | State of the secret chat
    state :: Maybe SecretChatState.SecretChatState,
    -- | Identifier of the chat partner
    user_id :: Maybe Int,
    -- | Secret chat identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show SecretChat where
  show
    SecretChat
      { layer = layer,
        key_hash = key_hash,
        is_outbound = is_outbound,
        state = state,
        user_id = user_id,
        _id = _id
      } =
      "SecretChat"
        ++ U.cc
          [ U.p "layer" layer,
            U.p "key_hash" key_hash,
            U.p "is_outbound" is_outbound,
            U.p "state" state,
            U.p "user_id" user_id,
            U.p "_id" _id
          ]

instance T.FromJSON SecretChat where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "secretChat" -> parseSecretChat v
      _ -> fail ""
    where
      parseSecretChat :: A.Value -> T.Parser SecretChat
      parseSecretChat = A.withObject "SecretChat" $ \o -> do
        layer_ <- mconcat [o A..:? "layer", U.rm <$> (o A..: "layer" :: T.Parser String)] :: T.Parser (Maybe Int)
        key_hash_ <- o A..:? "key_hash"
        is_outbound_ <- o A..:? "is_outbound"
        state_ <- o A..:? "state"
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ SecretChat {layer = layer_, key_hash = key_hash_, is_outbound = is_outbound_, state = state_, user_id = user_id_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON SecretChat where
  toJSON
    SecretChat
      { layer = layer,
        key_hash = key_hash,
        is_outbound = is_outbound,
        state = state,
        user_id = user_id,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "secretChat",
          "layer" A..= layer,
          "key_hash" A..= key_hash,
          "is_outbound" A..= is_outbound,
          "state" A..= state,
          "user_id" A..= user_id,
          "id" A..= _id
        ]
