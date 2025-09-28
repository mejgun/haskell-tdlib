module TD.Query.DeleteStoryAlbum
  (DeleteStoryAlbum(..)
  , defaultDeleteStoryAlbum
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a story album. If the album is owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat. Returns 'TD.Data.Ok.Ok'
data DeleteStoryAlbum
  = DeleteStoryAlbum
    { chat_id        :: Maybe Int -- ^ Identifier of the chat that owns the stories
    , story_album_id :: Maybe Int -- ^ Identifier of the story album
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteStoryAlbum where
  shortShow
    DeleteStoryAlbum
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      }
        = "DeleteStoryAlbum"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "story_album_id" `I.p` story_album_id_
          ]

instance AT.ToJSON DeleteStoryAlbum where
  toJSON
    DeleteStoryAlbum
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      }
        = A.object
          [ "@type"          A..= AT.String "deleteStoryAlbum"
          , "chat_id"        A..= chat_id_
          , "story_album_id" A..= story_album_id_
          ]

defaultDeleteStoryAlbum :: DeleteStoryAlbum
defaultDeleteStoryAlbum =
  DeleteStoryAlbum
    { chat_id        = Nothing
    , story_album_id = Nothing
    }

