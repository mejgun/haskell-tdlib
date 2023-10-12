module TD.Query.GetChatPinnedStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatPinnedStories -- ^ Returns the list of pinned stories posted by the given chat. The stories are returned in a reverse chronological order (i.e., in order of decreasing story_id). For optimal performance, the number of returned stories is chosen by TDLib
  = GetChatPinnedStories
    { chat_id       :: Maybe Int -- ^ Chat identifier
    , from_story_id :: Maybe Int -- ^ Identifier of the story starting from which stories must be returned; use 0 to get results from the last story
    , limit         :: Maybe Int -- ^ The maximum number of stories to be returned For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq)

instance Show GetChatPinnedStories where
  show
    GetChatPinnedStories
      { chat_id       = chat_id_
      , from_story_id = from_story_id_
      , limit         = limit_
      }
        = "GetChatPinnedStories"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "from_story_id" `I.p` from_story_id_
          , "limit"         `I.p` limit_
          ]

instance AT.ToJSON GetChatPinnedStories where
  toJSON
    GetChatPinnedStories
      { chat_id       = chat_id_
      , from_story_id = from_story_id_
      , limit         = limit_
      }
        = A.object
          [ "@type"         A..= AT.String "getChatPinnedStories"
          , "chat_id"       A..= chat_id_
          , "from_story_id" A..= from_story_id_
          , "limit"         A..= limit_
          ]
