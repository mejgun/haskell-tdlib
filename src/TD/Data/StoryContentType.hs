module TD.Data.StoryContentType
  (StoryContentType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Contains the type of the content of a story
data StoryContentType
  = StoryContentTypePhoto -- ^ A photo story
  | StoryContentTypeVideo -- ^ A video story
  | StoryContentTypeLive -- ^ A live story
  | StoryContentTypeUnsupported -- ^ A story of unknown content type
  deriving (Eq, Show)

instance I.ShortShow StoryContentType where
  shortShow StoryContentTypePhoto
      = "StoryContentTypePhoto"
  shortShow StoryContentTypeVideo
      = "StoryContentTypeVideo"
  shortShow StoryContentTypeLive
      = "StoryContentTypeLive"
  shortShow StoryContentTypeUnsupported
      = "StoryContentTypeUnsupported"

instance AT.FromJSON StoryContentType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyContentTypePhoto"       -> pure StoryContentTypePhoto
      "storyContentTypeVideo"       -> pure StoryContentTypeVideo
      "storyContentTypeLive"        -> pure StoryContentTypeLive
      "storyContentTypeUnsupported" -> pure StoryContentTypeUnsupported
      _                             -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON StoryContentType where
  toJSON StoryContentTypePhoto
      = A.object
        [ "@type" A..= AT.String "storyContentTypePhoto"
        ]
  toJSON StoryContentTypeVideo
      = A.object
        [ "@type" A..= AT.String "storyContentTypeVideo"
        ]
  toJSON StoryContentTypeLive
      = A.object
        [ "@type" A..= AT.String "storyContentTypeLive"
        ]
  toJSON StoryContentTypeUnsupported
      = A.object
        [ "@type" A..= AT.String "storyContentTypeUnsupported"
        ]

