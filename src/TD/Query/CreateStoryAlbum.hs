module TD.Query.CreateStoryAlbum
  (CreateStoryAlbum(..)
  , defaultCreateStoryAlbum
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates an album of stories; requires can_edit_stories administrator right for supergroup and channel chats. Returns 'TD.Data.StoryAlbum.StoryAlbum'
data CreateStoryAlbum
  = CreateStoryAlbum
    { story_poster_chat_id :: Maybe Int    -- ^ Identifier of the chat that posted the stories
    , name                 :: Maybe T.Text -- ^ Name of the album; 1-12 characters
    , story_ids            :: Maybe [Int]  -- ^ Identifiers of stories to add to the album; 0-getOption("story_album_size_max") identifiers
    }
  deriving (Eq, Show)

instance I.ShortShow CreateStoryAlbum where
  shortShow
    CreateStoryAlbum
      { story_poster_chat_id = story_poster_chat_id_
      , name                 = name_
      , story_ids            = story_ids_
      }
        = "CreateStoryAlbum"
          ++ I.cc
          [ "story_poster_chat_id" `I.p` story_poster_chat_id_
          , "name"                 `I.p` name_
          , "story_ids"            `I.p` story_ids_
          ]

instance AT.ToJSON CreateStoryAlbum where
  toJSON
    CreateStoryAlbum
      { story_poster_chat_id = story_poster_chat_id_
      , name                 = name_
      , story_ids            = story_ids_
      }
        = A.object
          [ "@type"                A..= AT.String "createStoryAlbum"
          , "story_poster_chat_id" A..= story_poster_chat_id_
          , "name"                 A..= name_
          , "story_ids"            A..= story_ids_
          ]

defaultCreateStoryAlbum :: CreateStoryAlbum
defaultCreateStoryAlbum =
  CreateStoryAlbum
    { story_poster_chat_id = Nothing
    , name                 = Nothing
    , story_ids            = Nothing
    }

