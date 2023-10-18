module TD.Query.DeleteStory
  (DeleteStory(..)
  , defaultDeleteStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a previously sent story. Can be called only if story.can_be_deleted == true. Returns 'TD.Data.Ok.Ok'
data DeleteStory
  = DeleteStory
    { story_sender_chat_id :: Maybe Int -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int -- ^ Identifier of the story to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteStory where
  shortShow
    DeleteStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      }
        = "DeleteStory"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          ]

instance AT.ToJSON DeleteStory where
  toJSON
    DeleteStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      }
        = A.object
          [ "@type"                A..= AT.String "deleteStory"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          ]

defaultDeleteStory :: DeleteStory
defaultDeleteStory =
  DeleteStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    }

