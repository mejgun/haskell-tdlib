{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddMessageReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
-- Adds a reaction to a message. Use getMessageAvailableReactions to receive the list of available reactions for the message
data AddMessageReaction = AddMessageReaction
  { -- | Pass true if the reaction needs to be added to recent reactions
    update_recent_reactions :: Maybe Bool,
    -- | Pass true if the reaction is added with a big animation
    is_big :: Maybe Bool,
    -- | Type of the reaction to add
    reaction_type :: Maybe ReactionType.ReactionType,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddMessageReaction where
  show
    AddMessageReaction
      { update_recent_reactions = update_recent_reactions_,
        is_big = is_big_,
        reaction_type = reaction_type_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "AddMessageReaction"
        ++ U.cc
          [ U.p "update_recent_reactions" update_recent_reactions_,
            U.p "is_big" is_big_,
            U.p "reaction_type" reaction_type_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON AddMessageReaction where
  toJSON
    AddMessageReaction
      { update_recent_reactions = update_recent_reactions_,
        is_big = is_big_,
        reaction_type = reaction_type_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "addMessageReaction",
          "update_recent_reactions" A..= update_recent_reactions_,
          "is_big" A..= is_big_,
          "reaction_type" A..= reaction_type_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
