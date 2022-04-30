-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Describes a user or a chat as a member of another chat
-- 
-- __member_id__ Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels
-- 
-- __inviter_user_id__ Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
-- 
-- __joined_chat_date__ Point in time (Unix timestamp) when the user joined the chat
-- 
-- __status__ Status of the member in the chat
data ChatMember = 

 ChatMember { status :: Maybe ChatMemberStatus.ChatMemberStatus, joined_chat_date :: Maybe Int, inviter_user_id :: Maybe Int, member_id :: Maybe MessageSender.MessageSender }  deriving (Eq)

instance Show ChatMember where
 show ChatMember { status=status, joined_chat_date=joined_chat_date, inviter_user_id=inviter_user_id, member_id=member_id } =
  "ChatMember" ++ U.cc [U.p "status" status, U.p "joined_chat_date" joined_chat_date, U.p "inviter_user_id" inviter_user_id, U.p "member_id" member_id ]

instance T.ToJSON ChatMember where
 toJSON ChatMember { status = status, joined_chat_date = joined_chat_date, inviter_user_id = inviter_user_id, member_id = member_id } =
  A.object [ "@type" A..= T.String "chatMember", "status" A..= status, "joined_chat_date" A..= joined_chat_date, "inviter_user_id" A..= inviter_user_id, "member_id" A..= member_id ]

instance T.FromJSON ChatMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatMember" -> parseChatMember v
   _ -> mempty
  where
   parseChatMember :: A.Value -> T.Parser ChatMember
   parseChatMember = A.withObject "ChatMember" $ \o -> do
    status <- o A..:? "status"
    joined_chat_date <- mconcat [ o A..:? "joined_chat_date", readMaybe <$> (o A..: "joined_chat_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    inviter_user_id <- mconcat [ o A..:? "inviter_user_id", readMaybe <$> (o A..: "inviter_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    member_id <- o A..:? "member_id"
    return $ ChatMember { status = status, joined_chat_date = joined_chat_date, inviter_user_id = inviter_user_id, member_id = member_id }
 parseJSON _ = mempty
