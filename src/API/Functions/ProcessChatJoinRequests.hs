-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ProcessChatJoinRequests where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Handles all pending join requests for a given link in a chat
-- 
-- __chat_id__ Chat identifier
-- 
-- __invite_link__ Invite link for which to process join requests. If empty, all join requests will be processed. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
-- 
-- __approve__ Pass true to approve all requests; pass false to decline them
data ProcessChatJoinRequests = 

 ProcessChatJoinRequests { approve :: Maybe Bool, invite_link :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show ProcessChatJoinRequests where
 show ProcessChatJoinRequests { approve=approve, invite_link=invite_link, chat_id=chat_id } =
  "ProcessChatJoinRequests" ++ U.cc [U.p "approve" approve, U.p "invite_link" invite_link, U.p "chat_id" chat_id ]

instance T.ToJSON ProcessChatJoinRequests where
 toJSON ProcessChatJoinRequests { approve = approve, invite_link = invite_link, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "processChatJoinRequests", "approve" A..= approve, "invite_link" A..= invite_link, "chat_id" A..= chat_id ]

instance T.FromJSON ProcessChatJoinRequests where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "processChatJoinRequests" -> parseProcessChatJoinRequests v
   _ -> mempty
  where
   parseProcessChatJoinRequests :: A.Value -> T.Parser ProcessChatJoinRequests
   parseProcessChatJoinRequests = A.withObject "ProcessChatJoinRequests" $ \o -> do
    approve <- o A..:? "approve"
    invite_link <- o A..:? "invite_link"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ProcessChatJoinRequests { approve = approve, invite_link = invite_link, chat_id = chat_id }
 parseJSON _ = mempty
