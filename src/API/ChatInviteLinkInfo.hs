-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinkInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.ChatType as ChatType

data ChatInviteLinkInfo = 
 ChatInviteLinkInfo { is_public :: Maybe Bool, member_user_ids :: Maybe [Int], member_count :: Maybe Int, photo :: Maybe ChatPhoto.ChatPhoto, title :: Maybe String, _type :: Maybe ChatType.ChatType, chat_id :: Maybe Int }  deriving (Show)

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
    is_public <- optional $ o A..: "is_public"
    member_user_ids <- optional $ o A..: "member_user_ids"
    member_count <- optional $ o A..: "member_count"
    photo <- optional $ o A..: "photo"
    title <- optional $ o A..: "title"
    _type <- optional $ o A..: "type"
    chat_id <- optional $ o A..: "chat_id"
    return $ ChatInviteLinkInfo { is_public = is_public, member_user_ids = member_user_ids, member_count = member_count, photo = photo, title = title, _type = _type, chat_id = chat_id }