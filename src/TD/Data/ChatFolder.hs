{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatFolder where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolderIcon as ChatFolderIcon
import qualified Utils as U

-- |
data ChatFolder = -- | Represents a folder for user chats
  ChatFolder
  { -- | True, if channels need to be included
    include_channels :: Maybe Bool,
    -- | True, if basic groups and supergroups need to be included
    include_groups :: Maybe Bool,
    -- | True, if bots need to be included
    include_bots :: Maybe Bool,
    -- | True, if non-contact users need to be included
    include_non_contacts :: Maybe Bool,
    -- | True, if contacts need to be included
    include_contacts :: Maybe Bool,
    -- | True, if archived chats need to be excluded
    exclude_archived :: Maybe Bool,
    -- | True, if read chats need to be excluded
    exclude_read :: Maybe Bool,
    -- | True, if muted chats need to be excluded
    exclude_muted :: Maybe Bool,
    -- | The chat identifiers of always excluded chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") always excluded non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
    excluded_chat_ids :: Maybe [Int],
    -- | The chat identifiers of always included chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
    included_chat_ids :: Maybe [Int],
    -- | The chat identifiers of pinned chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
    pinned_chat_ids :: Maybe [Int],
    -- | True, if at least one link has been created for the folder
    is_shareable :: Maybe Bool,
    -- | The chosen icon for the chat folder; may be null. If null, use getChatFolderDefaultIconName to get default icon name for the folder
    icon :: Maybe ChatFolderIcon.ChatFolderIcon,
    -- | The title of the folder; 1-12 characters without line feeds
    title :: Maybe String
  }
  deriving (Eq)

instance Show ChatFolder where
  show
    ChatFolder
      { include_channels = include_channels_,
        include_groups = include_groups_,
        include_bots = include_bots_,
        include_non_contacts = include_non_contacts_,
        include_contacts = include_contacts_,
        exclude_archived = exclude_archived_,
        exclude_read = exclude_read_,
        exclude_muted = exclude_muted_,
        excluded_chat_ids = excluded_chat_ids_,
        included_chat_ids = included_chat_ids_,
        pinned_chat_ids = pinned_chat_ids_,
        is_shareable = is_shareable_,
        icon = icon_,
        title = title_
      } =
      "ChatFolder"
        ++ U.cc
          [ U.p "include_channels" include_channels_,
            U.p "include_groups" include_groups_,
            U.p "include_bots" include_bots_,
            U.p "include_non_contacts" include_non_contacts_,
            U.p "include_contacts" include_contacts_,
            U.p "exclude_archived" exclude_archived_,
            U.p "exclude_read" exclude_read_,
            U.p "exclude_muted" exclude_muted_,
            U.p "excluded_chat_ids" excluded_chat_ids_,
            U.p "included_chat_ids" included_chat_ids_,
            U.p "pinned_chat_ids" pinned_chat_ids_,
            U.p "is_shareable" is_shareable_,
            U.p "icon" icon_,
            U.p "title" title_
          ]

instance T.FromJSON ChatFolder where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatFolder" -> parseChatFolder v
      _ -> mempty
    where
      parseChatFolder :: A.Value -> T.Parser ChatFolder
      parseChatFolder = A.withObject "ChatFolder" $ \o -> do
        include_channels_ <- o A..:? "include_channels"
        include_groups_ <- o A..:? "include_groups"
        include_bots_ <- o A..:? "include_bots"
        include_non_contacts_ <- o A..:? "include_non_contacts"
        include_contacts_ <- o A..:? "include_contacts"
        exclude_archived_ <- o A..:? "exclude_archived"
        exclude_read_ <- o A..:? "exclude_read"
        exclude_muted_ <- o A..:? "exclude_muted"
        excluded_chat_ids_ <- o A..:? "excluded_chat_ids"
        included_chat_ids_ <- o A..:? "included_chat_ids"
        pinned_chat_ids_ <- o A..:? "pinned_chat_ids"
        is_shareable_ <- o A..:? "is_shareable"
        icon_ <- o A..:? "icon"
        title_ <- o A..:? "title"
        return $ ChatFolder {include_channels = include_channels_, include_groups = include_groups_, include_bots = include_bots_, include_non_contacts = include_non_contacts_, include_contacts = include_contacts_, exclude_archived = exclude_archived_, exclude_read = exclude_read_, exclude_muted = exclude_muted_, excluded_chat_ids = excluded_chat_ids_, included_chat_ids = included_chat_ids_, pinned_chat_ids = pinned_chat_ids_, is_shareable = is_shareable_, icon = icon_, title = title_}
  parseJSON _ = mempty

instance T.ToJSON ChatFolder where
  toJSON
    ChatFolder
      { include_channels = include_channels_,
        include_groups = include_groups_,
        include_bots = include_bots_,
        include_non_contacts = include_non_contacts_,
        include_contacts = include_contacts_,
        exclude_archived = exclude_archived_,
        exclude_read = exclude_read_,
        exclude_muted = exclude_muted_,
        excluded_chat_ids = excluded_chat_ids_,
        included_chat_ids = included_chat_ids_,
        pinned_chat_ids = pinned_chat_ids_,
        is_shareable = is_shareable_,
        icon = icon_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "chatFolder",
          "include_channels" A..= include_channels_,
          "include_groups" A..= include_groups_,
          "include_bots" A..= include_bots_,
          "include_non_contacts" A..= include_non_contacts_,
          "include_contacts" A..= include_contacts_,
          "exclude_archived" A..= exclude_archived_,
          "exclude_read" A..= exclude_read_,
          "exclude_muted" A..= exclude_muted_,
          "excluded_chat_ids" A..= excluded_chat_ids_,
          "included_chat_ids" A..= included_chat_ids_,
          "pinned_chat_ids" A..= pinned_chat_ids_,
          "is_shareable" A..= is_shareable_,
          "icon" A..= icon_,
          "title" A..= title_
        ]
