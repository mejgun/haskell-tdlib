module TD.Query.GetChatStoryAlbums
  (GetChatStoryAlbums(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of story albums owned by the given chat. Returns 'TD.Data.StoryAlbums.StoryAlbums'
data GetChatStoryAlbums
  = GetChatStoryAlbums
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatStoryAlbums where
  shortShow
    GetChatStoryAlbums
      { chat_id = chat_id_
      }
        = "GetChatStoryAlbums"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatStoryAlbums where
  toJSON
    GetChatStoryAlbums
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatStoryAlbums"
          , "chat_id" A..= chat_id_
          ]

