module TD.Query.DeleteAllRevokedChatInviteLinks
  (DeleteAllRevokedChatInviteLinks(..)
  , defaultDeleteAllRevokedChatInviteLinks
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links. Returns 'TD.Data.Ok.Ok'
data DeleteAllRevokedChatInviteLinks
  = DeleteAllRevokedChatInviteLinks
    { chat_id         :: Maybe Int -- ^ Chat identifier
    , creator_user_id :: Maybe Int -- ^ User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteAllRevokedChatInviteLinks where
  shortShow
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

defaultDeleteAllRevokedChatInviteLinks :: DeleteAllRevokedChatInviteLinks
defaultDeleteAllRevokedChatInviteLinks =
  DeleteAllRevokedChatInviteLinks
    { chat_id         = Nothing
    , creator_user_id = Nothing
    }

