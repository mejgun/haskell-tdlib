module TD.Query.EditChatFolderInviteLink
  (EditChatFolderInviteLink(..)
  , defaultEditChatFolderInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Edits an invite link for a chat folder. Returns 'TD.Data.ChatFolderInviteLink.ChatFolderInviteLink'
data EditChatFolderInviteLink
  = EditChatFolderInviteLink
    { chat_folder_id :: Maybe Int    -- ^ Chat folder identifier
    , invite_link    :: Maybe T.Text -- ^ Invite link to be edited
    , name           :: Maybe T.Text -- ^ New name of the link; 0-32 characters
    , chat_ids       :: Maybe [Int]  -- ^ New identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link editing
    }
  deriving (Eq, Show)

instance I.ShortShow EditChatFolderInviteLink where
  shortShow
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

defaultEditChatFolderInviteLink :: EditChatFolderInviteLink
defaultEditChatFolderInviteLink =
  EditChatFolderInviteLink
    { chat_folder_id = Nothing
    , invite_link    = Nothing
    , name           = Nothing
    , chat_ids       = Nothing
    }

