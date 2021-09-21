-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinkMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes a chat member joined a chat by an invite link 
-- 
-- __user_id__ User identifier
-- 
-- __joined_chat_date__ Point in time (Unix timestamp) when the user joined the chat
data ChatInviteLinkMember = 

 ChatInviteLinkMember { joined_chat_date :: Maybe Int, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatInviteLinkMember where
 toJSON (ChatInviteLinkMember { joined_chat_date = joined_chat_date, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatInviteLinkMember", "joined_chat_date" A..= joined_chat_date, "user_id" A..= user_id ]

instance T.FromJSON ChatInviteLinkMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLinkMember" -> parseChatInviteLinkMember v
   _ -> mempty
  where
   parseChatInviteLinkMember :: A.Value -> T.Parser ChatInviteLinkMember
   parseChatInviteLinkMember = A.withObject "ChatInviteLinkMember" $ \o -> do
    joined_chat_date <- mconcat [ o A..:? "joined_chat_date", readMaybe <$> (o A..: "joined_chat_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatInviteLinkMember { joined_chat_date = joined_chat_date, user_id = user_id }