{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatAvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- | Describes reactions available in the chat
data ChatAvailableReactions
  = -- | All reactions are available in the chat
    ChatAvailableReactionsAll
  | -- | Only specific reactions are available in the chat @reactions The list of reactions
    ChatAvailableReactionsSome
      { -- |
        reactions :: Maybe [ReactionType.ReactionType]
      }
  deriving (Eq)

instance Show ChatAvailableReactions where
  show ChatAvailableReactionsAll =
    "ChatAvailableReactionsAll"
      ++ U.cc
        []
  show
    ChatAvailableReactionsSome
      { reactions = reactions_
      } =
      "ChatAvailableReactionsSome"
        ++ U.cc
          [ U.p "reactions" reactions_
          ]

instance T.FromJSON ChatAvailableReactions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatAvailableReactionsAll" -> parseChatAvailableReactionsAll v
      "chatAvailableReactionsSome" -> parseChatAvailableReactionsSome v
      _ -> mempty
    where
      parseChatAvailableReactionsAll :: A.Value -> T.Parser ChatAvailableReactions
      parseChatAvailableReactionsAll = A.withObject "ChatAvailableReactionsAll" $ \_ -> return ChatAvailableReactionsAll

      parseChatAvailableReactionsSome :: A.Value -> T.Parser ChatAvailableReactions
      parseChatAvailableReactionsSome = A.withObject "ChatAvailableReactionsSome" $ \o -> do
        reactions_ <- o A..:? "reactions"
        return $ ChatAvailableReactionsSome {reactions = reactions_}
  parseJSON _ = mempty

instance T.ToJSON ChatAvailableReactions where
  toJSON ChatAvailableReactionsAll =
    A.object
      [ "@type" A..= T.String "chatAvailableReactionsAll"
      ]
  toJSON
    ChatAvailableReactionsSome
      { reactions = reactions_
      } =
      A.object
        [ "@type" A..= T.String "chatAvailableReactionsSome",
          "reactions" A..= reactions_
        ]
