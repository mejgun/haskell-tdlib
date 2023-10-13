module TD.Query.DeleteRevokedChatInviteLink
  (DeleteRevokedChatInviteLink(..)
  , defaultDeleteRevokedChatInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data DeleteRevokedChatInviteLink -- ^ Deletes revoked chat invite links. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
  = DeleteRevokedChatInviteLink
    { chat_id     :: Maybe Int    -- ^ Chat identifier
    , invite_link :: Maybe T.Text -- ^ Invite link to revoke
    }
  deriving (Eq)

instance Show DeleteRevokedChatInviteLink where
  show
    DeleteRevokedChatInviteLink
      { chat_id     = chat_id_
      , invite_link = invite_link_
      }
        = "DeleteRevokedChatInviteLink"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "invite_link" `I.p` invite_link_
          ]

instance AT.ToJSON DeleteRevokedChatInviteLink where
  toJSON
    DeleteRevokedChatInviteLink
      { chat_id     = chat_id_
      , invite_link = invite_link_
      }
        = A.object
          [ "@type"       A..= AT.String "deleteRevokedChatInviteLink"
          , "chat_id"     A..= chat_id_
          , "invite_link" A..= invite_link_
          ]

defaultDeleteRevokedChatInviteLink :: DeleteRevokedChatInviteLink
defaultDeleteRevokedChatInviteLink =
  DeleteRevokedChatInviteLink
    { chat_id     = Nothing
    , invite_link = Nothing
    }

