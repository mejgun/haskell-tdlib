module TD.Query.RevokeChatInviteLink
  (RevokeChatInviteLink(..)
  , defaultRevokeChatInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Revokes invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links. If a primary link is revoked, then additionally to the revoked link returns new primary link. Returns 'TD.Data.ChatInviteLinks.ChatInviteLinks'
data RevokeChatInviteLink
  = RevokeChatInviteLink
    { chat_id     :: Maybe Int    -- ^ Chat identifier
    , invite_link :: Maybe T.Text -- ^ Invite link to be revoked
    }
  deriving (Eq, Show)

instance I.ShortShow RevokeChatInviteLink where
  shortShow
    RevokeChatInviteLink
      { chat_id     = chat_id_
      , invite_link = invite_link_
      }
        = "RevokeChatInviteLink"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "invite_link" `I.p` invite_link_
          ]

instance AT.ToJSON RevokeChatInviteLink where
  toJSON
    RevokeChatInviteLink
      { chat_id     = chat_id_
      , invite_link = invite_link_
      }
        = A.object
          [ "@type"       A..= AT.String "revokeChatInviteLink"
          , "chat_id"     A..= chat_id_
          , "invite_link" A..= invite_link_
          ]

defaultRevokeChatInviteLink :: RevokeChatInviteLink
defaultRevokeChatInviteLink =
  RevokeChatInviteLink
    { chat_id     = Nothing
    , invite_link = Nothing
    }

