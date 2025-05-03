module TD.Query.OpenStory
  (OpenStory(..)
  , defaultOpenStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that a story is opened and is being viewed by the user. Returns 'TD.Data.Ok.Ok'
data OpenStory
  = OpenStory
    { story_poster_chat_id :: Maybe Int -- ^ The identifier of the chat that posted the opened story
    , story_id             :: Maybe Int -- ^ The identifier of the story
    }
  deriving (Eq, Show)

instance I.ShortShow OpenStory where
  shortShow
    OpenStory
      { story_poster_chat_id = story_poster_chat_id_
      , story_id             = story_id_
      }
        = "OpenStory"
          ++ I.cc
          [ "story_poster_chat_id" `I.p` story_poster_chat_id_
          , "story_id"             `I.p` story_id_
          ]

instance AT.ToJSON OpenStory where
  toJSON
    OpenStory
      { story_poster_chat_id = story_poster_chat_id_
      , story_id             = story_id_
      }
        = A.object
          [ "@type"                A..= AT.String "openStory"
          , "story_poster_chat_id" A..= story_poster_chat_id_
          , "story_id"             A..= story_id_
          ]

defaultOpenStory :: OpenStory
defaultOpenStory =
  OpenStory
    { story_poster_chat_id = Nothing
    , story_id             = Nothing
    }

