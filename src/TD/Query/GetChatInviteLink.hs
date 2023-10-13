module TD.Query.GetChatInviteLink(GetChatInviteLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetChatInviteLink -- ^ Returns information about an invite link. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
  = GetChatInviteLink
    { chat_id     :: Maybe Int    -- ^ Chat identifier
    , invite_link :: Maybe T.Text -- ^ Invite link to get
    }
  deriving (Eq)

instance Show GetChatInviteLink where
  show
    GetChatInviteLink
      { chat_id     = chat_id_
      , invite_link = invite_link_
      }
        = "GetChatInviteLink"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "invite_link" `I.p` invite_link_
          ]

instance AT.ToJSON GetChatInviteLink where
  toJSON
    GetChatInviteLink
      { chat_id     = chat_id_
      , invite_link = invite_link_
      }
        = A.object
          [ "@type"       A..= AT.String "getChatInviteLink"
          , "chat_id"     A..= chat_id_
          , "invite_link" A..= invite_link_
          ]
