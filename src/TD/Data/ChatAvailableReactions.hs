module TD.Data.ChatAvailableReactions
  (ChatAvailableReactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

-- | Describes reactions available in the chat
data ChatAvailableReactions
  = ChatAvailableReactionsAll -- ^ All reactions are available in the chat
  | ChatAvailableReactionsSome -- ^ Only specific reactions are available in the chat
    { reactions :: Maybe [ReactionType.ReactionType] -- ^ The list of reactions
    }
  deriving (Eq)

instance Show ChatAvailableReactions where
  show ChatAvailableReactionsAll
      = "ChatAvailableReactionsAll"
  show ChatAvailableReactionsSome
    { reactions = reactions_
    }
      = "ChatAvailableReactionsSome"
        ++ I.cc
        [ "reactions" `I.p` reactions_
        ]

instance AT.FromJSON ChatAvailableReactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatAvailableReactionsAll"  -> pure ChatAvailableReactionsAll
      "chatAvailableReactionsSome" -> parseChatAvailableReactionsSome v
      _                            -> mempty
    
    where
      parseChatAvailableReactionsSome :: A.Value -> AT.Parser ChatAvailableReactions
      parseChatAvailableReactionsSome = A.withObject "ChatAvailableReactionsSome" $ \o -> do
        reactions_ <- o A..:?  "reactions"
        pure $ ChatAvailableReactionsSome
          { reactions = reactions_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatAvailableReactions where
  toJSON ChatAvailableReactionsAll
      = A.object
        [ "@type" A..= AT.String "chatAvailableReactionsAll"
        ]
  toJSON ChatAvailableReactionsSome
    { reactions = reactions_
    }
      = A.object
        [ "@type"     A..= AT.String "chatAvailableReactionsSome"
        , "reactions" A..= reactions_
        ]

