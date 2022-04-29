-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinkInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatPhotoInfo as ChatPhotoInfo
import {-# SOURCE #-} qualified API.ChatType as ChatType

-- |
-- 
-- Contains information about a chat invite link
-- 
-- __chat_id__ Chat identifier of the invite link; 0 if the user has no access to the chat before joining
-- 
-- __accessible_for__ If non-zero, the amount of time for which read access to the chat will remain available, in seconds
-- 
-- __type__ Type of the chat
-- 
-- __title__ Title of the chat
-- 
-- __photo__ Chat photo; may be null
-- 
-- __param_description__ Chat description
-- 
-- __member_count__ Number of members in the chat
-- 
-- __member_user_ids__ User identifiers of some chat members that may be known to the current user
-- 
-- __creates_join_request__ True, if the link only creates join request
-- 
-- __is_public__ True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
data ChatInviteLinkInfo = 

 ChatInviteLinkInfo { is_public :: Maybe Bool, creates_join_request :: Maybe Bool, member_user_ids :: Maybe [Int], member_count :: Maybe Int, description :: Maybe String, photo :: Maybe ChatPhotoInfo.ChatPhotoInfo, title :: Maybe String, _type :: Maybe ChatType.ChatType, accessible_for :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show ChatInviteLinkInfo where
 show ChatInviteLinkInfo { is_public=is_public, creates_join_request=creates_join_request, member_user_ids=member_user_ids, member_count=member_count, description=description, photo=photo, title=title, _type=_type, accessible_for=accessible_for, chat_id=chat_id } =
  "ChatInviteLinkInfo" ++ cc [p "is_public" is_public, p "creates_join_request" creates_join_request, p "member_user_ids" member_user_ids, p "member_count" member_count, p "description" description, p "photo" photo, p "title" title, p "_type" _type, p "accessible_for" accessible_for, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatInviteLinkInfo where
 toJSON ChatInviteLinkInfo { is_public = is_public, creates_join_request = creates_join_request, member_user_ids = member_user_ids, member_count = member_count, description = description, photo = photo, title = title, _type = _type, accessible_for = accessible_for, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "chatInviteLinkInfo", "is_public" A..= is_public, "creates_join_request" A..= creates_join_request, "member_user_ids" A..= member_user_ids, "member_count" A..= member_count, "description" A..= description, "photo" A..= photo, "title" A..= title, "type" A..= _type, "accessible_for" A..= accessible_for, "chat_id" A..= chat_id ]

instance T.FromJSON ChatInviteLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLinkInfo" -> parseChatInviteLinkInfo v
   _ -> mempty
  where
   parseChatInviteLinkInfo :: A.Value -> T.Parser ChatInviteLinkInfo
   parseChatInviteLinkInfo = A.withObject "ChatInviteLinkInfo" $ \o -> do
    is_public <- o A..:? "is_public"
    creates_join_request <- o A..:? "creates_join_request"
    member_user_ids <- o A..:? "member_user_ids"
    member_count <- mconcat [ o A..:? "member_count", readMaybe <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    description <- o A..:? "description"
    photo <- o A..:? "photo"
    title <- o A..:? "title"
    _type <- o A..:? "type"
    accessible_for <- mconcat [ o A..:? "accessible_for", readMaybe <$> (o A..: "accessible_for" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatInviteLinkInfo { is_public = is_public, creates_join_request = creates_join_request, member_user_ids = member_user_ids, member_count = member_count, description = description, photo = photo, title = title, _type = _type, accessible_for = accessible_for, chat_id = chat_id }
 parseJSON _ = mempty
