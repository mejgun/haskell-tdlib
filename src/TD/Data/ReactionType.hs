module TD.Data.ReactionType
  (ReactionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes type of message reaction
data ReactionType
  = ReactionTypeEmoji -- ^ A reaction with an emoji
    { emoji :: Maybe T.Text -- ^ Text representation of the reaction
    }
  | ReactionTypeCustomEmoji -- ^ A reaction with a custom emoji
    { custom_emoji_id :: Maybe Int -- ^ Unique identifier of the custom emoji
    }
  | ReactionTypePaid -- ^ The paid reaction in a channel chat
  deriving (Eq, Show)

instance I.ShortShow ReactionType where
  shortShow ReactionTypeEmoji
    { emoji = emoji_
    }
      = "ReactionTypeEmoji"
        ++ I.cc
        [ "emoji" `I.p` emoji_
        ]
  shortShow ReactionTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = "ReactionTypeCustomEmoji"
        ++ I.cc
        [ "custom_emoji_id" `I.p` custom_emoji_id_
        ]
  shortShow ReactionTypePaid
      = "ReactionTypePaid"

instance AT.FromJSON ReactionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reactionTypeEmoji"       -> parseReactionTypeEmoji v
      "reactionTypeCustomEmoji" -> parseReactionTypeCustomEmoji v
      "reactionTypePaid"        -> pure ReactionTypePaid
      _                         -> mempty
    
    where
      parseReactionTypeEmoji :: A.Value -> AT.Parser ReactionType
      parseReactionTypeEmoji = A.withObject "ReactionTypeEmoji" $ \o -> do
        emoji_ <- o A..:?  "emoji"
        pure $ ReactionTypeEmoji
          { emoji = emoji_
          }
      parseReactionTypeCustomEmoji :: A.Value -> AT.Parser ReactionType
      parseReactionTypeCustomEmoji = A.withObject "ReactionTypeCustomEmoji" $ \o -> do
        custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        pure $ ReactionTypeCustomEmoji
          { custom_emoji_id = custom_emoji_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON ReactionType where
  toJSON ReactionTypeEmoji
    { emoji = emoji_
    }
      = A.object
        [ "@type" A..= AT.String "reactionTypeEmoji"
        , "emoji" A..= emoji_
        ]
  toJSON ReactionTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = A.object
        [ "@type"           A..= AT.String "reactionTypeCustomEmoji"
        , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
        ]
  toJSON ReactionTypePaid
      = A.object
        [ "@type" A..= AT.String "reactionTypePaid"
        ]

