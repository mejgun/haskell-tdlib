module TD.Query.CloseStory
  (CloseStory(..)
  , defaultCloseStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that a story is closed by the user. Returns 'TD.Data.Ok.Ok'
data CloseStory
  = CloseStory
    { story_sender_chat_id :: Maybe Int -- ^ The identifier of the sender of the story to close
    , story_id             :: Maybe Int -- ^ The identifier of the story
    }
  deriving (Eq, Show)

instance I.ShortShow CloseStory where
  shortShow
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

defaultCloseStory :: CloseStory
defaultCloseStory =
  CloseStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    }

