module TD.Data.StoryList
  ( StoryList(..) 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data StoryList -- ^ Describes a list of stories
  = StoryListMain -- ^ The list of stories, shown in the main chat list and folder chat lists
  | StoryListArchive -- ^ The list of stories, shown in the Arvhive chat list
  deriving (Eq)

instance Show StoryList where
  show StoryListMain
      = "StoryListMain"
  show StoryListArchive
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

