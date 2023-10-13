module TD.Query.JoinChatByInviteLink(JoinChatByInviteLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data JoinChatByInviteLink -- ^ Uses an invite link to add the current user to the chat if possible. May return an error with a message "INVITE_REQUEST_SENT" if only a join request was created
  = JoinChatByInviteLink
    { invite_link :: Maybe T.Text -- ^ Invite link to use
    }
  deriving (Eq)

instance Show JoinChatByInviteLink where
  show
    JoinChatByInviteLink
      { invite_link = invite_link_
      }
        = "JoinChatByInviteLink"
          ++ I.cc
          [ "invite_link" `I.p` invite_link_
          ]

instance AT.ToJSON JoinChatByInviteLink where
  toJSON
    JoinChatByInviteLink
      { invite_link = invite_link_
      }
        = A.object
          [ "@type"       A..= AT.String "joinChatByInviteLink"
          , "invite_link" A..= invite_link_
          ]
