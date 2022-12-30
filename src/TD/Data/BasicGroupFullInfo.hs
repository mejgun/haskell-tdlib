{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BasicGroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BotCommands as BotCommands
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.ChatMember as ChatMember
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified Utils as U

-- |
data BasicGroupFullInfo = -- | Contains full information about a basic group
  BasicGroupFullInfo
  { -- | List of commands of bots in the group
    bot_commands :: Maybe [BotCommands.BotCommands],
    -- | Primary invite link for this group; may be null. For chat administrators with can_invite_users right only. Updated only after the basic group is opened
    invite_link :: Maybe ChatInviteLink.ChatInviteLink,
    -- | True, if aggressive anti-spam checks can be enabled or disabled in the supergroup after upgrading the basic group to a supergroup
    can_toggle_aggressive_anti_spam :: Maybe Bool,
    -- | True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators after upgrading the basic group to a supergroup
    can_hide_members :: Maybe Bool,
    -- | Group members
    members :: Maybe [ChatMember.ChatMember],
    -- | User identifier of the creator of the group; 0 if unknown
    creator_user_id :: Maybe Int,
    -- |
    description :: Maybe String,
    -- | Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo
    photo :: Maybe ChatPhoto.ChatPhoto
  }
  deriving (Eq)

instance Show BasicGroupFullInfo where
  show
    BasicGroupFullInfo
      { bot_commands = bot_commands_,
        invite_link = invite_link_,
        can_toggle_aggressive_anti_spam = can_toggle_aggressive_anti_spam_,
        can_hide_members = can_hide_members_,
        members = members_,
        creator_user_id = creator_user_id_,
        description = description_,
        photo = photo_
      } =
      "BasicGroupFullInfo"
        ++ U.cc
          [ U.p "bot_commands" bot_commands_,
            U.p "invite_link" invite_link_,
            U.p "can_toggle_aggressive_anti_spam" can_toggle_aggressive_anti_spam_,
            U.p "can_hide_members" can_hide_members_,
            U.p "members" members_,
            U.p "creator_user_id" creator_user_id_,
            U.p "description" description_,
            U.p "photo" photo_
          ]

instance T.FromJSON BasicGroupFullInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "basicGroupFullInfo" -> parseBasicGroupFullInfo v
      _ -> mempty
    where
      parseBasicGroupFullInfo :: A.Value -> T.Parser BasicGroupFullInfo
      parseBasicGroupFullInfo = A.withObject "BasicGroupFullInfo" $ \o -> do
        bot_commands_ <- o A..:? "bot_commands"
        invite_link_ <- o A..:? "invite_link"
        can_toggle_aggressive_anti_spam_ <- o A..:? "can_toggle_aggressive_anti_spam"
        can_hide_members_ <- o A..:? "can_hide_members"
        members_ <- o A..:? "members"
        creator_user_id_ <- o A..:? "creator_user_id"
        description_ <- o A..:? "description"
        photo_ <- o A..:? "photo"
        return $ BasicGroupFullInfo {bot_commands = bot_commands_, invite_link = invite_link_, can_toggle_aggressive_anti_spam = can_toggle_aggressive_anti_spam_, can_hide_members = can_hide_members_, members = members_, creator_user_id = creator_user_id_, description = description_, photo = photo_}
  parseJSON _ = mempty

instance T.ToJSON BasicGroupFullInfo where
  toJSON
    BasicGroupFullInfo
      { bot_commands = bot_commands_,
        invite_link = invite_link_,
        can_toggle_aggressive_anti_spam = can_toggle_aggressive_anti_spam_,
        can_hide_members = can_hide_members_,
        members = members_,
        creator_user_id = creator_user_id_,
        description = description_,
        photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "basicGroupFullInfo",
          "bot_commands" A..= bot_commands_,
          "invite_link" A..= invite_link_,
          "can_toggle_aggressive_anti_spam" A..= can_toggle_aggressive_anti_spam_,
          "can_hide_members" A..= can_hide_members_,
          "members" A..= members_,
          "creator_user_id" A..= creator_user_id_,
          "description" A..= description_,
          "photo" A..= photo_
        ]
