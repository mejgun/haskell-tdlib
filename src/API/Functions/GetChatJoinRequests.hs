-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatJoinRequests where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatJoinRequest as ChatJoinRequest

-- |
-- 
-- Returns pending join requests in a chat
-- 
-- __chat_id__ Chat identifier
-- 
-- __invite_link__ Invite link for which to return join requests. If empty, all join requests will be returned. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
-- 
-- __query__ A query to search for in the first names, last names and usernames of the users to return
-- 
-- __offset_request__ A chat join request from which to return next requests; pass null to get results from the beginning
-- 
-- __limit__ The maximum number of requests to join the chat to return
data GetChatJoinRequests = 

 GetChatJoinRequests { limit :: Maybe Int, offset_request :: Maybe ChatJoinRequest.ChatJoinRequest, query :: Maybe String, invite_link :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatJoinRequests where
 show GetChatJoinRequests { limit=limit, offset_request=offset_request, query=query, invite_link=invite_link, chat_id=chat_id } =
  "GetChatJoinRequests" ++ U.cc [U.p "limit" limit, U.p "offset_request" offset_request, U.p "query" query, U.p "invite_link" invite_link, U.p "chat_id" chat_id ]

instance T.ToJSON GetChatJoinRequests where
 toJSON GetChatJoinRequests { limit = limit, offset_request = offset_request, query = query, invite_link = invite_link, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatJoinRequests", "limit" A..= limit, "offset_request" A..= offset_request, "query" A..= query, "invite_link" A..= invite_link, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatJoinRequests where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatJoinRequests" -> parseGetChatJoinRequests v
   _ -> mempty
  where
   parseGetChatJoinRequests :: A.Value -> T.Parser GetChatJoinRequests
   parseGetChatJoinRequests = A.withObject "GetChatJoinRequests" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_request <- o A..:? "offset_request"
    query <- o A..:? "query"
    invite_link <- o A..:? "invite_link"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatJoinRequests { limit = limit, offset_request = offset_request, query = query, invite_link = invite_link, chat_id = chat_id }
 parseJSON _ = mempty
