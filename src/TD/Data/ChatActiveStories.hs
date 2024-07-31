module TD.Data.ChatActiveStories
  (ChatActiveStories(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryList as StoryList
import qualified TD.Data.StoryInfo as StoryInfo

data ChatActiveStories
  = ChatActiveStories -- ^ Describes active stories posted by a chat
    { chat_id           :: Maybe Int                   -- ^ Identifier of the chat that posted the stories
    , list              :: Maybe StoryList.StoryList   -- ^ Identifier of the story list in which the stories are shown; may be null if the stories aren't shown in a story list
    , order             :: Maybe Int                   -- ^ A parameter used to determine order of the stories in the story list; 0 if the stories doesn't need to be shown in the story list. Stories must be sorted by the pair (order, story_sender_chat_id) in descending order
    , max_read_story_id :: Maybe Int                   -- ^ Identifier of the last read active story
    , stories           :: Maybe [StoryInfo.StoryInfo] -- ^ Basic information about the stories; use getStory to get full information about the stories. The stories are in chronological order (i.e., in order of increasing story identifiers)
    }
  deriving (Eq, Show)

instance I.ShortShow ChatActiveStories where
  shortShow ChatActiveStories
    { chat_id           = chat_id_
    , list              = list_
    , order             = order_
    , max_read_story_id = max_read_story_id_
    , stories           = stories_
    }
      = "ChatActiveStories"
        ++ I.cc
        [ "chat_id"           `I.p` chat_id_
        , "list"              `I.p` list_
        , "order"             `I.p` order_
        , "max_read_story_id" `I.p` max_read_story_id_
        , "stories"           `I.p` stories_
        ]

instance AT.FromJSON ChatActiveStories where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatActiveStories" -> parseChatActiveStories v
      _                   -> mempty
    
    where
      parseChatActiveStories :: A.Value -> AT.Parser ChatActiveStories
      parseChatActiveStories = A.withObject "ChatActiveStories" $ \o -> do
        chat_id_           <- o A..:?  "chat_id"
        list_              <- o A..:?  "list"
        order_             <- o A..:?  "order"
        max_read_story_id_ <- o A..:?  "max_read_story_id"
        stories_           <- o A..:?  "stories"
        pure $ ChatActiveStories
          { chat_id           = chat_id_
          , list              = list_
          , order             = order_
          , max_read_story_id = max_read_story_id_
          , stories           = stories_
          }
  parseJSON _ = mempty

