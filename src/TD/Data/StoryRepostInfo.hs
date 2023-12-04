module TD.Data.StoryRepostInfo
  (StoryRepostInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryOrigin as StoryOrigin

data StoryRepostInfo
  = StoryRepostInfo -- ^ Contains information about original story that was reposted
    { origin              :: Maybe StoryOrigin.StoryOrigin -- ^ Origin of the story that was reposted
    , is_content_modified :: Maybe Bool                    -- ^ True, if story content was modified during reposting; otherwise, story wasn't modified
    }
  deriving (Eq, Show)

instance I.ShortShow StoryRepostInfo where
  shortShow StoryRepostInfo
    { origin              = origin_
    , is_content_modified = is_content_modified_
    }
      = "StoryRepostInfo"
        ++ I.cc
        [ "origin"              `I.p` origin_
        , "is_content_modified" `I.p` is_content_modified_
        ]

instance AT.FromJSON StoryRepostInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyRepostInfo" -> parseStoryRepostInfo v
      _                 -> mempty
    
    where
      parseStoryRepostInfo :: A.Value -> AT.Parser StoryRepostInfo
      parseStoryRepostInfo = A.withObject "StoryRepostInfo" $ \o -> do
        origin_              <- o A..:?  "origin"
        is_content_modified_ <- o A..:?  "is_content_modified"
        pure $ StoryRepostInfo
          { origin              = origin_
          , is_content_modified = is_content_modified_
          }
  parseJSON _ = mempty

