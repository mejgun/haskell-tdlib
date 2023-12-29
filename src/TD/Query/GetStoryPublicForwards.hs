module TD.Query.GetStoryPublicForwards
  (GetStoryPublicForwards(..)
  , defaultGetStoryPublicForwards
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns forwards of a story as a message to public chats and reposts by public channels. Can be used only if the story is posted on behalf of the current user or story.can_get_statistics == true. For optimal performance, the number of returned messages and stories is chosen by TDLib. Returns 'TD.Data.PublicForwards.PublicForwards'
data GetStoryPublicForwards
  = GetStoryPublicForwards
    { story_sender_chat_id :: Maybe Int    -- ^ The identifier of the sender of the story
    , story_id             :: Maybe Int    -- ^ The identifier of the story
    , offset               :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit                :: Maybe Int    -- ^ The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetStoryPublicForwards where
  shortShow
    GetStoryPublicForwards
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , offset               = offset_
      , limit                = limit_
      }
        = "GetStoryPublicForwards"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          , "offset"               `I.p` offset_
          , "limit"                `I.p` limit_
          ]

instance AT.ToJSON GetStoryPublicForwards where
  toJSON
    GetStoryPublicForwards
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , offset               = offset_
      , limit                = limit_
      }
        = A.object
          [ "@type"                A..= AT.String "getStoryPublicForwards"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          , "offset"               A..= offset_
          , "limit"                A..= limit_
          ]

defaultGetStoryPublicForwards :: GetStoryPublicForwards
defaultGetStoryPublicForwards =
  GetStoryPublicForwards
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , offset               = Nothing
    , limit                = Nothing
    }

