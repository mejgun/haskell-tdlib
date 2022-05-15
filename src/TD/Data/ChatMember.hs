{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
data ChatMember = -- | Describes a user or a chat as a member of another chat
  ChatMember
  { -- | Status of the member in the chat
    status :: Maybe ChatMemberStatus.ChatMemberStatus,
    -- | Point in time (Unix timestamp) when the user joined the chat
    joined_chat_date :: Maybe Int,
    -- | Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
    inviter_user_id :: Maybe Int,
    -- | Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels
    member_id :: Maybe MessageSender.MessageSender
  }
  deriving (Eq)

instance Show ChatMember where
  show
    ChatMember
      { status = status_,
        joined_chat_date = joined_chat_date_,
        inviter_user_id = inviter_user_id_,
        member_id = member_id_
      } =
      "ChatMember"
        ++ U.cc
          [ U.p "status" status_,
            U.p "joined_chat_date" joined_chat_date_,
            U.p "inviter_user_id" inviter_user_id_,
            U.p "member_id" member_id_
          ]

instance T.FromJSON ChatMember where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatMember" -> parseChatMember v
      _ -> mempty
    where
      parseChatMember :: A.Value -> T.Parser ChatMember
      parseChatMember = A.withObject "ChatMember" $ \o -> do
        status_ <- o A..:? "status"
        joined_chat_date_ <- o A..:? "joined_chat_date"
        inviter_user_id_ <- o A..:? "inviter_user_id"
        member_id_ <- o A..:? "member_id"
        return $ ChatMember {status = status_, joined_chat_date = joined_chat_date_, inviter_user_id = inviter_user_id_, member_id = member_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatMember where
  toJSON
    ChatMember
      { status = status_,
        joined_chat_date = joined_chat_date_,
        inviter_user_id = inviter_user_id_,
        member_id = member_id_
      } =
      A.object
        [ "@type" A..= T.String "chatMember",
          "status" A..= status_,
          "joined_chat_date" A..= joined_chat_date_,
          "inviter_user_id" A..= inviter_user_id_,
          "member_id" A..= member_id_
        ]
