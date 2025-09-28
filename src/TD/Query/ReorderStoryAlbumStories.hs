module TD.Query.ReorderStoryAlbumStories
  (ReorderStoryAlbumStories(..)
  , defaultReorderStoryAlbumStories
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes order of stories in an album. If the album is owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat. Returns the changed album. Returns 'TD.Data.StoryAlbum.StoryAlbum'
data ReorderStoryAlbumStories
  = ReorderStoryAlbumStories
    { chat_id        :: Maybe Int   -- ^ Identifier of the chat that owns the stories
    , story_album_id :: Maybe Int   -- ^ Identifier of the story album
    , story_ids      :: Maybe [Int] -- ^ Identifier of the stories to move to the beginning of the album. All other stories are placed in the current order after the specified stories
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderStoryAlbumStories where
  shortShow
    ReorderStoryAlbumStories
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      , story_ids      = story_ids_
      }
        = "ReorderStoryAlbumStories"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "story_album_id" `I.p` story_album_id_
          , "story_ids"      `I.p` story_ids_
          ]

instance AT.ToJSON ReorderStoryAlbumStories where
  toJSON
    ReorderStoryAlbumStories
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      , story_ids      = story_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "reorderStoryAlbumStories"
          , "chat_id"        A..= chat_id_
          , "story_album_id" A..= story_album_id_
          , "story_ids"      A..= story_ids_
          ]

defaultReorderStoryAlbumStories :: ReorderStoryAlbumStories
defaultReorderStoryAlbumStories =
  ReorderStoryAlbumStories
    { chat_id        = Nothing
    , story_album_id = Nothing
    , story_ids      = Nothing
    }

