module TD.Query.EditStoryCover
  (EditStoryCover(..)
  , defaultEditStoryCover
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes cover of a video story. Can be called only if story.can_be_edited == true and the story isn't being edited now. Returns 'TD.Data.Ok.Ok'
data EditStoryCover
  = EditStoryCover
    { story_sender_chat_id  :: Maybe Int    -- ^ Identifier of the chat that posted the story
    , story_id              :: Maybe Int    -- ^ Identifier of the story to edit
    , cover_frame_timestamp :: Maybe Double -- ^ New timestamp of the frame, which will be used as video thumbnail
    }
  deriving (Eq, Show)

instance I.ShortShow EditStoryCover where
  shortShow
    EditStoryCover
      { story_sender_chat_id  = story_sender_chat_id_
      , story_id              = story_id_
      , cover_frame_timestamp = cover_frame_timestamp_
      }
        = "EditStoryCover"
          ++ I.cc
          [ "story_sender_chat_id"  `I.p` story_sender_chat_id_
          , "story_id"              `I.p` story_id_
          , "cover_frame_timestamp" `I.p` cover_frame_timestamp_
          ]

instance AT.ToJSON EditStoryCover where
  toJSON
    EditStoryCover
      { story_sender_chat_id  = story_sender_chat_id_
      , story_id              = story_id_
      , cover_frame_timestamp = cover_frame_timestamp_
      }
        = A.object
          [ "@type"                 A..= AT.String "editStoryCover"
          , "story_sender_chat_id"  A..= story_sender_chat_id_
          , "story_id"              A..= story_id_
          , "cover_frame_timestamp" A..= cover_frame_timestamp_
          ]

defaultEditStoryCover :: EditStoryCover
defaultEditStoryCover =
  EditStoryCover
    { story_sender_chat_id  = Nothing
    , story_id              = Nothing
    , cover_frame_timestamp = Nothing
    }

