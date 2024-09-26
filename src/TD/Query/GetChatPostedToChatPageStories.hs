module TD.Query.GetChatPostedToChatPageStories
  (GetChatPostedToChatPageStories(..)
  , defaultGetChatPostedToChatPageStories
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of stories that posted by the given chat to its chat page. If from_story_id == 0, then pinned stories are returned first. Then, stories are returned in reverse chronological order (i.e., in order of decreasing story_id). For optimal performance, the number of returned stories is chosen by TDLib. Returns 'TD.Data.Stories.Stories'
data GetChatPostedToChatPageStories
  = GetChatPostedToChatPageStories
    { chat_id       :: Maybe Int -- ^ Chat identifier
    , from_story_id :: Maybe Int -- ^ Identifier of the story starting from which stories must be returned; use 0 to get results from pinned and the newest story
    , limit         :: Maybe Int -- ^ The maximum number of stories to be returned. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatPostedToChatPageStories where
  shortShow
    GetChatPostedToChatPageStories
      { chat_id       = chat_id_
      , from_story_id = from_story_id_
      , limit         = limit_
      }
        = "GetChatPostedToChatPageStories"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "from_story_id" `I.p` from_story_id_
          , "limit"         `I.p` limit_
          ]

instance AT.ToJSON GetChatPostedToChatPageStories where
  toJSON
    GetChatPostedToChatPageStories
      { chat_id       = chat_id_
      , from_story_id = from_story_id_
      , limit         = limit_
      }
        = A.object
          [ "@type"         A..= AT.String "getChatPostedToChatPageStories"
          , "chat_id"       A..= chat_id_
          , "from_story_id" A..= from_story_id_
          , "limit"         A..= limit_
          ]

defaultGetChatPostedToChatPageStories :: GetChatPostedToChatPageStories
defaultGetChatPostedToChatPageStories =
  GetChatPostedToChatPageStories
    { chat_id       = Nothing
    , from_story_id = Nothing
    , limit         = Nothing
    }

