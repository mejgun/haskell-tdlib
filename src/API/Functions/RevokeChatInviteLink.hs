-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RevokeChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Revokes invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.
-- 
-- -If a primary link is revoked, then additionally to the revoked link returns new primary link
-- 
-- __chat_id__ Chat identifier
-- 
-- __invite_link__ Invite link to be revoked
data RevokeChatInviteLink = 

 RevokeChatInviteLink { invite_link :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON RevokeChatInviteLink where
 toJSON (RevokeChatInviteLink { invite_link = invite_link, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "revokeChatInviteLink", "invite_link" A..= invite_link, "chat_id" A..= chat_id ]

instance T.FromJSON RevokeChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "revokeChatInviteLink" -> parseRevokeChatInviteLink v
   _ -> mempty
  where
   parseRevokeChatInviteLink :: A.Value -> T.Parser RevokeChatInviteLink
   parseRevokeChatInviteLink = A.withObject "RevokeChatInviteLink" $ \o -> do
    invite_link <- o A..:? "invite_link"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RevokeChatInviteLink { invite_link = invite_link, chat_id = chat_id }