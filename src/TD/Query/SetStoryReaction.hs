{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetStoryReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
-- Changes chosen reaction on a story
data SetStoryReaction = SetStoryReaction
  { -- | Pass true if the reaction needs to be added to recent reactions
    update_recent_reactions :: Maybe Bool,
    -- | Type of the reaction to set; pass null to remove the reaction. `reactionTypeCustomEmoji` reactions can be used only by Telegram Premium users
    reaction_type :: Maybe ReactionType.ReactionType,
    -- | The identifier of the story
    story_id :: Maybe Int,
    -- | The identifier of the sender of the story
    story_sender_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetStoryReaction where
  show
    SetStoryReaction
      { update_recent_reactions = update_recent_reactions_,
        reaction_type = reaction_type_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      "SetStoryReaction"
        ++ U.cc
          [ U.p "update_recent_reactions" update_recent_reactions_,
            U.p "reaction_type" reaction_type_,
            U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_
          ]

instance T.ToJSON SetStoryReaction where
  toJSON
    SetStoryReaction
      { update_recent_reactions = update_recent_reactions_,
        reaction_type = reaction_type_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setStoryReaction",
          "update_recent_reactions" A..= update_recent_reactions_,
          "reaction_type" A..= reaction_type_,
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_
        ]
