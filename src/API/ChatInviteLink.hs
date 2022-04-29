-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains a chat invite link
-- 
-- __invite_link__ Chat invite link
-- 
-- __name__ Name of the link
-- 
-- __creator_user_id__ User identifier of an administrator created the link
-- 
-- __date__ Point in time (Unix timestamp) when the link was created
-- 
-- __edit_date__ Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
-- 
-- __expiration_date__ Point in time (Unix timestamp) when the link will expire; 0 if never
-- 
-- __member_limit__ The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval
-- 
-- __member_count__ Number of chat members, which joined the chat using the link
-- 
-- __pending_join_request_count__ Number of pending join requests created using this link
-- 
-- __creates_join_request__ True, if the link only creates join request. If true, total number of joining members will be unlimited
-- 
-- __is_primary__ True, if the link is primary. Primary invite link can't have name, expiration date, or usage limit. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
-- 
-- __is_revoked__ True, if the link was revoked
data ChatInviteLink = 

 ChatInviteLink { is_revoked :: Maybe Bool, is_primary :: Maybe Bool, creates_join_request :: Maybe Bool, pending_join_request_count :: Maybe Int, member_count :: Maybe Int, member_limit :: Maybe Int, expiration_date :: Maybe Int, edit_date :: Maybe Int, date :: Maybe Int, creator_user_id :: Maybe Int, name :: Maybe String, invite_link :: Maybe String }  deriving (Eq)

instance Show ChatInviteLink where
 show ChatInviteLink { is_revoked=is_revoked, is_primary=is_primary, creates_join_request=creates_join_request, pending_join_request_count=pending_join_request_count, member_count=member_count, member_limit=member_limit, expiration_date=expiration_date, edit_date=edit_date, date=date, creator_user_id=creator_user_id, name=name, invite_link=invite_link } =
  "ChatInviteLink" ++ cc [p "is_revoked" is_revoked, p "is_primary" is_primary, p "creates_join_request" creates_join_request, p "pending_join_request_count" pending_join_request_count, p "member_count" member_count, p "member_limit" member_limit, p "expiration_date" expiration_date, p "edit_date" edit_date, p "date" date, p "creator_user_id" creator_user_id, p "name" name, p "invite_link" invite_link ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatInviteLink where
 toJSON ChatInviteLink { is_revoked = is_revoked, is_primary = is_primary, creates_join_request = creates_join_request, pending_join_request_count = pending_join_request_count, member_count = member_count, member_limit = member_limit, expiration_date = expiration_date, edit_date = edit_date, date = date, creator_user_id = creator_user_id, name = name, invite_link = invite_link } =
  A.object [ "@type" A..= T.String "chatInviteLink", "is_revoked" A..= is_revoked, "is_primary" A..= is_primary, "creates_join_request" A..= creates_join_request, "pending_join_request_count" A..= pending_join_request_count, "member_count" A..= member_count, "member_limit" A..= member_limit, "expiration_date" A..= expiration_date, "edit_date" A..= edit_date, "date" A..= date, "creator_user_id" A..= creator_user_id, "name" A..= name, "invite_link" A..= invite_link ]

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
    creates_join_request <- o A..:? "creates_join_request"
    pending_join_request_count <- mconcat [ o A..:? "pending_join_request_count", readMaybe <$> (o A..: "pending_join_request_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    member_count <- mconcat [ o A..:? "member_count", readMaybe <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    member_limit <- mconcat [ o A..:? "member_limit", readMaybe <$> (o A..: "member_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    expiration_date <- mconcat [ o A..:? "expiration_date", readMaybe <$> (o A..: "expiration_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    edit_date <- mconcat [ o A..:? "edit_date", readMaybe <$> (o A..: "edit_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    creator_user_id <- mconcat [ o A..:? "creator_user_id", readMaybe <$> (o A..: "creator_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    name <- o A..:? "name"
    invite_link <- o A..:? "invite_link"
    return $ ChatInviteLink { is_revoked = is_revoked, is_primary = is_primary, creates_join_request = creates_join_request, pending_join_request_count = pending_join_request_count, member_count = member_count, member_limit = member_limit, expiration_date = expiration_date, edit_date = edit_date, date = date, creator_user_id = creator_user_id, name = name, invite_link = invite_link }
 parseJSON _ = mempty
