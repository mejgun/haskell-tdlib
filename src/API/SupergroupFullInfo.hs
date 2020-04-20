-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SupergroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

--main = putStrLn "ok"

data SupergroupFullInfo = 
 SupergroupFullInfo { upgraded_from_max_message_id :: Int, upgraded_from_basic_group_id :: Int, invite_link :: String, location :: ChatLocation.ChatLocation, sticker_set_id :: Int, is_all_history_available :: Bool, can_view_statistics :: Bool, can_set_location :: Bool, can_set_sticker_set :: Bool, can_set_username :: Bool, can_get_members :: Bool, slow_mode_delay_expires_in :: Float, slow_mode_delay :: Int, linked_chat_id :: Int, banned_count :: Int, restricted_count :: Int, administrator_count :: Int, member_count :: Int, description :: String }  -- deriving (Show)

instance T.ToJSON SupergroupFullInfo where
 toJSON (SupergroupFullInfo { upgraded_from_max_message_id = upgraded_from_max_message_id, upgraded_from_basic_group_id = upgraded_from_basic_group_id, invite_link = invite_link, location = location, sticker_set_id = sticker_set_id, is_all_history_available = is_all_history_available, can_view_statistics = can_view_statistics, can_set_location = can_set_location, can_set_sticker_set = can_set_sticker_set, can_set_username = can_set_username, can_get_members = can_get_members, slow_mode_delay_expires_in = slow_mode_delay_expires_in, slow_mode_delay = slow_mode_delay, linked_chat_id = linked_chat_id, banned_count = banned_count, restricted_count = restricted_count, administrator_count = administrator_count, member_count = member_count, description = description }) =
  A.object [ "@type" A..= T.String "supergroupFullInfo", "upgraded_from_max_message_id" A..= upgraded_from_max_message_id, "upgraded_from_basic_group_id" A..= upgraded_from_basic_group_id, "invite_link" A..= invite_link, "location" A..= location, "sticker_set_id" A..= sticker_set_id, "is_all_history_available" A..= is_all_history_available, "can_view_statistics" A..= can_view_statistics, "can_set_location" A..= can_set_location, "can_set_sticker_set" A..= can_set_sticker_set, "can_set_username" A..= can_set_username, "can_get_members" A..= can_get_members, "slow_mode_delay_expires_in" A..= slow_mode_delay_expires_in, "slow_mode_delay" A..= slow_mode_delay, "linked_chat_id" A..= linked_chat_id, "banned_count" A..= banned_count, "restricted_count" A..= restricted_count, "administrator_count" A..= administrator_count, "member_count" A..= member_count, "description" A..= description ]
-- supergroupFullInfo SupergroupFullInfo  { upgraded_from_max_message_id :: Int, upgraded_from_basic_group_id :: Int, invite_link :: String, location :: ChatLocation.ChatLocation, sticker_set_id :: Int, is_all_history_available :: Bool, can_view_statistics :: Bool, can_set_location :: Bool, can_set_sticker_set :: Bool, can_set_username :: Bool, can_get_members :: Bool, slow_mode_delay_expires_in :: Float, slow_mode_delay :: Int, linked_chat_id :: Int, banned_count :: Int, restricted_count :: Int, administrator_count :: Int, member_count :: Int, description :: String } 



instance T.FromJSON SupergroupFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "supergroupFullInfo" -> parseSupergroupFullInfo v
  where
   parseSupergroupFullInfo :: A.Value -> T.Parser SupergroupFullInfo
   parseSupergroupFullInfo = A.withObject "SupergroupFullInfo" $ \o -> do
    upgraded_from_max_message_id <- o A..: "upgraded_from_max_message_id"
    upgraded_from_basic_group_id <- o A..: "upgraded_from_basic_group_id"
    invite_link <- o A..: "invite_link"
    location <- o A..: "location"
    sticker_set_id <- o A..: "sticker_set_id"
    is_all_history_available <- o A..: "is_all_history_available"
    can_view_statistics <- o A..: "can_view_statistics"
    can_set_location <- o A..: "can_set_location"
    can_set_sticker_set <- o A..: "can_set_sticker_set"
    can_set_username <- o A..: "can_set_username"
    can_get_members <- o A..: "can_get_members"
    slow_mode_delay_expires_in <- o A..: "slow_mode_delay_expires_in"
    slow_mode_delay <- o A..: "slow_mode_delay"
    linked_chat_id <- o A..: "linked_chat_id"
    banned_count <- o A..: "banned_count"
    restricted_count <- o A..: "restricted_count"
    administrator_count <- o A..: "administrator_count"
    member_count <- o A..: "member_count"
    description <- o A..: "description"
    return $ SupergroupFullInfo { upgraded_from_max_message_id = upgraded_from_max_message_id, upgraded_from_basic_group_id = upgraded_from_basic_group_id, invite_link = invite_link, location = location, sticker_set_id = sticker_set_id, is_all_history_available = is_all_history_available, can_view_statistics = can_view_statistics, can_set_location = can_set_location, can_set_sticker_set = can_set_sticker_set, can_set_username = can_set_username, can_get_members = can_get_members, slow_mode_delay_expires_in = slow_mode_delay_expires_in, slow_mode_delay = slow_mode_delay, linked_chat_id = linked_chat_id, banned_count = banned_count, restricted_count = restricted_count, administrator_count = administrator_count, member_count = member_count, description = description }