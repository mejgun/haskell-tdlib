module TD.Query.CheckChatFolderInviteLink
  (CheckChatFolderInviteLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks the validity of an invite link for a chat folder and returns information about the corresponding chat folder. Returns 'TD.Data.ChatFolderInviteLinkInfo.ChatFolderInviteLinkInfo'
data CheckChatFolderInviteLink
  = CheckChatFolderInviteLink
    { invite_link :: Maybe T.Text -- ^ Invite link to be checked
    }
  deriving (Eq, Show)

instance I.ShortShow CheckChatFolderInviteLink where
  shortShow
    CheckChatFolderInviteLink
      { invite_link = invite_link_
      }
        = "CheckChatFolderInviteLink"
          ++ I.cc
          [ "invite_link" `I.p` invite_link_
          ]

instance AT.ToJSON CheckChatFolderInviteLink where
  toJSON
    CheckChatFolderInviteLink
      { invite_link = invite_link_
      }
        = A.object
          [ "@type"       A..= AT.String "checkChatFolderInviteLink"
          , "invite_link" A..= invite_link_
          ]

