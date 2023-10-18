module TD.Query.GetChatFolderChatCount
  (GetChatFolderChatCount(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolder as ChatFolder

-- | Returns approximate number of chats in a being created chat folder. Main and archive chat lists must be fully preloaded for this function to work correctly. Returns 'TD.Data.Count.Count'
data GetChatFolderChatCount
  = GetChatFolderChatCount
    { folder :: Maybe ChatFolder.ChatFolder -- ^ The new chat folder
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatFolderChatCount where
  shortShow
    GetChatFolderChatCount
      { folder = folder_
      }
        = "GetChatFolderChatCount"
          ++ I.cc
          [ "folder" `I.p` folder_
          ]

instance AT.ToJSON GetChatFolderChatCount where
  toJSON
    GetChatFolderChatCount
      { folder = folder_
      }
        = A.object
          [ "@type"  A..= AT.String "getChatFolderChatCount"
          , "folder" A..= folder_
          ]

