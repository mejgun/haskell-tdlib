module TD.Query.GetChatsToPostStories
  (GetChatsToPostStories(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns supergroup and channel chats in which the current user has the right to post stories. The chats must be rechecked with canPostStory before actually trying to post a story there. Returns 'TD.Data.Chats.Chats'
data GetChatsToPostStories
  = GetChatsToPostStories
  deriving (Eq, Show)

instance I.ShortShow GetChatsToPostStories where
  shortShow
    GetChatsToPostStories
        = "GetChatsToPostStories"

instance AT.ToJSON GetChatsToPostStories where
  toJSON
    GetChatsToPostStories
        = A.object
          [ "@type" A..= AT.String "getChatsToPostStories"
          ]

