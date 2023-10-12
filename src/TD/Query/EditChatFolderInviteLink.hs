module TD.Query.EditChatFolderInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data EditChatFolderInviteLink -- ^ Edits an invite link for a chat folder
  = EditChatFolderInviteLink
    { chat_folder_id :: Maybe Int    -- ^ Chat folder identifier
    , invite_link    :: Maybe T.Text -- ^ Invite link to be edited
    , name           :: Maybe T.Text -- ^ New name of the link; 0-32 characters
    , chat_ids       :: Maybe [Int]  -- ^ New identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link editing
    }
  deriving (Eq)

instance Show EditChatFolderInviteLink where
  show
    EditChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      , invite_link    = invite_link_
      , name           = name_
      , chat_ids       = chat_ids_
      }
        = "EditChatFolderInviteLink"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          , "invite_link"    `I.p` invite_link_
          , "name"           `I.p` name_
          , "chat_ids"       `I.p` chat_ids_
          ]

instance AT.ToJSON EditChatFolderInviteLink where
  toJSON
    EditChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      , invite_link    = invite_link_
      , name           = name_
      , chat_ids       = chat_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "editChatFolderInviteLink"
          , "chat_folder_id" A..= chat_folder_id_
          , "invite_link"    A..= invite_link_
          , "name"           A..= name_
          , "chat_ids"       A..= chat_ids_
          ]
