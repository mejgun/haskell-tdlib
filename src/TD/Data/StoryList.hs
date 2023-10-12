module TD.Data.StoryList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyListMain"    -> pure StoryListMain
      "storyListArchive" -> pure StoryListArchive
      _                  -> mempty
    

instance AT.ToJSON StoryList where
  toJSON StoryListMain
      = A.object
        [ "@type" A..= AT.String "storyListMain"
        ]
  toJSON StoryListArchive
      = A.object
        [ "@type" A..= AT.String "storyListArchive"
        ]
