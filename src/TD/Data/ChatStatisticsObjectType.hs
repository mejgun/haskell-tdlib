module TD.Data.ChatStatisticsObjectType
  (ChatStatisticsObjectType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of object, for which statistics are provided
data ChatStatisticsObjectType
  = ChatStatisticsObjectTypeMessage -- ^ Describes a message sent in the chat
    { message_id :: Maybe Int -- ^ Message identifier
    }
  | ChatStatisticsObjectTypeStory -- ^ Describes a story sent by the chat
    { story_id :: Maybe Int -- ^ Story identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ChatStatisticsObjectType where
  shortShow ChatStatisticsObjectTypeMessage
    { message_id = message_id_
    }
      = "ChatStatisticsObjectTypeMessage"
        ++ I.cc
        [ "message_id" `I.p` message_id_
        ]
  shortShow ChatStatisticsObjectTypeStory
    { story_id = story_id_
    }
      = "ChatStatisticsObjectTypeStory"
        ++ I.cc
        [ "story_id" `I.p` story_id_
        ]

instance AT.FromJSON ChatStatisticsObjectType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatStatisticsObjectTypeMessage" -> parseChatStatisticsObjectTypeMessage v
      "chatStatisticsObjectTypeStory"   -> parseChatStatisticsObjectTypeStory v
      _                                 -> mempty
    
    where
      parseChatStatisticsObjectTypeMessage :: A.Value -> AT.Parser ChatStatisticsObjectType
      parseChatStatisticsObjectTypeMessage = A.withObject "ChatStatisticsObjectTypeMessage" $ \o -> do
        message_id_ <- o A..:?  "message_id"
        pure $ ChatStatisticsObjectTypeMessage
          { message_id = message_id_
          }
      parseChatStatisticsObjectTypeStory :: A.Value -> AT.Parser ChatStatisticsObjectType
      parseChatStatisticsObjectTypeStory = A.withObject "ChatStatisticsObjectTypeStory" $ \o -> do
        story_id_ <- o A..:?  "story_id"
        pure $ ChatStatisticsObjectTypeStory
          { story_id = story_id_
          }
  parseJSON _ = mempty

