module TD.Query.GetChatsToSendStories
  (GetChatsToSendStories(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns supergroup and channel chats in which the current user has the right to post stories. The chats must be rechecked with canSendStory before actually trying to post a story there. Returns 'TD.Data.Chats.Chats'
data GetChatsToSendStories
  = GetChatsToSendStories
  deriving (Eq, Show)

instance I.ShortShow GetChatsToSendStories where
  shortShow
    GetChatsToSendStories
        = "GetChatsToSendStories"

instance AT.ToJSON GetChatsToSendStories where
  toJSON
    GetChatsToSendStories
        = A.object
          [ "@type" A..= AT.String "getChatsToSendStories"
          ]

