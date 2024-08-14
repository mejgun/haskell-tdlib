module TD.Query.GetChatStoryInteractions
  (GetChatStoryInteractions(..)
  , defaultGetChatStoryInteractions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified Data.Text as T

-- | Returns interactions with a story posted in a chat. Can be used only if story is posted on behalf of a chat and the user is an administrator in the chat. Returns 'TD.Data.StoryInteractions.StoryInteractions'
data GetChatStoryInteractions
  = GetChatStoryInteractions
    { story_sender_chat_id :: Maybe Int                       -- ^ The identifier of the sender of the story
    , story_id             :: Maybe Int                       -- ^ Story identifier
    , reaction_type        :: Maybe ReactionType.ReactionType -- ^ Pass the default heart reaction or a suggested reaction type to receive only interactions with the specified reaction type; pass null to receive all interactions; reactionTypePaid isn't supported
    , prefer_forwards      :: Maybe Bool                      -- ^ Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
    , offset               :: Maybe T.Text                    -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit                :: Maybe Int                       -- ^ The maximum number of story interactions to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatStoryInteractions where
  shortShow
    GetChatStoryInteractions
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , reaction_type        = reaction_type_
      , prefer_forwards      = prefer_forwards_
      , offset               = offset_
      , limit                = limit_
      }
        = "GetChatStoryInteractions"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          , "reaction_type"        `I.p` reaction_type_
          , "prefer_forwards"      `I.p` prefer_forwards_
          , "offset"               `I.p` offset_
          , "limit"                `I.p` limit_
          ]

instance AT.ToJSON GetChatStoryInteractions where
  toJSON
    GetChatStoryInteractions
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , reaction_type        = reaction_type_
      , prefer_forwards      = prefer_forwards_
      , offset               = offset_
      , limit                = limit_
      }
        = A.object
          [ "@type"                A..= AT.String "getChatStoryInteractions"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          , "reaction_type"        A..= reaction_type_
          , "prefer_forwards"      A..= prefer_forwards_
          , "offset"               A..= offset_
          , "limit"                A..= limit_
          ]

defaultGetChatStoryInteractions :: GetChatStoryInteractions
defaultGetChatStoryInteractions =
  GetChatStoryInteractions
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , reaction_type        = Nothing
    , prefer_forwards      = Nothing
    , offset               = Nothing
    , limit                = Nothing
    }

