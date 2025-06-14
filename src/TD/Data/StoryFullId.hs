module TD.Data.StoryFullId
  ( StoryFullId(..)    
  , defaultStoryFullId 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StoryFullId
  = StoryFullId -- ^ Contains identifier of a story along with identifier of the chat that posted it
    { poster_chat_id :: Maybe Int -- ^ Identifier of the chat that posted the story
    , story_id       :: Maybe Int -- ^ Unique story identifier among stories of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow StoryFullId where
  shortShow StoryFullId
    { poster_chat_id = poster_chat_id_
    , story_id       = story_id_
    }
      = "StoryFullId"
        ++ I.cc
        [ "poster_chat_id" `I.p` poster_chat_id_
        , "story_id"       `I.p` story_id_
        ]

instance AT.FromJSON StoryFullId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyFullId" -> parseStoryFullId v
      _             -> mempty
    
    where
      parseStoryFullId :: A.Value -> AT.Parser StoryFullId
      parseStoryFullId = A.withObject "StoryFullId" $ \o -> do
        poster_chat_id_ <- o A..:?  "poster_chat_id"
        story_id_       <- o A..:?  "story_id"
        pure $ StoryFullId
          { poster_chat_id = poster_chat_id_
          , story_id       = story_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON StoryFullId where
  toJSON StoryFullId
    { poster_chat_id = poster_chat_id_
    , story_id       = story_id_
    }
      = A.object
        [ "@type"          A..= AT.String "storyFullId"
        , "poster_chat_id" A..= poster_chat_id_
        , "story_id"       A..= story_id_
        ]

defaultStoryFullId :: StoryFullId
defaultStoryFullId =
  StoryFullId
    { poster_chat_id = Nothing
    , story_id       = Nothing
    }

