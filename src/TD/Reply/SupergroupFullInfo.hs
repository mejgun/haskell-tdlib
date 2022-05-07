{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.SupergroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.BotCommands as BotCommands
import qualified TD.Reply.ChatInviteLink as ChatInviteLink
import qualified TD.Reply.ChatLocation as ChatLocation
import qualified TD.Reply.ChatPhoto as ChatPhoto
import qualified Utils as U

data SupergroupFullInfo = -- | Contains full information about a supergroup or channel
  SupergroupFullInfo
  { -- | Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
    upgraded_from_max_message_id :: Maybe Int,
    -- | Identifier of the basic group from which supergroup was upgraded; 0 if none
    upgraded_from_basic_group_id :: Maybe Int,
    -- | List of commands of bots in the group
    bot_commands :: Maybe [BotCommands.BotCommands],
    -- | Primary invite link for the chat; may be null. For chat administrators with can_invite_users right only
    invite_link :: Maybe ChatInviteLink.ChatInviteLink,
    -- | Location to which the supergroup is connected; may be null
    location :: Maybe ChatLocation.ChatLocation,
    -- | Identifier of the supergroup sticker set; 0 if none
    sticker_set_id :: Maybe Int,
    -- | True, if new chat members will have access to old messages. In public or discussion groups and both public and private channels, old messages are always available, so this option affects only private supergroups without a linked chat. The value of this field is only available for chat administrators
    is_all_history_available :: Maybe Bool,
    -- | True, if the supergroup or channel statistics are available
    can_get_statistics :: Maybe Bool,
    -- | True, if the supergroup location can be changed
    can_set_location :: Maybe Bool,
    -- | True, if the supergroup sticker set can be changed
    can_set_sticker_set :: Maybe Bool,
    -- | True, if the chat username can be changed
    can_set_username :: Maybe Bool,
    -- | True, if members of the chat can be retrieved
    can_get_members :: Maybe Bool,
    -- | Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero
    slow_mode_delay_expires_in :: Maybe Float,
    -- | Delay between consecutive sent messages for non-administrator supergroup members, in seconds
    slow_mode_delay :: Maybe Int,
    -- | Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown
    linked_chat_id :: Maybe Int,
    -- | Number of users banned from chat; 0 if unknown
    banned_count :: Maybe Int,
    -- | Number of restricted users in the supergroup; 0 if unknown
    restricted_count :: Maybe Int,
    -- | Number of privileged users in the supergroup or channel; 0 if unknown
    administrator_count :: Maybe Int,
    -- | Number of members in the supergroup or channel; 0 if unknown
    member_count :: Maybe Int,
    -- |
    description :: Maybe String,
    -- | Chat photo; may be null
    photo :: Maybe ChatPhoto.ChatPhoto
  }
  deriving (Eq)

instance Show SupergroupFullInfo where
  show
    SupergroupFullInfo
      { upgraded_from_max_message_id = upgraded_from_max_message_id,
        upgraded_from_basic_group_id = upgraded_from_basic_group_id,
        bot_commands = bot_commands,
        invite_link = invite_link,
        location = location,
        sticker_set_id = sticker_set_id,
        is_all_history_available = is_all_history_available,
        can_get_statistics = can_get_statistics,
        can_set_location = can_set_location,
        can_set_sticker_set = can_set_sticker_set,
        can_set_username = can_set_username,
        can_get_members = can_get_members,
        slow_mode_delay_expires_in = slow_mode_delay_expires_in,
        slow_mode_delay = slow_mode_delay,
        linked_chat_id = linked_chat_id,
        banned_count = banned_count,
        restricted_count = restricted_count,
        administrator_count = administrator_count,
        member_count = member_count,
        description = description,
        photo = photo
      } =
      "SupergroupFullInfo"
        ++ U.cc
          [ U.p "upgraded_from_max_message_id" upgraded_from_max_message_id,
            U.p "upgraded_from_basic_group_id" upgraded_from_basic_group_id,
            U.p "bot_commands" bot_commands,
            U.p "invite_link" invite_link,
            U.p "location" location,
            U.p "sticker_set_id" sticker_set_id,
            U.p "is_all_history_available" is_all_history_available,
            U.p "can_get_statistics" can_get_statistics,
            U.p "can_set_location" can_set_location,
            U.p "can_set_sticker_set" can_set_sticker_set,
            U.p "can_set_username" can_set_username,
            U.p "can_get_members" can_get_members,
            U.p "slow_mode_delay_expires_in" slow_mode_delay_expires_in,
            U.p "slow_mode_delay" slow_mode_delay,
            U.p "linked_chat_id" linked_chat_id,
            U.p "banned_count" banned_count,
            U.p "restricted_count" restricted_count,
            U.p "administrator_count" administrator_count,
            U.p "member_count" member_count,
            U.p "description" description,
            U.p "photo" photo
          ]

instance T.FromJSON SupergroupFullInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "supergroupFullInfo" -> parseSupergroupFullInfo v
      _ -> fail ""
    where
      parseSupergroupFullInfo :: A.Value -> T.Parser SupergroupFullInfo
      parseSupergroupFullInfo = A.withObject "SupergroupFullInfo" $ \o -> do
        upgraded_from_max_message_id_ <- mconcat [o A..:? "upgraded_from_max_message_id", U.rm <$> (o A..: "upgraded_from_max_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        upgraded_from_basic_group_id_ <- mconcat [o A..:? "upgraded_from_basic_group_id", U.rm <$> (o A..: "upgraded_from_basic_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        bot_commands_ <- o A..:? "bot_commands"
        invite_link_ <- o A..:? "invite_link"
        location_ <- o A..:? "location"
        sticker_set_id_ <- mconcat [o A..:? "sticker_set_id", U.rm <$> (o A..: "sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        is_all_history_available_ <- o A..:? "is_all_history_available"
        can_get_statistics_ <- o A..:? "can_get_statistics"
        can_set_location_ <- o A..:? "can_set_location"
        can_set_sticker_set_ <- o A..:? "can_set_sticker_set"
        can_set_username_ <- o A..:? "can_set_username"
        can_get_members_ <- o A..:? "can_get_members"
        slow_mode_delay_expires_in_ <- o A..:? "slow_mode_delay_expires_in"
        slow_mode_delay_ <- mconcat [o A..:? "slow_mode_delay", U.rm <$> (o A..: "slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
        linked_chat_id_ <- mconcat [o A..:? "linked_chat_id", U.rm <$> (o A..: "linked_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        banned_count_ <- mconcat [o A..:? "banned_count", U.rm <$> (o A..: "banned_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        restricted_count_ <- mconcat [o A..:? "restricted_count", U.rm <$> (o A..: "restricted_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        administrator_count_ <- mconcat [o A..:? "administrator_count", U.rm <$> (o A..: "administrator_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        member_count_ <- mconcat [o A..:? "member_count", U.rm <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        description_ <- o A..:? "description"
        photo_ <- o A..:? "photo"
        return $ SupergroupFullInfo {upgraded_from_max_message_id = upgraded_from_max_message_id_, upgraded_from_basic_group_id = upgraded_from_basic_group_id_, bot_commands = bot_commands_, invite_link = invite_link_, location = location_, sticker_set_id = sticker_set_id_, is_all_history_available = is_all_history_available_, can_get_statistics = can_get_statistics_, can_set_location = can_set_location_, can_set_sticker_set = can_set_sticker_set_, can_set_username = can_set_username_, can_get_members = can_get_members_, slow_mode_delay_expires_in = slow_mode_delay_expires_in_, slow_mode_delay = slow_mode_delay_, linked_chat_id = linked_chat_id_, banned_count = banned_count_, restricted_count = restricted_count_, administrator_count = administrator_count_, member_count = member_count_, description = description_, photo = photo_}
  parseJSON _ = fail ""

instance T.ToJSON SupergroupFullInfo where
  toJSON
    SupergroupFullInfo
      { upgraded_from_max_message_id = upgraded_from_max_message_id,
        upgraded_from_basic_group_id = upgraded_from_basic_group_id,
        bot_commands = bot_commands,
        invite_link = invite_link,
        location = location,
        sticker_set_id = sticker_set_id,
        is_all_history_available = is_all_history_available,
        can_get_statistics = can_get_statistics,
        can_set_location = can_set_location,
        can_set_sticker_set = can_set_sticker_set,
        can_set_username = can_set_username,
        can_get_members = can_get_members,
        slow_mode_delay_expires_in = slow_mode_delay_expires_in,
        slow_mode_delay = slow_mode_delay,
        linked_chat_id = linked_chat_id,
        banned_count = banned_count,
        restricted_count = restricted_count,
        administrator_count = administrator_count,
        member_count = member_count,
        description = description,
        photo = photo
      } =
      A.object
        [ "@type" A..= T.String "supergroupFullInfo",
          "upgraded_from_max_message_id" A..= upgraded_from_max_message_id,
          "upgraded_from_basic_group_id" A..= upgraded_from_basic_group_id,
          "bot_commands" A..= bot_commands,
          "invite_link" A..= invite_link,
          "location" A..= location,
          "sticker_set_id" A..= sticker_set_id,
          "is_all_history_available" A..= is_all_history_available,
          "can_get_statistics" A..= can_get_statistics,
          "can_set_location" A..= can_set_location,
          "can_set_sticker_set" A..= can_set_sticker_set,
          "can_set_username" A..= can_set_username,
          "can_get_members" A..= can_get_members,
          "slow_mode_delay_expires_in" A..= slow_mode_delay_expires_in,
          "slow_mode_delay" A..= slow_mode_delay,
          "linked_chat_id" A..= linked_chat_id,
          "banned_count" A..= banned_count,
          "restricted_count" A..= restricted_count,
          "administrator_count" A..= administrator_count,
          "member_count" A..= member_count,
          "description" A..= description,
          "photo" A..= photo
        ]
