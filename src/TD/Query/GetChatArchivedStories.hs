module TD.Query.GetChatArchivedStories
  (GetChatArchivedStories(..)
  , defaultGetChatArchivedStories
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of all stories posted by the given chat; requires can_edit_stories right in the chat. The stories are returned in reverse chronological order (i.e., in order of decreasing story_id). For optimal performance, the number of returned stories is chosen by TDLib. Returns 'TD.Data.Stories.Stories'
data GetChatArchivedStories
  = GetChatArchivedStories
    { chat_id       :: Maybe Int -- ^ Chat identifier
    , from_story_id :: Maybe Int -- ^ Identifier of the story starting from which stories must be returned; use 0 to get results from the last story
    , limit         :: Maybe Int -- ^ The maximum number of stories to be returned. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatArchivedStories where
  shortShow
    GetChatArchivedStories
      { chat_id       = chat_id_
      , from_story_id = from_story_id_
      , limit         = limit_
      }
        = "GetChatArchivedStories"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "from_story_id" `I.p` from_story_id_
          , "limit"         `I.p` limit_
          ]

instance AT.ToJSON GetChatArchivedStories where
  toJSON
    GetChatArchivedStories
      { chat_id       = chat_id_
      , from_story_id = from_story_id_
      , limit         = limit_
      }
        = A.object
          [ "@type"         A..= AT.String "getChatArchivedStories"
          , "chat_id"       A..= chat_id_
          , "from_story_id" A..= from_story_id_
          , "limit"         A..= limit_
          ]

defaultGetChatArchivedStories :: GetChatArchivedStories
defaultGetChatArchivedStories =
  GetChatArchivedStories
    { chat_id       = Nothing
    , from_story_id = Nothing
    , limit         = Nothing
    }

