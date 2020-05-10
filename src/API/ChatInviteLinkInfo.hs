-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinkInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.ChatType as ChatType

-- |
-- 
-- Contains information about a chat invite link
-- 
-- __chat_id__ Chat identifier of the invite link; 0 if the user is not a member of this chat
-- 
-- __type__ Contains information about the type of the chat
-- 
-- __title__ Title of the chat
-- 
-- __photo__ Chat photo; may be null
-- 
-- __member_count__ Number of members in the chat
-- 
-- __member_user_ids__ User identifiers of some chat members that may be known to the current user
-- 
-- __is_public__ True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
data ChatInviteLinkInfo = 

 ChatInviteLinkInfo { is_public :: Maybe Bool, member_user_ids :: Maybe [Int], member_count :: Maybe Int, photo :: Maybe ChatPhoto.ChatPhoto, title :: Maybe String, _type :: Maybe ChatType.ChatType, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatInviteLinkInfo where
 toJSON (ChatInviteLinkInfo { is_public = is_public, member_user_ids = member_user_ids, member_count = member_count, photo = photo, title = title, _type = _type, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "chatInviteLinkInfo", "is_public" A..= is_public, "member_user_ids" A..= member_user_ids, "member_count" A..= member_count, "photo" A..= photo, "title" A..= title, "type" A..= _type, "chat_id" A..= chat_id ]

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
    member_user_ids <- o A..:? "member_user_ids"
    member_count <- mconcat [ o A..:? "member_count", readMaybe <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo <- o A..:? "photo"
    title <- o A..:? "title"
    _type <- o A..:? "type"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatInviteLinkInfo { is_public = is_public, member_user_ids = member_user_ids, member_count = member_count, photo = photo, title = title, _type = _type, chat_id = chat_id }