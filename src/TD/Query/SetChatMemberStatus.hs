module TD.Query.SetChatMemberStatus
  (SetChatMemberStatus(..)
  , defaultSetChatMemberStatus
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus

-- | Changes the status of a chat member; requires can_invite_users member right to add a chat member, can_promote_members administrator right to change administrator rights of the member, and can_restrict_members administrator right to change restrictions of a user. This function is currently not suitable for transferring chat ownership; use transferChatOwnership instead. Use addChatMember or banChatMember if some additional parameters needs to be passed. Returns 'TD.Data.Ok.Ok'
data SetChatMemberStatus
  = SetChatMemberStatus
    { chat_id   :: Maybe Int                               -- ^ Chat identifier
    , member_id :: Maybe MessageSender.MessageSender       -- ^ Member identifier. Chats can be only banned and unbanned in supergroups and channels
    , status    :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ The new status of the member in the chat
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatMemberStatus where
  shortShow
    SetChatMemberStatus
      { chat_id   = chat_id_
      , member_id = member_id_
      , status    = status_
      }
        = "SetChatMemberStatus"
          ++ I.cc
          [ "chat_id"   `I.p` chat_id_
          , "member_id" `I.p` member_id_
          , "status"    `I.p` status_
          ]

instance AT.ToJSON SetChatMemberStatus where
  toJSON
    SetChatMemberStatus
      { chat_id   = chat_id_
      , member_id = member_id_
      , status    = status_
      }
        = A.object
          [ "@type"     A..= AT.String "setChatMemberStatus"
          , "chat_id"   A..= chat_id_
          , "member_id" A..= member_id_
          , "status"    A..= status_
          ]

defaultSetChatMemberStatus :: SetChatMemberStatus
defaultSetChatMemberStatus =
  SetChatMemberStatus
    { chat_id   = Nothing
    , member_id = Nothing
    , status    = Nothing
    }

