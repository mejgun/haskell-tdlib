module TD.Data.BasicGroupFullInfo
  (BasicGroupFullInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified Data.Text as T
import qualified TD.Data.ChatMember as ChatMember
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified TD.Data.BotCommands as BotCommands

data BasicGroupFullInfo
  = BasicGroupFullInfo -- ^ Contains full information about a basic group
    { photo                           :: Maybe ChatPhoto.ChatPhoto           -- ^ Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo
    , description                     :: Maybe T.Text                        -- ^ Group description. Updated only after the basic group is opened
    , creator_user_id                 :: Maybe Int                           -- ^ User identifier of the creator of the group; 0 if unknown
    , members                         :: Maybe [ChatMember.ChatMember]       -- ^ Group members
    , can_hide_members                :: Maybe Bool                          -- ^ True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators after upgrading the basic group to a supergroup
    , can_toggle_aggressive_anti_spam :: Maybe Bool                          -- ^ True, if aggressive anti-spam checks can be enabled or disabled in the supergroup after upgrading the basic group to a supergroup
    , invite_link                     :: Maybe ChatInviteLink.ChatInviteLink -- ^ Primary invite link for this group; may be null. For chat administrators with can_invite_users right only. Updated only after the basic group is opened
    , bot_commands                    :: Maybe [BotCommands.BotCommands]     -- ^ List of commands of bots in the group
    }
  deriving (Eq, Show)

instance I.ShortShow BasicGroupFullInfo where
  shortShow BasicGroupFullInfo
    { photo                           = photo_
    , description                     = description_
    , creator_user_id                 = creator_user_id_
    , members                         = members_
    , can_hide_members                = can_hide_members_
    , can_toggle_aggressive_anti_spam = can_toggle_aggressive_anti_spam_
    , invite_link                     = invite_link_
    , bot_commands                    = bot_commands_
    }
      = "BasicGroupFullInfo"
        ++ I.cc
        [ "photo"                           `I.p` photo_
        , "description"                     `I.p` description_
        , "creator_user_id"                 `I.p` creator_user_id_
        , "members"                         `I.p` members_
        , "can_hide_members"                `I.p` can_hide_members_
        , "can_toggle_aggressive_anti_spam" `I.p` can_toggle_aggressive_anti_spam_
        , "invite_link"                     `I.p` invite_link_
        , "bot_commands"                    `I.p` bot_commands_
        ]

instance AT.FromJSON BasicGroupFullInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "basicGroupFullInfo" -> parseBasicGroupFullInfo v
      _                    -> mempty
    
    where
      parseBasicGroupFullInfo :: A.Value -> AT.Parser BasicGroupFullInfo
      parseBasicGroupFullInfo = A.withObject "BasicGroupFullInfo" $ \o -> do
        photo_                           <- o A..:?  "photo"
        description_                     <- o A..:?  "description"
        creator_user_id_                 <- o A..:?  "creator_user_id"
        members_                         <- o A..:?  "members"
        can_hide_members_                <- o A..:?  "can_hide_members"
        can_toggle_aggressive_anti_spam_ <- o A..:?  "can_toggle_aggressive_anti_spam"
        invite_link_                     <- o A..:?  "invite_link"
        bot_commands_                    <- o A..:?  "bot_commands"
        pure $ BasicGroupFullInfo
          { photo                           = photo_
          , description                     = description_
          , creator_user_id                 = creator_user_id_
          , members                         = members_
          , can_hide_members                = can_hide_members_
          , can_toggle_aggressive_anti_spam = can_toggle_aggressive_anti_spam_
          , invite_link                     = invite_link_
          , bot_commands                    = bot_commands_
          }
  parseJSON _ = mempty

