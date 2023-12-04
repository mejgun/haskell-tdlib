module TD.Data.StoryOrigin
  (StoryOrigin(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains information about the origin of a story that was reposted
data StoryOrigin
  = StoryOriginPublicStory -- ^ The original story was a public story with known sender
    { chat_id  :: Maybe Int -- ^ Identifier of the chat that posted original story
    , story_id :: Maybe Int -- ^ Story identifier of the original story
    }
  | StoryOriginHiddenUser -- ^ The original story was sent by an unknown user
    { sender_name :: Maybe T.Text -- ^ Name of the story sender
    }
  deriving (Eq, Show)

instance I.ShortShow StoryOrigin where
  shortShow StoryOriginPublicStory
    { chat_id  = chat_id_
    , story_id = story_id_
    }
      = "StoryOriginPublicStory"
        ++ I.cc
        [ "chat_id"  `I.p` chat_id_
        , "story_id" `I.p` story_id_
        ]
  shortShow StoryOriginHiddenUser
    { sender_name = sender_name_
    }
      = "StoryOriginHiddenUser"
        ++ I.cc
        [ "sender_name" `I.p` sender_name_
        ]

instance AT.FromJSON StoryOrigin where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyOriginPublicStory" -> parseStoryOriginPublicStory v
      "storyOriginHiddenUser"  -> parseStoryOriginHiddenUser v
      _                        -> mempty
    
    where
      parseStoryOriginPublicStory :: A.Value -> AT.Parser StoryOrigin
      parseStoryOriginPublicStory = A.withObject "StoryOriginPublicStory" $ \o -> do
        chat_id_  <- o A..:?  "chat_id"
        story_id_ <- o A..:?  "story_id"
        pure $ StoryOriginPublicStory
          { chat_id  = chat_id_
          , story_id = story_id_
          }
      parseStoryOriginHiddenUser :: A.Value -> AT.Parser StoryOrigin
      parseStoryOriginHiddenUser = A.withObject "StoryOriginHiddenUser" $ \o -> do
        sender_name_ <- o A..:?  "sender_name"
        pure $ StoryOriginHiddenUser
          { sender_name = sender_name_
          }
  parseJSON _ = mempty

