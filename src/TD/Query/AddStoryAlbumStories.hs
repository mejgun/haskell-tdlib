module TD.Query.AddStoryAlbumStories
  (AddStoryAlbumStories(..)
  , defaultAddStoryAlbumStories
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds stories to the beginning of a previously created story album. If the album is owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat. Returns the changed album. Returns 'TD.Data.StoryAlbum.StoryAlbum'
data AddStoryAlbumStories
  = AddStoryAlbumStories
    { chat_id        :: Maybe Int   -- ^ Identifier of the chat that owns the stories
    , story_album_id :: Maybe Int   -- ^ Identifier of the story album
    , story_ids      :: Maybe [Int] -- ^ Identifier of the stories to add to the album; 1-getOption("story_album_size_max") identifiers. If after addition the album has more than getOption("story_album_size_max") stories, then the last one are removed from the album
    }
  deriving (Eq, Show)

instance I.ShortShow AddStoryAlbumStories where
  shortShow
    AddStoryAlbumStories
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      , story_ids      = story_ids_
      }
        = "AddStoryAlbumStories"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "story_album_id" `I.p` story_album_id_
          , "story_ids"      `I.p` story_ids_
          ]

instance AT.ToJSON AddStoryAlbumStories where
  toJSON
    AddStoryAlbumStories
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      , story_ids      = story_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "addStoryAlbumStories"
          , "chat_id"        A..= chat_id_
          , "story_album_id" A..= story_album_id_
          , "story_ids"      A..= story_ids_
          ]

defaultAddStoryAlbumStories :: AddStoryAlbumStories
defaultAddStoryAlbumStories =
  AddStoryAlbumStories
    { chat_id        = Nothing
    , story_album_id = Nothing
    , story_ids      = Nothing
    }

