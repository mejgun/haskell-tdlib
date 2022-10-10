{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ReactionType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes type of message reaction
data ReactionType
  = -- | A reaction with an emoji @emoji Text representation of the reaction
    ReactionTypeEmoji
      { -- |
        emoji :: Maybe String
      }
  | -- | A reaction with a custom emoji @custom_emoji_id Unique identifier of the custom emoji
    ReactionTypeCustomEmoji
      { -- |
        custom_emoji_id :: Maybe Int
      }
  deriving (Eq)

instance Show ReactionType where
  show
    ReactionTypeEmoji
      { emoji = emoji_
      } =
      "ReactionTypeEmoji"
        ++ U.cc
          [ U.p "emoji" emoji_
          ]
  show
    ReactionTypeCustomEmoji
      { custom_emoji_id = custom_emoji_id_
      } =
      "ReactionTypeCustomEmoji"
        ++ U.cc
          [ U.p "custom_emoji_id" custom_emoji_id_
          ]

instance T.FromJSON ReactionType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "reactionTypeEmoji" -> parseReactionTypeEmoji v
      "reactionTypeCustomEmoji" -> parseReactionTypeCustomEmoji v
      _ -> mempty
    where
      parseReactionTypeEmoji :: A.Value -> T.Parser ReactionType
      parseReactionTypeEmoji = A.withObject "ReactionTypeEmoji" $ \o -> do
        emoji_ <- o A..:? "emoji"
        return $ ReactionTypeEmoji {emoji = emoji_}

      parseReactionTypeCustomEmoji :: A.Value -> T.Parser ReactionType
      parseReactionTypeCustomEmoji = A.withObject "ReactionTypeCustomEmoji" $ \o -> do
        custom_emoji_id_ <- U.rm <$> (o A..:? "custom_emoji_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ ReactionTypeCustomEmoji {custom_emoji_id = custom_emoji_id_}
  parseJSON _ = mempty

instance T.ToJSON ReactionType where
  toJSON
    ReactionTypeEmoji
      { emoji = emoji_
      } =
      A.object
        [ "@type" A..= T.String "reactionTypeEmoji",
          "emoji" A..= emoji_
        ]
  toJSON
    ReactionTypeCustomEmoji
      { custom_emoji_id = custom_emoji_id_
      } =
      A.object
        [ "@type" A..= T.String "reactionTypeCustomEmoji",
          "custom_emoji_id" A..= U.toS custom_emoji_id_
        ]
