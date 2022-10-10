{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AvailableReaction as AvailableReaction
import qualified Utils as U

-- |
data AvailableReactions = -- | Represents a list of reactions that can be added to a message
  AvailableReactions
  { -- | True, if custom emoji reactions could be added by Telegram Premium subscribers
    allow_custom_emoji :: Maybe Bool,
    -- | List of popular reactions
    popular_reactions :: Maybe [AvailableReaction.AvailableReaction],
    -- | List of recently used reactions
    recent_reactions :: Maybe [AvailableReaction.AvailableReaction],
    -- | List of reactions to be shown at the top
    top_reactions :: Maybe [AvailableReaction.AvailableReaction]
  }
  deriving (Eq)

instance Show AvailableReactions where
  show
    AvailableReactions
      { allow_custom_emoji = allow_custom_emoji_,
        popular_reactions = popular_reactions_,
        recent_reactions = recent_reactions_,
        top_reactions = top_reactions_
      } =
      "AvailableReactions"
        ++ U.cc
          [ U.p "allow_custom_emoji" allow_custom_emoji_,
            U.p "popular_reactions" popular_reactions_,
            U.p "recent_reactions" recent_reactions_,
            U.p "top_reactions" top_reactions_
          ]

instance T.FromJSON AvailableReactions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "availableReactions" -> parseAvailableReactions v
      _ -> mempty
    where
      parseAvailableReactions :: A.Value -> T.Parser AvailableReactions
      parseAvailableReactions = A.withObject "AvailableReactions" $ \o -> do
        allow_custom_emoji_ <- o A..:? "allow_custom_emoji"
        popular_reactions_ <- o A..:? "popular_reactions"
        recent_reactions_ <- o A..:? "recent_reactions"
        top_reactions_ <- o A..:? "top_reactions"
        return $ AvailableReactions {allow_custom_emoji = allow_custom_emoji_, popular_reactions = popular_reactions_, recent_reactions = recent_reactions_, top_reactions = top_reactions_}
  parseJSON _ = mempty

instance T.ToJSON AvailableReactions where
  toJSON
    AvailableReactions
      { allow_custom_emoji = allow_custom_emoji_,
        popular_reactions = popular_reactions_,
        recent_reactions = recent_reactions_,
        top_reactions = top_reactions_
      } =
      A.object
        [ "@type" A..= T.String "availableReactions",
          "allow_custom_emoji" A..= allow_custom_emoji_,
          "popular_reactions" A..= popular_reactions_,
          "recent_reactions" A..= recent_reactions_,
          "top_reactions" A..= top_reactions_
        ]
