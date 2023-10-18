module TD.Query.GetChatFolderDefaultIconName
  (GetChatFolderDefaultIconName(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolder as ChatFolder

-- | Returns default icon name for a folder. Can be called synchronously. Returns 'TD.Data.ChatFolderIcon.ChatFolderIcon'
data GetChatFolderDefaultIconName
  = GetChatFolderDefaultIconName
    { folder :: Maybe ChatFolder.ChatFolder -- ^ Chat folder
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatFolderDefaultIconName where
  shortShow
    GetChatFolderDefaultIconName
      { folder = folder_
      }
        = "GetChatFolderDefaultIconName"
          ++ I.cc
          [ "folder" `I.p` folder_
          ]

instance AT.ToJSON GetChatFolderDefaultIconName where
  toJSON
    GetChatFolderDefaultIconName
      { folder = folder_
      }
        = A.object
          [ "@type"  A..= AT.String "getChatFolderDefaultIconName"
          , "folder" A..= folder_
          ]

