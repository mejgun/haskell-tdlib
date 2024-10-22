module TD.Data.ChatActionBar
  (ChatActionBar(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes actions which must be possible to do through a chat action bar
data ChatActionBar
  = ChatActionBarReportSpam -- ^ The chat can be reported as spam using the method reportChat with an empty option_id and message_ids. If the chat is a private chat with a user with an emoji status, then a notice about emoji status usage must be shown
    { can_unarchive :: Maybe Bool -- ^ If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
    }
  | ChatActionBarInviteMembers -- ^ The chat is a recently created group chat to which new members can be invited
  | ChatActionBarReportAddBlock -- ^ The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method setMessageSenderBlockList, or the other user can be added to the contact list using the method addContact. If the chat is a private chat with a user with an emoji status, then a notice about emoji status usage must be shown
    { can_unarchive :: Maybe Bool -- ^ If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
    }
  | ChatActionBarAddContact -- ^ The chat is a private or secret chat and the other user can be added to the contact list using the method addContact
  | ChatActionBarSharePhoneNumber -- ^ The chat is a private or secret chat with a mutual contact and the user's phone number can be shared with the other user using the method sharePhoneNumber
  | ChatActionBarJoinRequest -- ^ The chat is a private chat with an administrator of a chat to which the user sent join request
    { title        :: Maybe T.Text -- ^ Title of the chat to which the join request was sent
    , is_channel   :: Maybe Bool   -- ^ True, if the join request was sent to a channel chat
    , request_date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the join request was sent
    }
  deriving (Eq, Show)

instance I.ShortShow ChatActionBar where
  shortShow ChatActionBarReportSpam
    { can_unarchive = can_unarchive_
    }
      = "ChatActionBarReportSpam"
        ++ I.cc
        [ "can_unarchive" `I.p` can_unarchive_
        ]
  shortShow ChatActionBarInviteMembers
      = "ChatActionBarInviteMembers"
  shortShow ChatActionBarReportAddBlock
    { can_unarchive = can_unarchive_
    }
      = "ChatActionBarReportAddBlock"
        ++ I.cc
        [ "can_unarchive" `I.p` can_unarchive_
        ]
  shortShow ChatActionBarAddContact
      = "ChatActionBarAddContact"
  shortShow ChatActionBarSharePhoneNumber
      = "ChatActionBarSharePhoneNumber"
  shortShow ChatActionBarJoinRequest
    { title        = title_
    , is_channel   = is_channel_
    , request_date = request_date_
    }
      = "ChatActionBarJoinRequest"
        ++ I.cc
        [ "title"        `I.p` title_
        , "is_channel"   `I.p` is_channel_
        , "request_date" `I.p` request_date_
        ]

instance AT.FromJSON ChatActionBar where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatActionBarReportSpam"       -> parseChatActionBarReportSpam v
      "chatActionBarInviteMembers"    -> pure ChatActionBarInviteMembers
      "chatActionBarReportAddBlock"   -> parseChatActionBarReportAddBlock v
      "chatActionBarAddContact"       -> pure ChatActionBarAddContact
      "chatActionBarSharePhoneNumber" -> pure ChatActionBarSharePhoneNumber
      "chatActionBarJoinRequest"      -> parseChatActionBarJoinRequest v
      _                               -> mempty
    
    where
      parseChatActionBarReportSpam :: A.Value -> AT.Parser ChatActionBar
      parseChatActionBarReportSpam = A.withObject "ChatActionBarReportSpam" $ \o -> do
        can_unarchive_ <- o A..:?  "can_unarchive"
        pure $ ChatActionBarReportSpam
          { can_unarchive = can_unarchive_
          }
      parseChatActionBarReportAddBlock :: A.Value -> AT.Parser ChatActionBar
      parseChatActionBarReportAddBlock = A.withObject "ChatActionBarReportAddBlock" $ \o -> do
        can_unarchive_ <- o A..:?  "can_unarchive"
        pure $ ChatActionBarReportAddBlock
          { can_unarchive = can_unarchive_
          }
      parseChatActionBarJoinRequest :: A.Value -> AT.Parser ChatActionBar
      parseChatActionBarJoinRequest = A.withObject "ChatActionBarJoinRequest" $ \o -> do
        title_        <- o A..:?  "title"
        is_channel_   <- o A..:?  "is_channel"
        request_date_ <- o A..:?  "request_date"
        pure $ ChatActionBarJoinRequest
          { title        = title_
          , is_channel   = is_channel_
          , request_date = request_date_
          }
  parseJSON _ = mempty

