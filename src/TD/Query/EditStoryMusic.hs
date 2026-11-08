module TD.Query.EditStoryMusic
  (EditStoryMusic(..)
  , defaultEditStoryMusic
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputAudio as InputAudio

-- | Changes music attached to a story. Can be called only if story.can_be_edited == true and the story isn't being edited now. Returns 'TD.Data.Ok.Ok'
data EditStoryMusic
  = EditStoryMusic
    { story_poster_chat_id :: Maybe Int                   -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int                   -- ^ Identifier of the story to edit
    , music                :: Maybe InputAudio.InputAudio -- ^ The new music; pass null to remove music from the story. The music can be up to 60 seconds long
    }
  deriving (Eq, Show)

instance I.ShortShow EditStoryMusic where
  shortShow
    EditStoryMusic
      { story_poster_chat_id = story_poster_chat_id_
      , story_id             = story_id_
      , music                = music_
      }
        = "EditStoryMusic"
          ++ I.cc
          [ "story_poster_chat_id" `I.p` story_poster_chat_id_
          , "story_id"             `I.p` story_id_
          , "music"                `I.p` music_
          ]

instance AT.ToJSON EditStoryMusic where
  toJSON
    EditStoryMusic
      { story_poster_chat_id = story_poster_chat_id_
      , story_id             = story_id_
      , music                = music_
      }
        = A.object
          [ "@type"                A..= AT.String "editStoryMusic"
          , "story_poster_chat_id" A..= story_poster_chat_id_
          , "story_id"             A..= story_id_
          , "music"                A..= music_
          ]

defaultEditStoryMusic :: EditStoryMusic
defaultEditStoryMusic =
  EditStoryMusic
    { story_poster_chat_id = Nothing
    , story_id             = Nothing
    , music                = Nothing
    }

