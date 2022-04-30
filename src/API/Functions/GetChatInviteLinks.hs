-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatInviteLinks where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns invite links for a chat created by specified administrator. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
-- 
-- __chat_id__ Chat identifier
-- 
-- __creator_user_id__ User identifier of a chat administrator. Must be an identifier of the current user for non-owner
-- 
-- __is_revoked__ Pass true if revoked links needs to be returned instead of active or expired
-- 
-- __offset_date__ Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning
-- 
-- __offset_invite_link__ Invite link starting after which to return invite links; use empty string to get results from the beginning
-- 
-- __limit__ The maximum number of invite links to return; up to 100
data GetChatInviteLinks = 

 GetChatInviteLinks { limit :: Maybe Int, offset_invite_link :: Maybe String, offset_date :: Maybe Int, is_revoked :: Maybe Bool, creator_user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatInviteLinks where
 show GetChatInviteLinks { limit=limit, offset_invite_link=offset_invite_link, offset_date=offset_date, is_revoked=is_revoked, creator_user_id=creator_user_id, chat_id=chat_id } =
  "GetChatInviteLinks" ++ U.cc [U.p "limit" limit, U.p "offset_invite_link" offset_invite_link, U.p "offset_date" offset_date, U.p "is_revoked" is_revoked, U.p "creator_user_id" creator_user_id, U.p "chat_id" chat_id ]

instance T.ToJSON GetChatInviteLinks where
 toJSON GetChatInviteLinks { limit = limit, offset_invite_link = offset_invite_link, offset_date = offset_date, is_revoked = is_revoked, creator_user_id = creator_user_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatInviteLinks", "limit" A..= limit, "offset_invite_link" A..= offset_invite_link, "offset_date" A..= offset_date, "is_revoked" A..= is_revoked, "creator_user_id" A..= creator_user_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatInviteLinks where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatInviteLinks" -> parseGetChatInviteLinks v
   _ -> mempty
  where
   parseGetChatInviteLinks :: A.Value -> T.Parser GetChatInviteLinks
   parseGetChatInviteLinks = A.withObject "GetChatInviteLinks" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_invite_link <- o A..:? "offset_invite_link"
    offset_date <- mconcat [ o A..:? "offset_date", readMaybe <$> (o A..: "offset_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_revoked <- o A..:? "is_revoked"
    creator_user_id <- mconcat [ o A..:? "creator_user_id", readMaybe <$> (o A..: "creator_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatInviteLinks { limit = limit, offset_invite_link = offset_invite_link, offset_date = offset_date, is_revoked = is_revoked, creator_user_id = creator_user_id, chat_id = chat_id }
 parseJSON _ = mempty
