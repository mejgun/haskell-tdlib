module TD.Data.ActiveStoryState
  (ActiveStoryState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes state of active stories posted by a chat
data ActiveStoryState
  = ActiveStoryStateLive -- ^ The chat has an active live story
    { story_id :: Maybe Int -- ^ Identifier of the active live story
    }
  | ActiveStoryStateUnread -- ^ The chat has some unread active stories
  | ActiveStoryStateRead -- ^ The chat has active stories, all of which were read
  deriving (Eq, Show)

instance I.ShortShow ActiveStoryState where
  shortShow ActiveStoryStateLive
    { story_id = story_id_
    }
      = "ActiveStoryStateLive"
        ++ I.cc
        [ "story_id" `I.p` story_id_
        ]
  shortShow ActiveStoryStateUnread
      = "ActiveStoryStateUnread"
  shortShow ActiveStoryStateRead
      = "ActiveStoryStateRead"

instance AT.FromJSON ActiveStoryState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "activeStoryStateLive"   -> parseActiveStoryStateLive v
      "activeStoryStateUnread" -> pure ActiveStoryStateUnread
      "activeStoryStateRead"   -> pure ActiveStoryStateRead
      _                        -> mempty
    
    where
      parseActiveStoryStateLive :: A.Value -> AT.Parser ActiveStoryState
      parseActiveStoryStateLive = A.withObject "ActiveStoryStateLive" $ \o -> do
        story_id_ <- o A..:?  "story_id"
        pure $ ActiveStoryStateLive
          { story_id = story_id_
          }
  parseJSON _ = mempty

