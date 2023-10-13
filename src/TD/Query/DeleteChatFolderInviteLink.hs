module TD.Query.DeleteChatFolderInviteLink(DeleteChatFolderInviteLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data DeleteChatFolderInviteLink -- ^ Deletes an invite link for a chat folder
  = DeleteChatFolderInviteLink
    { chat_folder_id :: Maybe Int    -- ^ Chat folder identifier
    , invite_link    :: Maybe T.Text -- ^ Invite link to be deleted
    }
  deriving (Eq)

instance Show DeleteChatFolderInviteLink where
  show
    DeleteChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      , invite_link    = invite_link_
      }
        = "DeleteChatFolderInviteLink"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          , "invite_link"    `I.p` invite_link_
          ]

instance AT.ToJSON DeleteChatFolderInviteLink where
  toJSON
    DeleteChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      , invite_link    = invite_link_
      }
        = A.object
          [ "@type"          A..= AT.String "deleteChatFolderInviteLink"
          , "chat_folder_id" A..= chat_folder_id_
          , "invite_link"    A..= invite_link_
          ]
