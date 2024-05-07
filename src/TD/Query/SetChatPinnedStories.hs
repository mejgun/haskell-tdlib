module TD.Query.SetChatPinnedStories
  (SetChatPinnedStories(..)
  , defaultSetChatPinnedStories
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the list of pinned stories on a chat page; requires can_edit_stories right in the chat. Returns 'TD.Data.Ok.Ok'
data SetChatPinnedStories
  = SetChatPinnedStories
    { chat_id   :: Maybe Int   -- ^ Identifier of the chat that posted the stories
    , story_ids :: Maybe [Int] -- ^ New list of pinned stories. All stories must be posted to the chat page first. There can be up to getOption("pinned_story_count_max") pinned stories on a chat page
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatPinnedStories where
  shortShow
    SetChatPinnedStories
      { chat_id   = chat_id_
      , story_ids = story_ids_
      }
        = "SetChatPinnedStories"
          ++ I.cc
          [ "chat_id"   `I.p` chat_id_
          , "story_ids" `I.p` story_ids_
          ]

instance AT.ToJSON SetChatPinnedStories where
  toJSON
    SetChatPinnedStories
      { chat_id   = chat_id_
      , story_ids = story_ids_
      }
        = A.object
          [ "@type"     A..= AT.String "setChatPinnedStories"
          , "chat_id"   A..= chat_id_
          , "story_ids" A..= story_ids_
          ]

defaultSetChatPinnedStories :: SetChatPinnedStories
defaultSetChatPinnedStories =
  SetChatPinnedStories
    { chat_id   = Nothing
    , story_ids = Nothing
    }

