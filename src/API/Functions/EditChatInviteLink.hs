-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Edits a non-primary invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
-- 
-- __chat_id__ Chat identifier
-- 
-- __invite_link__ Invite link to be edited
-- 
-- __expire_date__ Point in time (Unix timestamp) when the link will expire; pass 0 if never
-- 
-- __member_limit__ The maximum number of chat members that can join the chat by the link simultaneously; 0-99999; pass 0 if not limited
data EditChatInviteLink = 

 EditChatInviteLink { member_limit :: Maybe Int, expire_date :: Maybe Int, invite_link :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON EditChatInviteLink where
 toJSON (EditChatInviteLink { member_limit = member_limit, expire_date = expire_date, invite_link = invite_link, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editChatInviteLink", "member_limit" A..= member_limit, "expire_date" A..= expire_date, "invite_link" A..= invite_link, "chat_id" A..= chat_id ]

instance T.FromJSON EditChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editChatInviteLink" -> parseEditChatInviteLink v
   _ -> mempty
  where
   parseEditChatInviteLink :: A.Value -> T.Parser EditChatInviteLink
   parseEditChatInviteLink = A.withObject "EditChatInviteLink" $ \o -> do
    member_limit <- mconcat [ o A..:? "member_limit", readMaybe <$> (o A..: "member_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    expire_date <- mconcat [ o A..:? "expire_date", readMaybe <$> (o A..: "expire_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    invite_link <- o A..:? "invite_link"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EditChatInviteLink { member_limit = member_limit, expire_date = expire_date, invite_link = invite_link, chat_id = chat_id }