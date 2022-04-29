-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatInviteLinkMembers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatInviteLinkMember as ChatInviteLinkMember

-- |
-- 
-- Returns chat members joined a chat via an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links 
-- 
-- __chat_id__ Chat identifier
-- 
-- __invite_link__ Invite link for which to return chat members
-- 
-- __offset_member__ A chat member from which to return next chat members; pass null to get results from the beginning
-- 
-- __limit__ The maximum number of chat members to return; up to 100
data GetChatInviteLinkMembers = 

 GetChatInviteLinkMembers { limit :: Maybe Int, offset_member :: Maybe ChatInviteLinkMember.ChatInviteLinkMember, invite_link :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatInviteLinkMembers where
 show GetChatInviteLinkMembers { limit=limit, offset_member=offset_member, invite_link=invite_link, chat_id=chat_id } =
  "GetChatInviteLinkMembers" ++ cc [p "limit" limit, p "offset_member" offset_member, p "invite_link" invite_link, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatInviteLinkMembers where
 toJSON GetChatInviteLinkMembers { limit = limit, offset_member = offset_member, invite_link = invite_link, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatInviteLinkMembers", "limit" A..= limit, "offset_member" A..= offset_member, "invite_link" A..= invite_link, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatInviteLinkMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatInviteLinkMembers" -> parseGetChatInviteLinkMembers v
   _ -> mempty
  where
   parseGetChatInviteLinkMembers :: A.Value -> T.Parser GetChatInviteLinkMembers
   parseGetChatInviteLinkMembers = A.withObject "GetChatInviteLinkMembers" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_member <- o A..:? "offset_member"
    invite_link <- o A..:? "invite_link"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatInviteLinkMembers { limit = limit, offset_member = offset_member, invite_link = invite_link, chat_id = chat_id }
 parseJSON _ = mempty
