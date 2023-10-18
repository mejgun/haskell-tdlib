module TD.Query.ReplacePrimaryChatInviteLink
  (ReplacePrimaryChatInviteLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right. Returns 'TD.Data.ChatInviteLink.ChatInviteLink'
data ReplacePrimaryChatInviteLink
  = ReplacePrimaryChatInviteLink
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ReplacePrimaryChatInviteLink where
  shortShow
    ReplacePrimaryChatInviteLink
      { chat_id = chat_id_
      }
        = "ReplacePrimaryChatInviteLink"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON ReplacePrimaryChatInviteLink where
  toJSON
    ReplacePrimaryChatInviteLink
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "replacePrimaryChatInviteLink"
          , "chat_id" A..= chat_id_
          ]

