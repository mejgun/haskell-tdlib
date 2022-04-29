-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatActionBar where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes actions which must be possible to do through a chat action bar
data ChatActionBar = 
 -- |
 -- 
 -- The chat can be reported as spam using the method reportChat with the reason chatReportReasonSpam
 -- 
 -- __can_unarchive__ If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
 ChatActionBarReportSpam { can_unarchive :: Maybe Bool }  |
 -- |
 -- 
 -- The chat is a location-based supergroup, which can be reported as having unrelated location using the method reportChat with the reason chatReportReasonUnrelatedLocation
 ChatActionBarReportUnrelatedLocation |
 -- |
 -- 
 -- The chat is a recently created group chat to which new members can be invited
 ChatActionBarInviteMembers |
 -- |
 -- 
 -- The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method toggleMessageSenderIsBlocked, or the other user can be added to the contact list using the method addContact
 -- 
 -- __can_unarchive__ If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
 -- 
 -- __distance__ If non-negative, the current user was found by the peer through searchChatsNearby and this is the distance between the users
 ChatActionBarReportAddBlock { distance :: Maybe Int, can_unarchive :: Maybe Bool }  |
 -- |
 -- 
 -- The chat is a private or secret chat and the other user can be added to the contact list using the method addContact
 ChatActionBarAddContact |
 -- |
 -- 
 -- The chat is a private or secret chat with a mutual contact and the user's phone number can be shared with the other user using the method sharePhoneNumber
 ChatActionBarSharePhoneNumber |
 -- |
 -- 
 -- The chat is a private chat with an administrator of a chat to which the user sent join request
 -- 
 -- __title__ Title of the chat to which the join request was sent
 -- 
 -- __is_channel__ True, if the join request was sent to a channel chat
 -- 
 -- __request_date__ Point in time (Unix timestamp) when the join request was sent
 ChatActionBarJoinRequest { request_date :: Maybe Int, is_channel :: Maybe Bool, title :: Maybe String }  deriving (Eq)

instance Show ChatActionBar where
 show ChatActionBarReportSpam { can_unarchive=can_unarchive } =
  "ChatActionBarReportSpam" ++ cc [p "can_unarchive" can_unarchive ]

 show ChatActionBarReportUnrelatedLocation {  } =
  "ChatActionBarReportUnrelatedLocation" ++ cc [ ]

 show ChatActionBarInviteMembers {  } =
  "ChatActionBarInviteMembers" ++ cc [ ]

 show ChatActionBarReportAddBlock { distance=distance, can_unarchive=can_unarchive } =
  "ChatActionBarReportAddBlock" ++ cc [p "distance" distance, p "can_unarchive" can_unarchive ]

 show ChatActionBarAddContact {  } =
  "ChatActionBarAddContact" ++ cc [ ]

 show ChatActionBarSharePhoneNumber {  } =
  "ChatActionBarSharePhoneNumber" ++ cc [ ]

 show ChatActionBarJoinRequest { request_date=request_date, is_channel=is_channel, title=title } =
  "ChatActionBarJoinRequest" ++ cc [p "request_date" request_date, p "is_channel" is_channel, p "title" title ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatActionBar where
 toJSON ChatActionBarReportSpam { can_unarchive = can_unarchive } =
  A.object [ "@type" A..= T.String "chatActionBarReportSpam", "can_unarchive" A..= can_unarchive ]

 toJSON ChatActionBarReportUnrelatedLocation {  } =
  A.object [ "@type" A..= T.String "chatActionBarReportUnrelatedLocation" ]

 toJSON ChatActionBarInviteMembers {  } =
  A.object [ "@type" A..= T.String "chatActionBarInviteMembers" ]

 toJSON ChatActionBarReportAddBlock { distance = distance, can_unarchive = can_unarchive } =
  A.object [ "@type" A..= T.String "chatActionBarReportAddBlock", "distance" A..= distance, "can_unarchive" A..= can_unarchive ]

 toJSON ChatActionBarAddContact {  } =
  A.object [ "@type" A..= T.String "chatActionBarAddContact" ]

 toJSON ChatActionBarSharePhoneNumber {  } =
  A.object [ "@type" A..= T.String "chatActionBarSharePhoneNumber" ]

 toJSON ChatActionBarJoinRequest { request_date = request_date, is_channel = is_channel, title = title } =
  A.object [ "@type" A..= T.String "chatActionBarJoinRequest", "request_date" A..= request_date, "is_channel" A..= is_channel, "title" A..= title ]

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
    can_unarchive <- o A..:? "can_unarchive"
    return $ ChatActionBarReportSpam { can_unarchive = can_unarchive }

   parseChatActionBarReportUnrelatedLocation :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarReportUnrelatedLocation = A.withObject "ChatActionBarReportUnrelatedLocation" $ \o -> do
    return $ ChatActionBarReportUnrelatedLocation {  }

   parseChatActionBarInviteMembers :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarInviteMembers = A.withObject "ChatActionBarInviteMembers" $ \o -> do
    return $ ChatActionBarInviteMembers {  }

   parseChatActionBarReportAddBlock :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarReportAddBlock = A.withObject "ChatActionBarReportAddBlock" $ \o -> do
    distance <- mconcat [ o A..:? "distance", readMaybe <$> (o A..: "distance" :: T.Parser String)] :: T.Parser (Maybe Int)
    can_unarchive <- o A..:? "can_unarchive"
    return $ ChatActionBarReportAddBlock { distance = distance, can_unarchive = can_unarchive }

   parseChatActionBarAddContact :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarAddContact = A.withObject "ChatActionBarAddContact" $ \o -> do
    return $ ChatActionBarAddContact {  }

   parseChatActionBarSharePhoneNumber :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarSharePhoneNumber = A.withObject "ChatActionBarSharePhoneNumber" $ \o -> do
    return $ ChatActionBarSharePhoneNumber {  }

   parseChatActionBarJoinRequest :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarJoinRequest = A.withObject "ChatActionBarJoinRequest" $ \o -> do
    request_date <- mconcat [ o A..:? "request_date", readMaybe <$> (o A..: "request_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_channel <- o A..:? "is_channel"
    title <- o A..:? "title"
    return $ ChatActionBarJoinRequest { request_date = request_date, is_channel = is_channel, title = title }
 parseJSON _ = mempty
