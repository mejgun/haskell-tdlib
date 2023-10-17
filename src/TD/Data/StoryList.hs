module TD.Data.StoryList
  (StoryList(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a list of stories
data StoryList
  = StoryListMain -- ^ The list of stories, shown in the main chat list and folder chat lists
  | StoryListArchive -- ^ The list of stories, shown in the Arvhive chat list
  deriving (Eq, Show)

instance I.ShortShow StoryList where
  shortShow StoryListMain
      = "StoryListMain"
  shortShow StoryListArchive
      = "StoryListArchive"

instance AT.FromJSON StoryList where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyListMain"    -> pure StoryListMain
      "storyListArchive" -> pure StoryListArchive
      _                  -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON StoryList where
  toJSON StoryListMain
      = A.object
        [ "@type" A..= AT.String "storyListMain"
        ]
  toJSON StoryListArchive
      = A.object
        [ "@type" A..= AT.String "storyListArchive"
        ]

