module TD.Data.ChatMember
  (ChatMember(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus

data ChatMember
  = ChatMember -- ^ Describes a user or a chat as a member of another chat
    { member_id        :: Maybe MessageSender.MessageSender       -- ^ Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels
    , inviter_user_id  :: Maybe Int                               -- ^ Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
    , joined_chat_date :: Maybe Int                               -- ^ Point in time (Unix timestamp) when the user joined/was promoted/was banned in the chat
    , status           :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ Status of the member in the chat
    }
  deriving (Eq, Show)

instance I.ShortShow ChatMember where
  shortShow ChatMember
    { member_id        = member_id_
    , inviter_user_id  = inviter_user_id_
    , joined_chat_date = joined_chat_date_
    , status           = status_
    }
      = "ChatMember"
        ++ I.cc
        [ "member_id"        `I.p` member_id_
        , "inviter_user_id"  `I.p` inviter_user_id_
        , "joined_chat_date" `I.p` joined_chat_date_
        , "status"           `I.p` status_
        ]

instance AT.FromJSON ChatMember where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatMember" -> parseChatMember v
      _            -> mempty
    
    where
      parseChatMember :: A.Value -> AT.Parser ChatMember
      parseChatMember = A.withObject "ChatMember" $ \o -> do
        member_id_        <- o A..:?  "member_id"
        inviter_user_id_  <- o A..:?  "inviter_user_id"
        joined_chat_date_ <- o A..:?  "joined_chat_date"
        status_           <- o A..:?  "status"
        pure $ ChatMember
          { member_id        = member_id_
          , inviter_user_id  = inviter_user_id_
          , joined_chat_date = joined_chat_date_
          , status           = status_
          }
  parseJSON _ = mempty

