module TD.Data.ChatAvailableReactions
  (ChatAvailableReactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

-- | Describes reactions available in the chat
data ChatAvailableReactions
  = ChatAvailableReactionsAll -- ^ All reactions are available in the chat, excluding the paid reaction and custom reactions in channel chats
    { max_reaction_count :: Maybe Int -- ^ The maximum allowed number of reactions per message; 1-11
    }
  | ChatAvailableReactionsSome -- ^ Only specific reactions are available in the chat
    { reactions          :: Maybe [ReactionType.ReactionType] -- ^ The list of reactions
    , max_reaction_count :: Maybe Int                         -- ^ The maximum allowed number of reactions per message; 1-11
    }
  deriving (Eq, Show)

instance I.ShortShow ChatAvailableReactions where
  shortShow ChatAvailableReactionsAll
    { max_reaction_count = max_reaction_count_
    }
      = "ChatAvailableReactionsAll"
        ++ I.cc
        [ "max_reaction_count" `I.p` max_reaction_count_
        ]
  shortShow ChatAvailableReactionsSome
    { reactions          = reactions_
    , max_reaction_count = max_reaction_count_
    }
      = "ChatAvailableReactionsSome"
        ++ I.cc
        [ "reactions"          `I.p` reactions_
        , "max_reaction_count" `I.p` max_reaction_count_
        ]

instance AT.FromJSON ChatAvailableReactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatAvailableReactionsAll"  -> parseChatAvailableReactionsAll v
      "chatAvailableReactionsSome" -> parseChatAvailableReactionsSome v
      _                            -> mempty
    
    where
      parseChatAvailableReactionsAll :: A.Value -> AT.Parser ChatAvailableReactions
      parseChatAvailableReactionsAll = A.withObject "ChatAvailableReactionsAll" $ \o -> do
        max_reaction_count_ <- o A..:?  "max_reaction_count"
        pure $ ChatAvailableReactionsAll
          { max_reaction_count = max_reaction_count_
          }
      parseChatAvailableReactionsSome :: A.Value -> AT.Parser ChatAvailableReactions
      parseChatAvailableReactionsSome = A.withObject "ChatAvailableReactionsSome" $ \o -> do
        reactions_          <- o A..:?  "reactions"
        max_reaction_count_ <- o A..:?  "max_reaction_count"
        pure $ ChatAvailableReactionsSome
          { reactions          = reactions_
          , max_reaction_count = max_reaction_count_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatAvailableReactions where
  toJSON ChatAvailableReactionsAll
    { max_reaction_count = max_reaction_count_
    }
      = A.object
        [ "@type"              A..= AT.String "chatAvailableReactionsAll"
        , "max_reaction_count" A..= max_reaction_count_
        ]
  toJSON ChatAvailableReactionsSome
    { reactions          = reactions_
    , max_reaction_count = max_reaction_count_
    }
      = A.object
        [ "@type"              A..= AT.String "chatAvailableReactionsSome"
        , "reactions"          A..= reactions_
        , "max_reaction_count" A..= max_reaction_count_
        ]

