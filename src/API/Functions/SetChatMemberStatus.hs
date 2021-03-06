-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatMemberStatus where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

-- |
-- 
-- Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for adding new members to the chat and transferring chat ownership; instead, use addChatMember or transferChatOwnership. The chat member status will not be changed until it has been synchronized with the server
-- 
-- __chat_id__ Chat identifier
-- 
-- __user_id__ User identifier
-- 
-- __status__ The new status of the member in the chat
data SetChatMemberStatus = 

 SetChatMemberStatus { status :: Maybe ChatMemberStatus.ChatMemberStatus, user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatMemberStatus where
 toJSON (SetChatMemberStatus { status = status, user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatMemberStatus", "status" A..= status, "user_id" A..= user_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatMemberStatus where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatMemberStatus" -> parseSetChatMemberStatus v
   _ -> mempty
  where
   parseSetChatMemberStatus :: A.Value -> T.Parser SetChatMemberStatus
   parseSetChatMemberStatus = A.withObject "SetChatMemberStatus" $ \o -> do
    status <- o A..:? "status"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatMemberStatus { status = status, user_id = user_id, chat_id = chat_id }