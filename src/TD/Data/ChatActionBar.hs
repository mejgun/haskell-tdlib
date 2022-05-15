{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatActionBar where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes actions which must be possible to do through a chat action bar
data ChatActionBar
  = -- | The chat can be reported as spam using the method reportChat with the reason chatReportReasonSpam
    ChatActionBarReportSpam
      { -- | If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
        can_unarchive :: Maybe Bool
      }
  | -- | The chat is a location-based supergroup, which can be reported as having unrelated location using the method reportChat with the reason chatReportReasonUnrelatedLocation
    ChatActionBarReportUnrelatedLocation
  | -- | The chat is a recently created group chat to which new members can be invited
    ChatActionBarInviteMembers
  | -- | The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method toggleMessageSenderIsBlocked, or the other user can be added to the contact list using the method addContact
    ChatActionBarReportAddBlock
      { -- | If non-negative, the current user was found by the peer through searchChatsNearby and this is the distance between the users
        distance :: Maybe Int,
        -- | If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
        can_unarchive :: Maybe Bool
      }
  | -- | The chat is a private or secret chat and the other user can be added to the contact list using the method addContact
    ChatActionBarAddContact
  | -- | The chat is a private or secret chat with a mutual contact and the user's phone number can be shared with the other user using the method sharePhoneNumber
    ChatActionBarSharePhoneNumber
  | -- | The chat is a private chat with an administrator of a chat to which the user sent join request
    ChatActionBarJoinRequest
      { -- | Point in time (Unix timestamp) when the join request was sent
        request_date :: Maybe Int,
        -- | True, if the join request was sent to a channel chat
        is_channel :: Maybe Bool,
        -- | Title of the chat to which the join request was sent
        title :: Maybe String
      }
  deriving (Eq)

instance Show ChatActionBar where
  show
    ChatActionBarReportSpam
      { can_unarchive = can_unarchive_
      } =
      "ChatActionBarReportSpam"
        ++ U.cc
          [ U.p "can_unarchive" can_unarchive_
          ]
  show ChatActionBarReportUnrelatedLocation =
    "ChatActionBarReportUnrelatedLocation"
      ++ U.cc
        []
  show ChatActionBarInviteMembers =
    "ChatActionBarInviteMembers"
      ++ U.cc
        []
  show
    ChatActionBarReportAddBlock
      { distance = distance_,
        can_unarchive = can_unarchive_
      } =
      "ChatActionBarReportAddBlock"
        ++ U.cc
          [ U.p "distance" distance_,
            U.p "can_unarchive" can_unarchive_
          ]
  show ChatActionBarAddContact =
    "ChatActionBarAddContact"
      ++ U.cc
        []
  show ChatActionBarSharePhoneNumber =
    "ChatActionBarSharePhoneNumber"
      ++ U.cc
        []
  show
    ChatActionBarJoinRequest
      { request_date = request_date_,
        is_channel = is_channel_,
        title = title_
      } =
      "ChatActionBarJoinRequest"
        ++ U.cc
          [ U.p "request_date" request_date_,
            U.p "is_channel" is_channel_,
            U.p "title" title_
          ]

instance T.FromJSON ChatActionBar where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatActionBarReportSpam" -> parseChatActionBarReportSpam v
      "chatActionBarReportUnrelatedLocation" -> parseChatActionBarReportUnrelatedLocation v
      "chatActionBarInviteMembers" -> parseChatActionBarInviteMembers v
      "chatActionBarReportAddBlock" -> parseChatActionBarReportAddBlock v
      "chatActionBarAddContact" -> parseChatActionBarAddContact v
      "chatActionBarSharePhoneNumber" -> parseChatActionBarSharePhoneNumber v
      "chatActionBarJoinRequest" -> parseChatActionBarJoinRequest v
      _ -> mempty
    where
      parseChatActionBarReportSpam :: A.Value -> T.Parser ChatActionBar
      parseChatActionBarReportSpam = A.withObject "ChatActionBarReportSpam" $ \o -> do
        can_unarchive_ <- o A..:? "can_unarchive"
        return $ ChatActionBarReportSpam {can_unarchive = can_unarchive_}

      parseChatActionBarReportUnrelatedLocation :: A.Value -> T.Parser ChatActionBar
      parseChatActionBarReportUnrelatedLocation = A.withObject "ChatActionBarReportUnrelatedLocation" $ \_ -> return ChatActionBarReportUnrelatedLocation

      parseChatActionBarInviteMembers :: A.Value -> T.Parser ChatActionBar
      parseChatActionBarInviteMembers = A.withObject "ChatActionBarInviteMembers" $ \_ -> return ChatActionBarInviteMembers

      parseChatActionBarReportAddBlock :: A.Value -> T.Parser ChatActionBar
      parseChatActionBarReportAddBlock = A.withObject "ChatActionBarReportAddBlock" $ \o -> do
        distance_ <- o A..:? "distance"
        can_unarchive_ <- o A..:? "can_unarchive"
        return $ ChatActionBarReportAddBlock {distance = distance_, can_unarchive = can_unarchive_}

      parseChatActionBarAddContact :: A.Value -> T.Parser ChatActionBar
      parseChatActionBarAddContact = A.withObject "ChatActionBarAddContact" $ \_ -> return ChatActionBarAddContact

      parseChatActionBarSharePhoneNumber :: A.Value -> T.Parser ChatActionBar
      parseChatActionBarSharePhoneNumber = A.withObject "ChatActionBarSharePhoneNumber" $ \_ -> return ChatActionBarSharePhoneNumber

      parseChatActionBarJoinRequest :: A.Value -> T.Parser ChatActionBar
      parseChatActionBarJoinRequest = A.withObject "ChatActionBarJoinRequest" $ \o -> do
        request_date_ <- o A..:? "request_date"
        is_channel_ <- o A..:? "is_channel"
        title_ <- o A..:? "title"
        return $ ChatActionBarJoinRequest {request_date = request_date_, is_channel = is_channel_, title = title_}
  parseJSON _ = mempty

instance T.ToJSON ChatActionBar where
  toJSON
    ChatActionBarReportSpam
      { can_unarchive = can_unarchive_
      } =
      A.object
        [ "@type" A..= T.String "chatActionBarReportSpam",
          "can_unarchive" A..= can_unarchive_
        ]
  toJSON ChatActionBarReportUnrelatedLocation =
    A.object
      [ "@type" A..= T.String "chatActionBarReportUnrelatedLocation"
      ]
  toJSON ChatActionBarInviteMembers =
    A.object
      [ "@type" A..= T.String "chatActionBarInviteMembers"
      ]
  toJSON
    ChatActionBarReportAddBlock
      { distance = distance_,
        can_unarchive = can_unarchive_
      } =
      A.object
        [ "@type" A..= T.String "chatActionBarReportAddBlock",
          "distance" A..= distance_,
          "can_unarchive" A..= can_unarchive_
        ]
  toJSON ChatActionBarAddContact =
    A.object
      [ "@type" A..= T.String "chatActionBarAddContact"
      ]
  toJSON ChatActionBarSharePhoneNumber =
    A.object
      [ "@type" A..= T.String "chatActionBarSharePhoneNumber"
      ]
  toJSON
    ChatActionBarJoinRequest
      { request_date = request_date_,
        is_channel = is_channel_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "chatActionBarJoinRequest",
          "request_date" A..= request_date_,
          "is_channel" A..= is_channel_,
          "title" A..= title_
        ]
