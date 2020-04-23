-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserFullInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotInfo as BotInfo

data UserFullInfo = 
 UserFullInfo { bot_info :: Maybe BotInfo.BotInfo, group_in_common_count :: Maybe Int, share_text :: Maybe String, bio :: Maybe String, need_phone_number_privacy_exception :: Maybe Bool, has_private_calls :: Maybe Bool, can_be_called :: Maybe Bool, is_blocked :: Maybe Bool }  deriving (Show)

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
    bot_info <- optional $ o A..: "bot_info"
    group_in_common_count <- optional $ o A..: "group_in_common_count"
    share_text <- optional $ o A..: "share_text"
    bio <- optional $ o A..: "bio"
    need_phone_number_privacy_exception <- optional $ o A..: "need_phone_number_privacy_exception"
    has_private_calls <- optional $ o A..: "has_private_calls"
    can_be_called <- optional $ o A..: "can_be_called"
    is_blocked <- optional $ o A..: "is_blocked"
    return $ UserFullInfo { bot_info = bot_info, group_in_common_count = group_in_common_count, share_text = share_text, bio = bio, need_phone_number_privacy_exception = need_phone_number_privacy_exception, has_private_calls = has_private_calls, can_be_called = can_be_called, is_blocked = is_blocked }