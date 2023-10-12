module TD.Query.GetChatFolderDefaultIconName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolder as ChatFolder

data GetChatFolderDefaultIconName -- ^ Returns default icon name for a folder. Can be called synchronously
  = GetChatFolderDefaultIconName
    { folder :: Maybe ChatFolder.ChatFolder -- ^ Chat folder
    }
  deriving (Eq)

instance Show GetChatFolderDefaultIconName where
  show
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
