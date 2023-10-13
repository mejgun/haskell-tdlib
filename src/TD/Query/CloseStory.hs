module TD.Query.CloseStory(CloseStory(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CloseStory -- ^ Informs TDLib that a story is closed by the user
  = CloseStory
    { story_sender_chat_id :: Maybe Int -- ^ The identifier of the sender of the story to close
    , story_id             :: Maybe Int -- ^ The identifier of the story
    }
  deriving (Eq)

instance Show CloseStory where
  show
    CloseStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      }
        = "CloseStory"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          ]

instance AT.ToJSON CloseStory where
  toJSON
    CloseStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      }
        = A.object
          [ "@type"                A..= AT.String "closeStory"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          ]
