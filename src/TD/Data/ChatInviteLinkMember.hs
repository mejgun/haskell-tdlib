{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatInviteLinkMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatInviteLinkMember = -- | Describes a chat member joined a chat via an invite link
  ChatInviteLinkMember
  { -- | User identifier of the chat administrator, approved user join request
    approver_user_id :: Maybe Int,
    -- | True, if the user has joined the chat using an invite link for a chat folder
    via_chat_folder_invite_link :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the user joined the chat
    joined_chat_date :: Maybe Int,
    -- | User identifier
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatInviteLinkMember where
  show
    ChatInviteLinkMember
      { approver_user_id = approver_user_id_,
        via_chat_folder_invite_link = via_chat_folder_invite_link_,
        joined_chat_date = joined_chat_date_,
        user_id = user_id_
      } =
      "ChatInviteLinkMember"
        ++ U.cc
          [ U.p "approver_user_id" approver_user_id_,
            U.p "via_chat_folder_invite_link" via_chat_folder_invite_link_,
            U.p "joined_chat_date" joined_chat_date_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON ChatInviteLinkMember where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLinkMember" -> parseChatInviteLinkMember v
      _ -> mempty
    where
      parseChatInviteLinkMember :: A.Value -> T.Parser ChatInviteLinkMember
      parseChatInviteLinkMember = A.withObject "ChatInviteLinkMember" $ \o -> do
        approver_user_id_ <- o A..:? "approver_user_id"
        via_chat_folder_invite_link_ <- o A..:? "via_chat_folder_invite_link"
        joined_chat_date_ <- o A..:? "joined_chat_date"
        user_id_ <- o A..:? "user_id"
        return $ ChatInviteLinkMember {approver_user_id = approver_user_id_, via_chat_folder_invite_link = via_chat_folder_invite_link_, joined_chat_date = joined_chat_date_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinkMember where
  toJSON
    ChatInviteLinkMember
      { approver_user_id = approver_user_id_,
        via_chat_folder_invite_link = via_chat_folder_invite_link_,
        joined_chat_date = joined_chat_date_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinkMember",
          "approver_user_id" A..= approver_user_id_,
          "via_chat_folder_invite_link" A..= via_chat_folder_invite_link_,
          "joined_chat_date" A..= joined_chat_date_,
          "user_id" A..= user_id_
        ]
