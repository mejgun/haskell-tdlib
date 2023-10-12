module TD.Query.BanChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data BanChatMember -- ^ Bans a member in a chat. Members can't be banned in private or secret chats. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first
  = BanChatMember
    { chat_id           :: Maybe Int                         -- ^ Chat identifier
    , member_id         :: Maybe MessageSender.MessageSender -- ^ Member identifier
    , banned_until_date :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups and if a chat is banned
    , revoke_messages   :: Maybe Bool                        -- ^ Pass true to delete all messages in the chat for the user that is being removed. Always true for supergroups and channels
    }
  deriving (Eq)

instance Show BanChatMember where
  show
    BanChatMember
      { chat_id           = chat_id_
      , member_id         = member_id_
      , banned_until_date = banned_until_date_
      , revoke_messages   = revoke_messages_
      }
        = "BanChatMember"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "member_id"         `I.p` member_id_
          , "banned_until_date" `I.p` banned_until_date_
          , "revoke_messages"   `I.p` revoke_messages_
          ]

instance AT.ToJSON BanChatMember where
  toJSON
    BanChatMember
      { chat_id           = chat_id_
      , member_id         = member_id_
      , banned_until_date = banned_until_date_
      , revoke_messages   = revoke_messages_
      }
        = A.object
          [ "@type"             A..= AT.String "banChatMember"
          , "chat_id"           A..= chat_id_
          , "member_id"         A..= member_id_
          , "banned_until_date" A..= banned_until_date_
          , "revoke_messages"   A..= revoke_messages_
          ]
