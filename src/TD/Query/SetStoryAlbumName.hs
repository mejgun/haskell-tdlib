module TD.Query.SetStoryAlbumName
  (SetStoryAlbumName(..)
  , defaultSetStoryAlbumName
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes name of an album of stories. If the album is owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat. Returns the changed album. Returns 'TD.Data.StoryAlbum.StoryAlbum'
data SetStoryAlbumName
  = SetStoryAlbumName
    { chat_id        :: Maybe Int    -- ^ Identifier of the chat that owns the stories
    , story_album_id :: Maybe Int    -- ^ Identifier of the story album
    , name           :: Maybe T.Text -- ^ New name of the album; 1-12 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetStoryAlbumName where
  shortShow
    SetStoryAlbumName
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      , name           = name_
      }
        = "SetStoryAlbumName"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "story_album_id" `I.p` story_album_id_
          , "name"           `I.p` name_
          ]

instance AT.ToJSON SetStoryAlbumName where
  toJSON
    SetStoryAlbumName
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      , name           = name_
      }
        = A.object
          [ "@type"          A..= AT.String "setStoryAlbumName"
          , "chat_id"        A..= chat_id_
          , "story_album_id" A..= story_album_id_
          , "name"           A..= name_
          ]

defaultSetStoryAlbumName :: SetStoryAlbumName
defaultSetStoryAlbumName =
  SetStoryAlbumName
    { chat_id        = Nothing
    , story_album_id = Nothing
    , name           = Nothing
    }

