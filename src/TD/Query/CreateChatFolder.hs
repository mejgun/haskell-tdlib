module TD.Query.CreateChatFolder
  (CreateChatFolder(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolder as ChatFolder

data CreateChatFolder -- ^ Creates new chat folder. Returns information about the created chat folder. There can be up to getOption("chat_folder_count_max") chat folders, but the limit can be increased with Telegram Premium
  = CreateChatFolder
    { folder :: Maybe ChatFolder.ChatFolder -- ^ The new chat folder
    }
  deriving (Eq)

instance Show CreateChatFolder where
  show
    CreateChatFolder
      { folder = folder_
      }
        = "CreateChatFolder"
          ++ I.cc
          [ "folder" `I.p` folder_
          ]

instance AT.ToJSON CreateChatFolder where
  toJSON
    CreateChatFolder
      { folder = folder_
      }
        = A.object
          [ "@type"  A..= AT.String "createChatFolder"
          , "folder" A..= folder_
          ]

