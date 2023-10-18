module TD.Query.GetChatActiveStories
  (GetChatActiveStories(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of active stories posted by the given chat. Returns 'TD.Data.ChatActiveStories.ChatActiveStories'
data GetChatActiveStories
  = GetChatActiveStories
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatActiveStories where
  shortShow
    GetChatActiveStories
      { chat_id = chat_id_
      }
        = "GetChatActiveStories"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatActiveStories where
  toJSON
    GetChatActiveStories
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatActiveStories"
          , "chat_id" A..= chat_id_
          ]

