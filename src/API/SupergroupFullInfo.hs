-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SupergroupFullInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BotCommands as BotCommands
import {-# SOURCE #-} qualified API.ChatInviteLink as ChatInviteLink
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto

-- |
-- 
-- Contains full information about a supergroup or channel
-- 
-- __photo__ Chat photo; may be null
-- 
-- __param_description__ Supergroup or channel description
-- 
-- __member_count__ Number of members in the supergroup or channel; 0 if unknown
-- 
-- __administrator_count__ Number of privileged users in the supergroup or channel; 0 if unknown
-- 
-- __restricted_count__ Number of restricted users in the supergroup; 0 if unknown
-- 
-- __banned_count__ Number of users banned from chat; 0 if unknown
-- 
-- __linked_chat_id__ Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown
-- 
-- __slow_mode_delay__ Delay between consecutive sent messages for non-administrator supergroup members, in seconds
-- 
-- __slow_mode_delay_expires_in__ Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero
-- 
-- __can_get_members__ True, if members of the chat can be retrieved
-- 
-- __can_set_username__ True, if the chat username can be changed
-- 
-- __can_set_sticker_set__ True, if the supergroup sticker set can be changed
-- 
-- __can_set_location__ True, if the supergroup location can be changed
-- 
-- __can_get_statistics__ True, if the supergroup or channel statistics are available
-- 
-- __is_all_history_available__ True, if new chat members will have access to old messages. In public or discussion groups and both public and private channels, old messages are always available, so this option affects only private supergroups without a linked chat. The value of this field is only available for chat administrators
-- 
-- __sticker_set_id__ Identifier of the supergroup sticker set; 0 if none
-- 
-- __location__ Location to which the supergroup is connected; may be null
-- 
-- __invite_link__ Primary invite link for this chat; may be null. For chat administrators with can_invite_users right only
-- 
-- __bot_commands__ List of commands of bots in the group
-- 
-- __upgraded_from_basic_group_id__ Identifier of the basic group from which supergroup was upgraded; 0 if none
-- 
-- __upgraded_from_max_message_id__ Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
data SupergroupFullInfo = 

 SupergroupFullInfo { upgraded_from_max_message_id :: Maybe Int, upgraded_from_basic_group_id :: Maybe Int, bot_commands :: Maybe [BotCommands.BotCommands], invite_link :: Maybe ChatInviteLink.ChatInviteLink, location :: Maybe ChatLocation.ChatLocation, sticker_set_id :: Maybe Int, is_all_history_available :: Maybe Bool, can_get_statistics :: Maybe Bool, can_set_location :: Maybe Bool, can_set_sticker_set :: Maybe Bool, can_set_username :: Maybe Bool, can_get_members :: Maybe Bool, slow_mode_delay_expires_in :: Maybe Float, slow_mode_delay :: Maybe Int, linked_chat_id :: Maybe Int, banned_count :: Maybe Int, restricted_count :: Maybe Int, administrator_count :: Maybe Int, member_count :: Maybe Int, description :: Maybe String, photo :: Maybe ChatPhoto.ChatPhoto }  deriving (Show, Eq)

instance T.ToJSON SupergroupFullInfo where
 toJSON (SupergroupFullInfo { upgraded_from_max_message_id = upgraded_from_max_message_id, upgraded_from_basic_group_id = upgraded_from_basic_group_id, bot_commands = bot_commands, invite_link = invite_link, location = location, sticker_set_id = sticker_set_id, is_all_history_available = is_all_history_available, can_get_statistics = can_get_statistics, can_set_location = can_set_location, can_set_sticker_set = can_set_sticker_set, can_set_username = can_set_username, can_get_members = can_get_members, slow_mode_delay_expires_in = slow_mode_delay_expires_in, slow_mode_delay = slow_mode_delay, linked_chat_id = linked_chat_id, banned_count = banned_count, restricted_count = restricted_count, administrator_count = administrator_count, member_count = member_count, description = description, photo = photo }) =
  A.object [ "@type" A..= T.String "supergroupFullInfo", "upgraded_from_max_message_id" A..= upgraded_from_max_message_id, "upgraded_from_basic_group_id" A..= upgraded_from_basic_group_id, "bot_commands" A..= bot_commands, "invite_link" A..= invite_link, "location" A..= location, "sticker_set_id" A..= sticker_set_id, "is_all_history_available" A..= is_all_history_available, "can_get_statistics" A..= can_get_statistics, "can_set_location" A..= can_set_location, "can_set_sticker_set" A..= can_set_sticker_set, "can_set_username" A..= can_set_username, "can_get_members" A..= can_get_members, "slow_mode_delay_expires_in" A..= slow_mode_delay_expires_in, "slow_mode_delay" A..= slow_mode_delay, "linked_chat_id" A..= linked_chat_id, "banned_count" A..= banned_count, "restricted_count" A..= restricted_count, "administrator_count" A..= administrator_count, "member_count" A..= member_count, "description" A..= description, "photo" A..= photo ]

instance T.FromJSON SupergroupFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "supergroupFullInfo" -> parseSupergroupFullInfo v
   _ -> mempty
  where
   parseSupergroupFullInfo :: A.Value -> T.Parser SupergroupFullInfo
   parseSupergroupFullInfo = A.withObject "SupergroupFullInfo" $ \o -> do
    upgraded_from_max_message_id <- mconcat [ o A..:? "upgraded_from_max_message_id", readMaybe <$> (o A..: "upgraded_from_max_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    upgraded_from_basic_group_id <- mconcat [ o A..:? "upgraded_from_basic_group_id", readMaybe <$> (o A..: "upgraded_from_basic_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    bot_commands <- o A..:? "bot_commands"
    invite_link <- o A..:? "invite_link"
    location <- o A..:? "location"
    sticker_set_id <- mconcat [ o A..:? "sticker_set_id", readMaybe <$> (o A..: "sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_all_history_available <- o A..:? "is_all_history_available"
    can_get_statistics <- o A..:? "can_get_statistics"
    can_set_location <- o A..:? "can_set_location"
    can_set_sticker_set <- o A..:? "can_set_sticker_set"
    can_set_username <- o A..:? "can_set_username"
    can_get_members <- o A..:? "can_get_members"
    slow_mode_delay_expires_in <- o A..:? "slow_mode_delay_expires_in"
    slow_mode_delay <- mconcat [ o A..:? "slow_mode_delay", readMaybe <$> (o A..: "slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
    linked_chat_id <- mconcat [ o A..:? "linked_chat_id", readMaybe <$> (o A..: "linked_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    banned_count <- mconcat [ o A..:? "banned_count", readMaybe <$> (o A..: "banned_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    restricted_count <- mconcat [ o A..:? "restricted_count", readMaybe <$> (o A..: "restricted_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    administrator_count <- mconcat [ o A..:? "administrator_count", readMaybe <$> (o A..: "administrator_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    member_count <- mconcat [ o A..:? "member_count", readMaybe <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    description <- o A..:? "description"
    photo <- o A..:? "photo"
    return $ SupergroupFullInfo { upgraded_from_max_message_id = upgraded_from_max_message_id, upgraded_from_basic_group_id = upgraded_from_basic_group_id, bot_commands = bot_commands, invite_link = invite_link, location = location, sticker_set_id = sticker_set_id, is_all_history_available = is_all_history_available, can_get_statistics = can_get_statistics, can_set_location = can_set_location, can_set_sticker_set = can_set_sticker_set, can_set_username = can_set_username, can_get_members = can_get_members, slow_mode_delay_expires_in = slow_mode_delay_expires_in, slow_mode_delay = slow_mode_delay, linked_chat_id = linked_chat_id, banned_count = banned_count, restricted_count = restricted_count, administrator_count = administrator_count, member_count = member_count, description = description, photo = photo }