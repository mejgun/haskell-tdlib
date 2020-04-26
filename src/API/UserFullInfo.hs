-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserFullInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotInfo as BotInfo

-- |
-- 
-- Contains full information about a user (except the full list of profile photos) 
-- 
-- __is_blocked__ True, if the user is blacklisted by the current user
-- 
-- __can_be_called__ True, if the user can be called
-- 
-- __has_private_calls__ True, if the user can't be called due to their privacy settings
-- 
-- __need_phone_number_privacy_exception__ True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
-- 
-- __bio__ A short user bio
-- 
-- __share_text__ For bots, the text that is included with the link when users share the bot
-- 
-- __group_in_common_count__ Number of group chats where both the other user and the current user are a member; 0 for the current user
-- 
-- __bot_info__ If the user is a bot, information about the bot; may be null
data UserFullInfo = 
 UserFullInfo { bot_info :: Maybe BotInfo.BotInfo, group_in_common_count :: Maybe Int, share_text :: Maybe String, bio :: Maybe String, need_phone_number_privacy_exception :: Maybe Bool, has_private_calls :: Maybe Bool, can_be_called :: Maybe Bool, is_blocked :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON UserFullInfo where
 toJSON (UserFullInfo { bot_info = bot_info, group_in_common_count = group_in_common_count, share_text = share_text, bio = bio, need_phone_number_privacy_exception = need_phone_number_privacy_exception, has_private_calls = has_private_calls, can_be_called = can_be_called, is_blocked = is_blocked }) =
  A.object [ "@type" A..= T.String "userFullInfo", "bot_info" A..= bot_info, "group_in_common_count" A..= group_in_common_count, "share_text" A..= share_text, "bio" A..= bio, "need_phone_number_privacy_exception" A..= need_phone_number_privacy_exception, "has_private_calls" A..= has_private_calls, "can_be_called" A..= can_be_called, "is_blocked" A..= is_blocked ]

instance T.FromJSON UserFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userFullInfo" -> parseUserFullInfo v
   _ -> mempty
  where
   parseUserFullInfo :: A.Value -> T.Parser UserFullInfo
   parseUserFullInfo = A.withObject "UserFullInfo" $ \o -> do
    bot_info <- o A..:? "bot_info"
    group_in_common_count <- mconcat [ o A..:? "group_in_common_count", readMaybe <$> (o A..: "group_in_common_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    share_text <- o A..:? "share_text"
    bio <- o A..:? "bio"
    need_phone_number_privacy_exception <- o A..:? "need_phone_number_privacy_exception"
    has_private_calls <- o A..:? "has_private_calls"
    can_be_called <- o A..:? "can_be_called"
    is_blocked <- o A..:? "is_blocked"
    return $ UserFullInfo { bot_info = bot_info, group_in_common_count = group_in_common_count, share_text = share_text, bio = bio, need_phone_number_privacy_exception = need_phone_number_privacy_exception, has_private_calls = has_private_calls, can_be_called = can_be_called, is_blocked = is_blocked }