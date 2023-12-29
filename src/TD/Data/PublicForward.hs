module TD.Data.PublicForward
  (PublicForward(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message
import qualified TD.Data.Story as Story

-- | Describes a public forward or repost of a story
data PublicForward
  = PublicForwardMessage -- ^ Contains a public forward as a message
    { message :: Maybe Message.Message -- ^ Information about the message
    }
  | PublicForwardStory -- ^ Contains a public repost to a story
    { story :: Maybe Story.Story -- ^ Information about the story
    }
  deriving (Eq, Show)

instance I.ShortShow PublicForward where
  shortShow PublicForwardMessage
    { message = message_
    }
      = "PublicForwardMessage"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  shortShow PublicForwardStory
    { story = story_
    }
      = "PublicForwardStory"
        ++ I.cc
        [ "story" `I.p` story_
        ]

instance AT.FromJSON PublicForward where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "publicForwardMessage" -> parsePublicForwardMessage v
      "publicForwardStory"   -> parsePublicForwardStory v
      _                      -> mempty
    
    where
      parsePublicForwardMessage :: A.Value -> AT.Parser PublicForward
      parsePublicForwardMessage = A.withObject "PublicForwardMessage" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ PublicForwardMessage
          { message = message_
          }
      parsePublicForwardStory :: A.Value -> AT.Parser PublicForward
      parsePublicForwardStory = A.withObject "PublicForwardStory" $ \o -> do
        story_ <- o A..:?  "story"
        pure $ PublicForwardStory
          { story = story_
          }
  parseJSON _ = mempty

