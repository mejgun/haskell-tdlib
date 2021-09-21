-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteRevokedChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Deletes revoked chat invite links. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links 
-- 
-- __chat_id__ Chat identifier
-- 
-- __invite_link__ Invite link to revoke
data DeleteRevokedChatInviteLink = 

 DeleteRevokedChatInviteLink { invite_link :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DeleteRevokedChatInviteLink where
 toJSON (DeleteRevokedChatInviteLink { invite_link = invite_link, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "deleteRevokedChatInviteLink", "invite_link" A..= invite_link, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteRevokedChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteRevokedChatInviteLink" -> parseDeleteRevokedChatInviteLink v
   _ -> mempty
  where
   parseDeleteRevokedChatInviteLink :: A.Value -> T.Parser DeleteRevokedChatInviteLink
   parseDeleteRevokedChatInviteLink = A.withObject "DeleteRevokedChatInviteLink" $ \o -> do
    invite_link <- o A..:? "invite_link"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteRevokedChatInviteLink { invite_link = invite_link, chat_id = chat_id }