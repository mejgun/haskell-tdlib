module TD.Query.CheckChatInviteLink
  (CheckChatInviteLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks the validity of an invite link for a chat and returns information about the corresponding chat. Returns 'TD.Data.ChatInviteLinkInfo.ChatInviteLinkInfo'
data CheckChatInviteLink
  = CheckChatInviteLink
    { invite_link :: Maybe T.Text -- ^ Invite link to be checked
    }
  deriving (Eq, Show)

instance I.ShortShow CheckChatInviteLink where
  shortShow
    CheckChatInviteLink
      { invite_link = invite_link_
      }
        = "CheckChatInviteLink"
          ++ I.cc
          [ "invite_link" `I.p` invite_link_
          ]

instance AT.ToJSON CheckChatInviteLink where
  toJSON
    CheckChatInviteLink
      { invite_link = invite_link_
      }
        = A.object
          [ "@type"       A..= AT.String "checkChatInviteLink"
          , "invite_link" A..= invite_link_
          ]

