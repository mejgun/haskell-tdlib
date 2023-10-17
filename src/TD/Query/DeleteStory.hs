module TD.Query.DeleteStory
  (DeleteStory(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a previously sent story
data DeleteStory
  = DeleteStory
    { story_id :: Maybe Int -- ^ Identifier of the story to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteStory where
  shortShow
    DeleteStory
      { story_id = story_id_
      }
        = "DeleteStory"
          ++ I.cc
          [ "story_id" `I.p` story_id_
          ]

instance AT.ToJSON DeleteStory where
  toJSON
    DeleteStory
      { story_id = story_id_
      }
        = A.object
          [ "@type"    A..= AT.String "deleteStory"
          , "story_id" A..= story_id_
          ]

