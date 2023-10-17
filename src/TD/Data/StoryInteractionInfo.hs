module TD.Data.StoryInteractionInfo
  (StoryInteractionInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StoryInteractionInfo
  = StoryInteractionInfo -- ^ Contains information about interactions with a story
    { view_count             :: Maybe Int   -- ^ Number of times the story was viewed
    , forward_count          :: Maybe Int   -- ^ Number of times the story was forwarded; 0 if none or unknown
    , reaction_count         :: Maybe Int   -- ^ Number of reactions added to the story; 0 if none or unknown
    , recent_viewer_user_ids :: Maybe [Int] -- ^ Identifiers of at most 3 recent viewers of the story
    }
  deriving (Eq, Show)

instance I.ShortShow StoryInteractionInfo where
  shortShow StoryInteractionInfo
    { view_count             = view_count_
    , forward_count          = forward_count_
    , reaction_count         = reaction_count_
    , recent_viewer_user_ids = recent_viewer_user_ids_
    }
      = "StoryInteractionInfo"
        ++ I.cc
        [ "view_count"             `I.p` view_count_
        , "forward_count"          `I.p` forward_count_
        , "reaction_count"         `I.p` reaction_count_
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
        forward_count_          <- o A..:?  "forward_count"
        reaction_count_         <- o A..:?  "reaction_count"
        recent_viewer_user_ids_ <- o A..:?  "recent_viewer_user_ids"
        pure $ StoryInteractionInfo
          { view_count             = view_count_
          , forward_count          = forward_count_
          , reaction_count         = reaction_count_
          , recent_viewer_user_ids = recent_viewer_user_ids_
          }
  parseJSON _ = mempty

