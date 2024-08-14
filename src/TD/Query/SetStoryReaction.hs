module TD.Query.SetStoryReaction
  (SetStoryReaction(..)
  , defaultSetStoryReaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

-- | Changes chosen reaction on a story that has already been sent. Returns 'TD.Data.Ok.Ok'
data SetStoryReaction
  = SetStoryReaction
    { story_sender_chat_id    :: Maybe Int                       -- ^ The identifier of the sender of the story
    , story_id                :: Maybe Int                       -- ^ The identifier of the story
    , reaction_type           :: Maybe ReactionType.ReactionType -- ^ Type of the reaction to set; pass null to remove the reaction. Custom emoji reactions can be used only by Telegram Premium users. Paid reactions can't be set
    , update_recent_reactions :: Maybe Bool                      -- ^ Pass true if the reaction needs to be added to recent reactions
    }
  deriving (Eq, Show)

instance I.ShortShow SetStoryReaction where
  shortShow
    SetStoryReaction
      { story_sender_chat_id    = story_sender_chat_id_
      , story_id                = story_id_
      , reaction_type           = reaction_type_
      , update_recent_reactions = update_recent_reactions_
      }
        = "SetStoryReaction"
          ++ I.cc
          [ "story_sender_chat_id"    `I.p` story_sender_chat_id_
          , "story_id"                `I.p` story_id_
          , "reaction_type"           `I.p` reaction_type_
          , "update_recent_reactions" `I.p` update_recent_reactions_
          ]

instance AT.ToJSON SetStoryReaction where
  toJSON
    SetStoryReaction
      { story_sender_chat_id    = story_sender_chat_id_
      , story_id                = story_id_
      , reaction_type           = reaction_type_
      , update_recent_reactions = update_recent_reactions_
      }
        = A.object
          [ "@type"                   A..= AT.String "setStoryReaction"
          , "story_sender_chat_id"    A..= story_sender_chat_id_
          , "story_id"                A..= story_id_
          , "reaction_type"           A..= reaction_type_
          , "update_recent_reactions" A..= update_recent_reactions_
          ]

defaultSetStoryReaction :: SetStoryReaction
defaultSetStoryReaction =
  SetStoryReaction
    { story_sender_chat_id    = Nothing
    , story_id                = Nothing
    , reaction_type           = Nothing
    , update_recent_reactions = Nothing
    }

