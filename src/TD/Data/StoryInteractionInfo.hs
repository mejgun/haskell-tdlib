module TD.Data.StoryInteractionInfo
  (StoryInteractionInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StoryInteractionInfo
  = StoryInteractionInfo -- ^ Contains information about interactions with a story
    { view_count             :: Maybe Int   -- ^ Number of times the story was viewed
    , recent_viewer_user_ids :: Maybe [Int] -- ^ Identifiers of at most 3 recent viewers of the story
    }
  deriving (Eq, Show)

instance I.ShortShow StoryInteractionInfo where
  shortShow StoryInteractionInfo
    { view_count             = view_count_
    , recent_viewer_user_ids = recent_viewer_user_ids_
    }
      = "StoryInteractionInfo"
        ++ I.cc
        [ "view_count"             `I.p` view_count_
        , "recent_viewer_user_ids" `I.p` recent_viewer_user_ids_
        ]

instance AT.FromJSON StoryInteractionInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyInteractionInfo" -> parseStoryInteractionInfo v
      _                      -> mempty
    
    where
      parseStoryInteractionInfo :: A.Value -> AT.Parser StoryInteractionInfo
      parseStoryInteractionInfo = A.withObject "StoryInteractionInfo" $ \o -> do
        view_count_             <- o A..:?  "view_count"
        recent_viewer_user_ids_ <- o A..:?  "recent_viewer_user_ids"
        pure $ StoryInteractionInfo
          { view_count             = view_count_
          , recent_viewer_user_ids = recent_viewer_user_ids_
          }
  parseJSON _ = mempty

