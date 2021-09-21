-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains a chat invite link 
-- 
-- __invite_link__ Chat invite link
-- 
-- __creator_user_id__ User identifier of an administrator created the link
-- 
-- __date__ Point in time (Unix timestamp) when the link was created
-- 
-- __edit_date__ Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
-- 
-- __expire_date__ Point in time (Unix timestamp) when the link will expire; 0 if never
-- 
-- __member_limit__ The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited
-- 
-- __member_count__ Number of chat members, which joined the chat using the link
-- 
-- __is_primary__ True, if the link is primary. Primary invite link can't have expire date or usage limit. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
-- 
-- __is_revoked__ True, if the link was revoked
data ChatInviteLink = 

 ChatInviteLink { is_revoked :: Maybe Bool, is_primary :: Maybe Bool, member_count :: Maybe Int, member_limit :: Maybe Int, expire_date :: Maybe Int, edit_date :: Maybe Int, date :: Maybe Int, creator_user_id :: Maybe Int, invite_link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON ChatInviteLink where
 toJSON (ChatInviteLink { is_revoked = is_revoked, is_primary = is_primary, member_count = member_count, member_limit = member_limit, expire_date = expire_date, edit_date = edit_date, date = date, creator_user_id = creator_user_id, invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "chatInviteLink", "is_revoked" A..= is_revoked, "is_primary" A..= is_primary, "member_count" A..= member_count, "member_limit" A..= member_limit, "expire_date" A..= expire_date, "edit_date" A..= edit_date, "date" A..= date, "creator_user_id" A..= creator_user_id, "invite_link" A..= invite_link ]

instance T.FromJSON ChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLink" -> parseChatInviteLink v
   _ -> mempty
  where
   parseChatInviteLink :: A.Value -> T.Parser ChatInviteLink
   parseChatInviteLink = A.withObject "ChatInviteLink" $ \o -> do
    is_revoked <- o A..:? "is_revoked"
    is_primary <- o A..:? "is_primary"
    member_count <- mconcat [ o A..:? "member_count", readMaybe <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    member_limit <- mconcat [ o A..:? "member_limit", readMaybe <$> (o A..: "member_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    expire_date <- mconcat [ o A..:? "expire_date", readMaybe <$> (o A..: "expire_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    edit_date <- mconcat [ o A..:? "edit_date", readMaybe <$> (o A..: "edit_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    creator_user_id <- mconcat [ o A..:? "creator_user_id", readMaybe <$> (o A..: "creator_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    invite_link <- o A..:? "invite_link"
    return $ ChatInviteLink { is_revoked = is_revoked, is_primary = is_primary, member_count = member_count, member_limit = member_limit, expire_date = expire_date, edit_date = edit_date, date = date, creator_user_id = creator_user_id, invite_link = invite_link }