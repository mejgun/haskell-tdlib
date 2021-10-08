-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatMemberStatus where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for transferring chat ownership; use transferChatOwnership instead. Use addChatMember or banChatMember if you need to pass some additional parameters
-- 
-- __chat_id__ Chat identifier
-- 
-- __member_id__ Member identifier. Chats can be only banned and unbanned in supergroups and channels
-- 
-- __status__ The new status of the member in the chat
data SetChatMemberStatus = 

 SetChatMemberStatus { status :: Maybe ChatMemberStatus.ChatMemberStatus, member_id :: Maybe MessageSender.MessageSender, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatMemberStatus where
 show SetChatMemberStatus { status=status, member_id=member_id, chat_id=chat_id } =
  "SetChatMemberStatus" ++ cc [p "status" status, p "member_id" member_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetChatMemberStatus where
 toJSON SetChatMemberStatus { status = status, member_id = member_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatMemberStatus", "status" A..= status, "member_id" A..= member_id, "chat_id" A..= chat_id ]

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
    member_id <- o A..:? "member_id"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatMemberStatus { status = status, member_id = member_id, chat_id = chat_id }
 parseJSON _ = mempty
