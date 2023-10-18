module TD.Query.GetChatFolderInviteLinks
  (GetChatFolderInviteLinks(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns invite links created by the current user for a shareable chat folder. Returns 'TD.Data.ChatFolderInviteLinks.ChatFolderInviteLinks'
data GetChatFolderInviteLinks
  = GetChatFolderInviteLinks
    { chat_folder_id :: Maybe Int -- ^ Chat folder identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatFolderInviteLinks where
  shortShow
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

