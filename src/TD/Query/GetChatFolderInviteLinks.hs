module TD.Query.GetChatFolderInviteLinks where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetChatFolderInviteLinks -- ^ Returns invite links created by the current user for a shareable chat folder
  = GetChatFolderInviteLinks
    { chat_folder_id :: Maybe Int -- ^ Chat folder identifier
    }
  deriving (Eq)

instance Show GetChatFolderInviteLinks where
  show
    GetChatFolderInviteLinks
      { chat_folder_id = chat_folder_id_
      }
        = "GetChatFolderInviteLinks"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          ]

instance AT.ToJSON GetChatFolderInviteLinks where
  toJSON
    GetChatFolderInviteLinks
      { chat_folder_id = chat_folder_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getChatFolderInviteLinks"
          , "chat_folder_id" A..= chat_folder_id_
          ]
