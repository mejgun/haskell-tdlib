-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SupergroupFullInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

data SupergroupFullInfo = 
 SupergroupFullInfo { upgraded_from_max_message_id :: Maybe Int, upgraded_from_basic_group_id :: Maybe Int, invite_link :: Maybe String, location :: Maybe ChatLocation.ChatLocation, sticker_set_id :: Maybe Int, is_all_history_available :: Maybe Bool, can_view_statistics :: Maybe Bool, can_set_location :: Maybe Bool, can_set_sticker_set :: Maybe Bool, can_set_username :: Maybe Bool, can_get_members :: Maybe Bool, slow_mode_delay_expires_in :: Maybe Float, slow_mode_delay :: Maybe Int, linked_chat_id :: Maybe Int, banned_count :: Maybe Int, restricted_count :: Maybe Int, administrator_count :: Maybe Int, member_count :: Maybe Int, description :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SupergroupFullInfo where
 toJSON (SupergroupFullInfo { upgraded_from_max_message_id = upgraded_from_max_message_id, upgraded_from_basic_group_id = upgraded_from_basic_group_id, invite_link = invite_link, location = location, sticker_set_id = sticker_set_id, is_all_history_available = is_all_history_available, can_view_statistics = can_view_statistics, can_set_location = can_set_location, can_set_sticker_set = can_set_sticker_set, can_set_username = can_set_username, can_get_members = can_get_members, slow_mode_delay_expires_in = slow_mode_delay_expires_in, slow_mode_delay = slow_mode_delay, linked_chat_id = linked_chat_id, banned_count = banned_count, restricted_count = restricted_count, administrator_count = administrator_count, member_count = member_count, description = description }) =
  A.object [ "@type" A..= T.String "supergroupFullInfo", "upgraded_from_max_message_id" A..= upgraded_from_max_message_id, "upgraded_from_basic_group_id" A..= upgraded_from_basic_group_id, "invite_link" A..= invite_link, "location" A..= location, "sticker_set_id" A..= sticker_set_id, "is_all_history_available" A..= is_all_history_available, "can_view_statistics" A..= can_view_statistics, "can_set_location" A..= can_set_location, "can_set_sticker_set" A..= can_set_sticker_set, "can_set_username" A..= can_set_username, "can_get_members" A..= can_get_members, "slow_mode_delay_expires_in" A..= slow_mode_delay_expires_in, "slow_mode_delay" A..= slow_mode_delay, "linked_chat_id" A..= linked_chat_id, "banned_count" A..= banned_count, "restricted_count" A..= restricted_count, "administrator_count" A..= administrator_count, "member_count" A..= member_count, "description" A..= description ]

instance T.FromJSON SupergroupFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "supergroupFullInfo" -> parseSupergroupFullInfo v
   _ -> mempty
  where
   parseSupergroupFullInfo :: A.Value -> T.Parser SupergroupFullInfo
   parseSupergroupFullInfo = A.withObject "SupergroupFullInfo" $ \o -> do
    upgraded_from_max_message_id <- optional $ o A..: "upgraded_from_max_message_id"
    upgraded_from_basic_group_id <- optional $ o A..: "upgraded_from_basic_group_id"
    invite_link <- optional $ o A..: "invite_link"
    location <- optional $ o A..: "location"
    sticker_set_id <- optional $ o A..: "sticker_set_id"
    is_all_history_available <- optional $ o A..: "is_all_history_available"
    can_view_statistics <- optional $ o A..: "can_view_statistics"
    can_set_location <- optional $ o A..: "can_set_location"
    can_set_sticker_set <- optional $ o A..: "can_set_sticker_set"
    can_set_username <- optional $ o A..: "can_set_username"
    can_get_members <- optional $ o A..: "can_get_members"
    slow_mode_delay_expires_in <- optional $ o A..: "slow_mode_delay_expires_in"
    slow_mode_delay <- optional $ o A..: "slow_mode_delay"
    linked_chat_id <- optional $ o A..: "linked_chat_id"
    banned_count <- optional $ o A..: "banned_count"
    restricted_count <- optional $ o A..: "restricted_count"
    administrator_count <- optional $ o A..: "administrator_count"
    member_count <- optional $ o A..: "member_count"
    description <- optional $ o A..: "description"
    return $ SupergroupFullInfo { upgraded_from_max_message_id = upgraded_from_max_message_id, upgraded_from_basic_group_id = upgraded_from_basic_group_id, invite_link = invite_link, location = location, sticker_set_id = sticker_set_id, is_all_history_available = is_all_history_available, can_view_statistics = can_view_statistics, can_set_location = can_set_location, can_set_sticker_set = can_set_sticker_set, can_set_username = can_set_username, can_get_members = can_get_members, slow_mode_delay_expires_in = slow_mode_delay_expires_in, slow_mode_delay = slow_mode_delay, linked_chat_id = linked_chat_id, banned_count = banned_count, restricted_count = restricted_count, administrator_count = administrator_count, member_count = member_count, description = description }