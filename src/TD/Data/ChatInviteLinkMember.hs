module TD.Data.ChatInviteLinkMember
  ( ChatInviteLinkMember(..)    
  , defaultChatInviteLinkMember 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatInviteLinkMember
  = ChatInviteLinkMember -- ^ Describes a chat member joined a chat via an invite link
    { user_id                     :: Maybe Int  -- ^ User identifier
    , joined_chat_date            :: Maybe Int  -- ^ Point in time (Unix timestamp) when the user joined the chat
    , via_chat_folder_invite_link :: Maybe Bool -- ^ True, if the user has joined the chat using an invite link for a chat folder
    , approver_user_id            :: Maybe Int  -- ^ User identifier of the chat administrator, approved user join request
    }
  deriving (Eq, Show)

instance I.ShortShow ChatInviteLinkMember where
  shortShow ChatInviteLinkMember
    { user_id                     = user_id_
    , joined_chat_date            = joined_chat_date_
    , via_chat_folder_invite_link = via_chat_folder_invite_link_
    , approver_user_id            = approver_user_id_
    }
      = "ChatInviteLinkMember"
        ++ I.cc
        [ "user_id"                     `I.p` user_id_
        , "joined_chat_date"            `I.p` joined_chat_date_
        , "via_chat_folder_invite_link" `I.p` via_chat_folder_invite_link_
        , "approver_user_id"            `I.p` approver_user_id_
        ]

instance AT.FromJSON ChatInviteLinkMember where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatInviteLinkMember" -> parseChatInviteLinkMember v
      _                      -> mempty
    
    where
      parseChatInviteLinkMember :: A.Value -> AT.Parser ChatInviteLinkMember
      parseChatInviteLinkMember = A.withObject "ChatInviteLinkMember" $ \o -> do
        user_id_                     <- o A..:?  "user_id"
        joined_chat_date_            <- o A..:?  "joined_chat_date"
        via_chat_folder_invite_link_ <- o A..:?  "via_chat_folder_invite_link"
        approver_user_id_            <- o A..:?  "approver_user_id"
        pure $ ChatInviteLinkMember
          { user_id                     = user_id_
          , joined_chat_date            = joined_chat_date_
          , via_chat_folder_invite_link = via_chat_folder_invite_link_
          , approver_user_id            = approver_user_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatInviteLinkMember where
  toJSON ChatInviteLinkMember
    { user_id                     = user_id_
    , joined_chat_date            = joined_chat_date_
    , via_chat_folder_invite_link = via_chat_folder_invite_link_
    , approver_user_id            = approver_user_id_
    }
      = A.object
        [ "@type"                       A..= AT.String "chatInviteLinkMember"
        , "user_id"                     A..= user_id_
        , "joined_chat_date"            A..= joined_chat_date_
        , "via_chat_folder_invite_link" A..= via_chat_folder_invite_link_
        , "approver_user_id"            A..= approver_user_id_
        ]

defaultChatInviteLinkMember :: ChatInviteLinkMember
defaultChatInviteLinkMember =
  ChatInviteLinkMember
    { user_id                     = Nothing
    , joined_chat_date            = Nothing
    , via_chat_folder_invite_link = Nothing
    , approver_user_id            = Nothing
    }

