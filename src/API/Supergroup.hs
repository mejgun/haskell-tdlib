-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Supergroup where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

data Supergroup = 
 Supergroup { is_scam :: Maybe Bool, restriction_reason :: Maybe String, is_verified :: Maybe Bool, is_channel :: Maybe Bool, is_slow_mode_enabled :: Maybe Bool, sign_messages :: Maybe Bool, has_location :: Maybe Bool, has_linked_chat :: Maybe Bool, member_count :: Maybe Int, status :: Maybe ChatMemberStatus.ChatMemberStatus, date :: Maybe Int, username :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Supergroup where
 toJSON (Supergroup { is_scam = is_scam, restriction_reason = restriction_reason, is_verified = is_verified, is_channel = is_channel, is_slow_mode_enabled = is_slow_mode_enabled, sign_messages = sign_messages, has_location = has_location, has_linked_chat = has_linked_chat, member_count = member_count, status = status, date = date, username = username, _id = _id }) =
  A.object [ "@type" A..= T.String "supergroup", "is_scam" A..= is_scam, "restriction_reason" A..= restriction_reason, "is_verified" A..= is_verified, "is_channel" A..= is_channel, "is_slow_mode_enabled" A..= is_slow_mode_enabled, "sign_messages" A..= sign_messages, "has_location" A..= has_location, "has_linked_chat" A..= has_linked_chat, "member_count" A..= member_count, "status" A..= status, "date" A..= date, "username" A..= username, "id" A..= _id ]

instance T.FromJSON Supergroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "supergroup" -> parseSupergroup v
   _ -> mempty
  where
   parseSupergroup :: A.Value -> T.Parser Supergroup
   parseSupergroup = A.withObject "Supergroup" $ \o -> do
    is_scam <- optional $ o A..: "is_scam"
    restriction_reason <- optional $ o A..: "restriction_reason"
    is_verified <- optional $ o A..: "is_verified"
    is_channel <- optional $ o A..: "is_channel"
    is_slow_mode_enabled <- optional $ o A..: "is_slow_mode_enabled"
    sign_messages <- optional $ o A..: "sign_messages"
    has_location <- optional $ o A..: "has_location"
    has_linked_chat <- optional $ o A..: "has_linked_chat"
    member_count <- optional $ o A..: "member_count"
    status <- optional $ o A..: "status"
    date <- optional $ o A..: "date"
    username <- optional $ o A..: "username"
    _id <- optional $ o A..: "id"
    return $ Supergroup { is_scam = is_scam, restriction_reason = restriction_reason, is_verified = is_verified, is_channel = is_channel, is_slow_mode_enabled = is_slow_mode_enabled, sign_messages = sign_messages, has_location = has_location, has_linked_chat = has_linked_chat, member_count = member_count, status = status, date = date, username = username, _id = _id }