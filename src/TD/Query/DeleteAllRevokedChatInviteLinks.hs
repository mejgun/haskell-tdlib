module TD.Query.DeleteAllRevokedChatInviteLinks where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DeleteAllRevokedChatInviteLinks -- ^ Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
  = DeleteAllRevokedChatInviteLinks
    { chat_id         :: Maybe Int -- ^ Chat identifier
    , creator_user_id :: Maybe Int -- ^ User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
    }
  deriving (Eq)

instance Show DeleteAllRevokedChatInviteLinks where
  show
    DeleteAllRevokedChatInviteLinks
      { chat_id         = chat_id_
      , creator_user_id = creator_user_id_
      }
        = "DeleteAllRevokedChatInviteLinks"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "creator_user_id" `I.p` creator_user_id_
          ]

instance AT.ToJSON DeleteAllRevokedChatInviteLinks where
  toJSON
    DeleteAllRevokedChatInviteLinks
      { chat_id         = chat_id_
      , creator_user_id = creator_user_id_
      }
        = A.object
          [ "@type"           A..= AT.String "deleteAllRevokedChatInviteLinks"
          , "chat_id"         A..= chat_id_
          , "creator_user_id" A..= creator_user_id_
          ]
