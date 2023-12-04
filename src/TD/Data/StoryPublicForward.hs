module TD.Data.StoryPublicForward
  (StoryPublicForward(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message
import qualified TD.Data.Story as Story

-- | Describes a public forward or repost of a story
data StoryPublicForward
  = StoryPublicForwardMessage -- ^ Contains a public forward of a story as a message
    { message :: Maybe Message.Message -- ^ Information about the message with the story
    }
  | StoryPublicForwardStory -- ^ Contains a public repost of a story as a story
    { story :: Maybe Story.Story -- ^ Information about the reposted story
    }
  deriving (Eq, Show)

instance I.ShortShow StoryPublicForward where
  shortShow StoryPublicForwardMessage
    { message = message_
    }
      = "StoryPublicForwardMessage"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  shortShow StoryPublicForwardStory
    { story = story_
    }
      = "StoryPublicForwardStory"
        ++ I.cc
        [ "story" `I.p` story_
        ]

instance AT.FromJSON StoryPublicForward where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyPublicForwardMessage" -> parseStoryPublicForwardMessage v
      "storyPublicForwardStory"   -> parseStoryPublicForwardStory v
      _                           -> mempty
    
    where
      parseStoryPublicForwardMessage :: A.Value -> AT.Parser StoryPublicForward
      parseStoryPublicForwardMessage = A.withObject "StoryPublicForwardMessage" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ StoryPublicForwardMessage
          { message = message_
          }
      parseStoryPublicForwardStory :: A.Value -> AT.Parser StoryPublicForward
      parseStoryPublicForwardStory = A.withObject "StoryPublicForwardStory" $ \o -> do
        story_ <- o A..:?  "story"
        pure $ StoryPublicForwardStory
          { story = story_
          }
  parseJSON _ = mempty

