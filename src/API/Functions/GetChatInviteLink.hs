-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about an invite link. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
-- 
-- __chat_id__ Chat identifier
-- 
-- __invite_link__ Invite link to get
data GetChatInviteLink = 

 GetChatInviteLink { invite_link :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatInviteLink where
 toJSON (GetChatInviteLink { invite_link = invite_link, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatInviteLink", "invite_link" A..= invite_link, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatInviteLink" -> parseGetChatInviteLink v
   _ -> mempty
  where
   parseGetChatInviteLink :: A.Value -> T.Parser GetChatInviteLink
   parseGetChatInviteLink = A.withObject "GetChatInviteLink" $ \o -> do
    invite_link <- o A..:? "invite_link"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatInviteLink { invite_link = invite_link, chat_id = chat_id }