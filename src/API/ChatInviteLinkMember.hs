-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinkMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes a chat member joined a chat via an invite link 
-- 
-- __user_id__ User identifier
-- 
-- __joined_chat_date__ Point in time (Unix timestamp) when the user joined the chat
-- 
-- __approver_user_id__ User identifier of the chat administrator, approved user join request
data ChatInviteLinkMember = 

 ChatInviteLinkMember { approver_user_id :: Maybe Int, joined_chat_date :: Maybe Int, user_id :: Maybe Int }  deriving (Eq)

instance Show ChatInviteLinkMember where
 show ChatInviteLinkMember { approver_user_id=approver_user_id, joined_chat_date=joined_chat_date, user_id=user_id } =
  "ChatInviteLinkMember" ++ U.cc [U.p "approver_user_id" approver_user_id, U.p "joined_chat_date" joined_chat_date, U.p "user_id" user_id ]

instance T.ToJSON ChatInviteLinkMember where
 toJSON ChatInviteLinkMember { approver_user_id = approver_user_id, joined_chat_date = joined_chat_date, user_id = user_id } =
  A.object [ "@type" A..= T.String "chatInviteLinkMember", "approver_user_id" A..= approver_user_id, "joined_chat_date" A..= joined_chat_date, "user_id" A..= user_id ]

instance T.FromJSON ChatInviteLinkMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLinkMember" -> parseChatInviteLinkMember v
   _ -> mempty
  where
   parseChatInviteLinkMember :: A.Value -> T.Parser ChatInviteLinkMember
   parseChatInviteLinkMember = A.withObject "ChatInviteLinkMember" $ \o -> do
    approver_user_id <- mconcat [ o A..:? "approver_user_id", readMaybe <$> (o A..: "approver_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    joined_chat_date <- mconcat [ o A..:? "joined_chat_date", readMaybe <$> (o A..: "joined_chat_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatInviteLinkMember { approver_user_id = approver_user_id, joined_chat_date = joined_chat_date, user_id = user_id }
 parseJSON _ = mempty
