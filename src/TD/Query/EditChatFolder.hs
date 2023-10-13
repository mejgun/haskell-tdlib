module TD.Query.EditChatFolder(EditChatFolder(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolder as ChatFolder

data EditChatFolder -- ^ Edits existing chat folder. Returns information about the edited chat folder
  = EditChatFolder
    { chat_folder_id :: Maybe Int                   -- ^ Chat folder identifier
    , folder         :: Maybe ChatFolder.ChatFolder -- ^ The edited chat folder
    }
  deriving (Eq)

instance Show EditChatFolder where
  show
    EditChatFolder
      { chat_folder_id = chat_folder_id_
      , folder         = folder_
      }
        = "EditChatFolder"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          , "folder"         `I.p` folder_
          ]

instance AT.ToJSON EditChatFolder where
  toJSON
    EditChatFolder
      { chat_folder_id = chat_folder_id_
      , folder         = folder_
      }
        = A.object
          [ "@type"          A..= AT.String "editChatFolder"
          , "chat_folder_id" A..= chat_folder_id_
          , "folder"         A..= folder_
          ]
