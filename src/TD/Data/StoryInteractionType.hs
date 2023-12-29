module TD.Data.StoryInteractionType
  (StoryInteractionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified TD.Data.Message as Message
import qualified TD.Data.Story as Story

-- | Describes type of interaction with a story
data StoryInteractionType
  = StoryInteractionTypeView -- ^ A view of the story
    { chosen_reaction_type :: Maybe ReactionType.ReactionType -- ^ Type of the reaction that was chosen by the viewer; may be null if none
    }
  | StoryInteractionTypeForward -- ^ A forward of the story as a message
    { message :: Maybe Message.Message -- ^ The message with story forward
    }
  | StoryInteractionTypeRepost -- ^ A repost of the story as a story
    { story :: Maybe Story.Story -- ^ The reposted story
    }
  deriving (Eq, Show)

instance I.ShortShow StoryInteractionType where
  shortShow StoryInteractionTypeView
    { chosen_reaction_type = chosen_reaction_type_
    }
      = "StoryInteractionTypeView"
        ++ I.cc
        [ "chosen_reaction_type" `I.p` chosen_reaction_type_
        ]
  shortShow StoryInteractionTypeForward
    { message = message_
    }
      = "StoryInteractionTypeForward"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  shortShow StoryInteractionTypeRepost
    { story = story_
    }
      = "StoryInteractionTypeRepost"
        ++ I.cc
        [ "story" `I.p` story_
        ]

instance AT.FromJSON StoryInteractionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyInteractionTypeView"    -> parseStoryInteractionTypeView v
      "storyInteractionTypeForward" -> parseStoryInteractionTypeForward v
      "storyInteractionTypeRepost"  -> parseStoryInteractionTypeRepost v
      _                             -> mempty
    
    where
      parseStoryInteractionTypeView :: A.Value -> AT.Parser StoryInteractionType
      parseStoryInteractionTypeView = A.withObject "StoryInteractionTypeView" $ \o -> do
        chosen_reaction_type_ <- o A..:?  "chosen_reaction_type"
        pure $ StoryInteractionTypeView
          { chosen_reaction_type = chosen_reaction_type_
          }
      parseStoryInteractionTypeForward :: A.Value -> AT.Parser StoryInteractionType
      parseStoryInteractionTypeForward = A.withObject "StoryInteractionTypeForward" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ StoryInteractionTypeForward
          { message = message_
          }
      parseStoryInteractionTypeRepost :: A.Value -> AT.Parser StoryInteractionType
      parseStoryInteractionTypeRepost = A.withObject "StoryInteractionTypeRepost" $ \o -> do
        story_ <- o A..:?  "story"
        pure $ StoryInteractionTypeRepost
          { story = story_
          }
  parseJSON _ = mempty

