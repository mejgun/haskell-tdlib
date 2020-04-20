-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotInfo as BotInfo

--main = putStrLn "ok"

data UserFullInfo = 
 UserFullInfo { bot_info :: BotInfo.BotInfo, group_in_common_count :: Int, share_text :: String, bio :: String, need_phone_number_privacy_exception :: Bool, has_private_calls :: Bool, can_be_called :: Bool, is_blocked :: Bool }  -- deriving (Show)

instance T.ToJSON UserFullInfo where
 toJSON (UserFullInfo { bot_info = bot_info, group_in_common_count = group_in_common_count, share_text = share_text, bio = bio, need_phone_number_privacy_exception = need_phone_number_privacy_exception, has_private_calls = has_private_calls, can_be_called = can_be_called, is_blocked = is_blocked }) =
  A.object [ "@type" A..= T.String "userFullInfo", "bot_info" A..= bot_info, "group_in_common_count" A..= group_in_common_count, "share_text" A..= share_text, "bio" A..= bio, "need_phone_number_privacy_exception" A..= need_phone_number_privacy_exception, "has_private_calls" A..= has_private_calls, "can_be_called" A..= can_be_called, "is_blocked" A..= is_blocked ]
-- userFullInfo UserFullInfo  { bot_info :: BotInfo.BotInfo, group_in_common_count :: Int, share_text :: String, bio :: String, need_phone_number_privacy_exception :: Bool, has_private_calls :: Bool, can_be_called :: Bool, is_blocked :: Bool } 

