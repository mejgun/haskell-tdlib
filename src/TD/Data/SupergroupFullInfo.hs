module TD.Data.SupergroupFullInfo (SupergroupFullInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified Data.Text as T
import qualified TD.Data.ChatLocation as ChatLocation
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.BotCommands as BotCommands

data SupergroupFullInfo
  = SupergroupFullInfo -- ^ Contains full information about a supergroup or channel
    { photo                            :: Maybe ChatPhoto.ChatPhoto           -- ^ Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo
    , description                      :: Maybe T.Text
    , member_count                     :: Maybe Int                           -- ^ Number of members in the supergroup or channel; 0 if unknown
    , administrator_count              :: Maybe Int                           -- ^ Number of privileged users in the supergroup or channel; 0 if unknown
    , restricted_count                 :: Maybe Int                           -- ^ Number of restricted users in the supergroup; 0 if unknown
    , banned_count                     :: Maybe Int                           -- ^ Number of users banned from chat; 0 if unknown
    , linked_chat_id                   :: Maybe Int                           -- ^ Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown
    , slow_mode_delay                  :: Maybe Int                           -- ^ Delay between consecutive sent messages for non-administrator supergroup members, in seconds
    , slow_mode_delay_expires_in       :: Maybe Double                        -- ^ Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero
    , can_get_members                  :: Maybe Bool                          -- ^ True, if members of the chat can be retrieved via getSupergroupMembers or searchChatMembers
    , has_hidden_members               :: Maybe Bool                          -- ^ True, if non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers
    , can_hide_members                 :: Maybe Bool                          -- ^ True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators
    , can_set_sticker_set              :: Maybe Bool                          -- ^ True, if the supergroup sticker set can be changed
    , can_set_location                 :: Maybe Bool                          -- ^ True, if the supergroup location can be changed
    , can_get_statistics               :: Maybe Bool                          -- ^ True, if the supergroup or channel statistics are available
    , can_toggle_aggressive_anti_spam  :: Maybe Bool                          -- ^ True, if aggressive anti-spam checks can be enabled or disabled in the supergroup
    , is_all_history_available         :: Maybe Bool                          -- ^ True, if new chat members will have access to old messages. In public, discussion, of forum groups and all channels, old messages are always available, so this option affects only private non-forum supergroups without a linked chat. The value of this field is only available to chat administrators
    , has_aggressive_anti_spam_enabled :: Maybe Bool                          -- ^ True, if aggressive anti-spam checks are enabled in the supergroup. The value of this field is only available to chat administrators
    , sticker_set_id                   :: Maybe Int                           -- ^ Identifier of the supergroup sticker set; 0 if none
    , location                         :: Maybe ChatLocation.ChatLocation     -- ^ Location to which the supergroup is connected; may be null if none
    , invite_link                      :: Maybe ChatInviteLink.ChatInviteLink -- ^ Primary invite link for the chat; may be null. For chat administrators with can_invite_users right only
    , bot_commands                     :: Maybe [BotCommands.BotCommands]     -- ^ List of commands of bots in the group
    , upgraded_from_basic_group_id     :: Maybe Int                           -- ^ Identifier of the basic group from which supergroup was upgraded; 0 if none
    , upgraded_from_max_message_id     :: Maybe Int                           -- ^ Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
    }
  deriving (Eq)

instance Show SupergroupFullInfo where
  show SupergroupFullInfo
    { photo                            = photo_
    , description                      = description_
    , member_count                     = member_count_
    , administrator_count              = administrator_count_
    , restricted_count                 = restricted_count_
    , banned_count                     = banned_count_
    , linked_chat_id                   = linked_chat_id_
    , slow_mode_delay                  = slow_mode_delay_
    , slow_mode_delay_expires_in       = slow_mode_delay_expires_in_
    , can_get_members                  = can_get_members_
    , has_hidden_members               = has_hidden_members_
    , can_hide_members                 = can_hide_members_
    , can_set_sticker_set              = can_set_sticker_set_
    , can_set_location                 = can_set_location_
    , can_get_statistics               = can_get_statistics_
    , can_toggle_aggressive_anti_spam  = can_toggle_aggressive_anti_spam_
    , is_all_history_available         = is_all_history_available_
    , has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_
    , sticker_set_id                   = sticker_set_id_
    , location                         = location_
    , invite_link                      = invite_link_
    , bot_commands                     = bot_commands_
    , upgraded_from_basic_group_id     = upgraded_from_basic_group_id_
    , upgraded_from_max_message_id     = upgraded_from_max_message_id_
    }
      = "SupergroupFullInfo"
        ++ I.cc
        [ "photo"                            `I.p` photo_
        , "description"                      `I.p` description_
        , "member_count"                     `I.p` member_count_
        , "administrator_count"              `I.p` administrator_count_
        , "restricted_count"                 `I.p` restricted_count_
        , "banned_count"                     `I.p` banned_count_
        , "linked_chat_id"                   `I.p` linked_chat_id_
        , "slow_mode_delay"                  `I.p` slow_mode_delay_
        , "slow_mode_delay_expires_in"       `I.p` slow_mode_delay_expires_in_
        , "can_get_members"                  `I.p` can_get_members_
        , "has_hidden_members"               `I.p` has_hidden_members_
        , "can_hide_members"                 `I.p` can_hide_members_
        , "can_set_sticker_set"              `I.p` can_set_sticker_set_
        , "can_set_location"                 `I.p` can_set_location_
        , "can_get_statistics"               `I.p` can_get_statistics_
        , "can_toggle_aggressive_anti_spam"  `I.p` can_toggle_aggressive_anti_spam_
        , "is_all_history_available"         `I.p` is_all_history_available_
        , "has_aggressive_anti_spam_enabled" `I.p` has_aggressive_anti_spam_enabled_
        , "sticker_set_id"                   `I.p` sticker_set_id_
        , "location"                         `I.p` location_
        , "invite_link"                      `I.p` invite_link_
        , "bot_commands"                     `I.p` bot_commands_
        , "upgraded_from_basic_group_id"     `I.p` upgraded_from_basic_group_id_
        , "upgraded_from_max_message_id"     `I.p` upgraded_from_max_message_id_
        ]

instance AT.FromJSON SupergroupFullInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "supergroupFullInfo" -> parseSupergroupFullInfo v
      _                    -> mempty
    
    where
      parseSupergroupFullInfo :: A.Value -> AT.Parser SupergroupFullInfo
      parseSupergroupFullInfo = A.withObject "SupergroupFullInfo" $ \o -> do
        photo_                            <- o A..:?                       "photo"
        description_                      <- o A..:?                       "description"
        member_count_                     <- o A..:?                       "member_count"
        administrator_count_              <- o A..:?                       "administrator_count"
        restricted_count_                 <- o A..:?                       "restricted_count"
        banned_count_                     <- o A..:?                       "banned_count"
        linked_chat_id_                   <- o A..:?                       "linked_chat_id"
        slow_mode_delay_                  <- o A..:?                       "slow_mode_delay"
        slow_mode_delay_expires_in_       <- o A..:?                       "slow_mode_delay_expires_in"
        can_get_members_                  <- o A..:?                       "can_get_members"
        has_hidden_members_               <- o A..:?                       "has_hidden_members"
        can_hide_members_                 <- o A..:?                       "can_hide_members"
        can_set_sticker_set_              <- o A..:?                       "can_set_sticker_set"
        can_set_location_                 <- o A..:?                       "can_set_location"
        can_get_statistics_               <- o A..:?                       "can_get_statistics"
        can_toggle_aggressive_anti_spam_  <- o A..:?                       "can_toggle_aggressive_anti_spam"
        is_all_history_available_         <- o A..:?                       "is_all_history_available"
        has_aggressive_anti_spam_enabled_ <- o A..:?                       "has_aggressive_anti_spam_enabled"
        sticker_set_id_                   <- fmap I.readInt64 <$> o A..:?  "sticker_set_id"
        location_                         <- o A..:?                       "location"
        invite_link_                      <- o A..:?                       "invite_link"
        bot_commands_                     <- o A..:?                       "bot_commands"
        upgraded_from_basic_group_id_     <- o A..:?                       "upgraded_from_basic_group_id"
        upgraded_from_max_message_id_     <- o A..:?                       "upgraded_from_max_message_id"
        pure $ SupergroupFullInfo
          { photo                            = photo_
          , description                      = description_
          , member_count                     = member_count_
          , administrator_count              = administrator_count_
          , restricted_count                 = restricted_count_
          , banned_count                     = banned_count_
          , linked_chat_id                   = linked_chat_id_
          , slow_mode_delay                  = slow_mode_delay_
          , slow_mode_delay_expires_in       = slow_mode_delay_expires_in_
          , can_get_members                  = can_get_members_
          , has_hidden_members               = has_hidden_members_
          , can_hide_members                 = can_hide_members_
          , can_set_sticker_set              = can_set_sticker_set_
          , can_set_location                 = can_set_location_
          , can_get_statistics               = can_get_statistics_
          , can_toggle_aggressive_anti_spam  = can_toggle_aggressive_anti_spam_
          , is_all_history_available         = is_all_history_available_
          , has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_
          , sticker_set_id                   = sticker_set_id_
          , location                         = location_
          , invite_link                      = invite_link_
          , bot_commands                     = bot_commands_
          , upgraded_from_basic_group_id     = upgraded_from_basic_group_id_
          , upgraded_from_max_message_id     = upgraded_from_max_message_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON SupergroupFullInfo where
  toJSON SupergroupFullInfo
    { photo                            = photo_
    , description                      = description_
    , member_count                     = member_count_
    , administrator_count              = administrator_count_
    , restricted_count                 = restricted_count_
    , banned_count                     = banned_count_
    , linked_chat_id                   = linked_chat_id_
    , slow_mode_delay                  = slow_mode_delay_
    , slow_mode_delay_expires_in       = slow_mode_delay_expires_in_
    , can_get_members                  = can_get_members_
    , has_hidden_members               = has_hidden_members_
    , can_hide_members                 = can_hide_members_
    , can_set_sticker_set              = can_set_sticker_set_
    , can_set_location                 = can_set_location_
    , can_get_statistics               = can_get_statistics_
    , can_toggle_aggressive_anti_spam  = can_toggle_aggressive_anti_spam_
    , is_all_history_available         = is_all_history_available_
    , has_aggressive_anti_spam_enabled = has_aggressive_anti_spam_enabled_
    , sticker_set_id                   = sticker_set_id_
    , location                         = location_
    , invite_link                      = invite_link_
    , bot_commands                     = bot_commands_
    , upgraded_from_basic_group_id     = upgraded_from_basic_group_id_
    , upgraded_from_max_message_id     = upgraded_from_max_message_id_
    }
      = A.object
        [ "@type"                            A..= AT.String "supergroupFullInfo"
        , "photo"                            A..= photo_
        , "description"                      A..= description_
        , "member_count"                     A..= member_count_
        , "administrator_count"              A..= administrator_count_
        , "restricted_count"                 A..= restricted_count_
        , "banned_count"                     A..= banned_count_
        , "linked_chat_id"                   A..= linked_chat_id_
        , "slow_mode_delay"                  A..= slow_mode_delay_
        , "slow_mode_delay_expires_in"       A..= slow_mode_delay_expires_in_
        , "can_get_members"                  A..= can_get_members_
        , "has_hidden_members"               A..= has_hidden_members_
        , "can_hide_members"                 A..= can_hide_members_
        , "can_set_sticker_set"              A..= can_set_sticker_set_
        , "can_set_location"                 A..= can_set_location_
        , "can_get_statistics"               A..= can_get_statistics_
        , "can_toggle_aggressive_anti_spam"  A..= can_toggle_aggressive_anti_spam_
        , "is_all_history_available"         A..= is_all_history_available_
        , "has_aggressive_anti_spam_enabled" A..= has_aggressive_anti_spam_enabled_
        , "sticker_set_id"                   A..= fmap I.writeInt64  sticker_set_id_
        , "location"                         A..= location_
        , "invite_link"                      A..= invite_link_
        , "bot_commands"                     A..= bot_commands_
        , "upgraded_from_basic_group_id"     A..= upgraded_from_basic_group_id_
        , "upgraded_from_max_message_id"     A..= upgraded_from_max_message_id_
        ]
