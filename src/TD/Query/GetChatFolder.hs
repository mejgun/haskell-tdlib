module TD.Query.GetChatFolder
  (GetChatFolder(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a chat folder by its identifier. Returns 'TD.Data.ChatFolder.ChatFolder'
data GetChatFolder
  = GetChatFolder
    { chat_folder_id :: Maybe Int -- ^ Chat folder identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatFolder where
  shortShow
    GetChatFolder
      { chat_folder_id = chat_folder_id_
      }
        = "GetChatFolder"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          ]

instance AT.ToJSON GetChatFolder where
  toJSON
    GetChatFolder
      { chat_folder_id = chat_folder_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getChatFolder"
          , "chat_folder_id" A..= chat_folder_id_
          ]

