module TD.Query.ReorderStoryAlbums
  (ReorderStoryAlbums(..)
  , defaultReorderStoryAlbums
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes order of story albums. If the albums are owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat. Returns 'TD.Data.Ok.Ok'
data ReorderStoryAlbums
  = ReorderStoryAlbums
    { chat_id         :: Maybe Int   -- ^ Identifier of the chat that owns the stories
    , story_album_ids :: Maybe [Int] -- ^ New order of story albums
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderStoryAlbums where
  shortShow
    ReorderStoryAlbums
      { chat_id         = chat_id_
      , story_album_ids = story_album_ids_
      }
        = "ReorderStoryAlbums"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "story_album_ids" `I.p` story_album_ids_
          ]

instance AT.ToJSON ReorderStoryAlbums where
  toJSON
    ReorderStoryAlbums
      { chat_id         = chat_id_
      , story_album_ids = story_album_ids_
      }
        = A.object
          [ "@type"           A..= AT.String "reorderStoryAlbums"
          , "chat_id"         A..= chat_id_
          , "story_album_ids" A..= story_album_ids_
          ]

defaultReorderStoryAlbums :: ReorderStoryAlbums
defaultReorderStoryAlbums =
  ReorderStoryAlbums
    { chat_id         = Nothing
    , story_album_ids = Nothing
    }

