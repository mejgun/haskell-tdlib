{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data ChatFilter = -- | Represents a filter of user chats
  ChatFilter
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
    -- | The chat identifiers of always excluded chats in the filtered chat list
    excluded_chat_ids :: Maybe [Int],
    -- | The chat identifiers of always included chats in the filtered chat list
    included_chat_ids :: Maybe [Int],
    -- | The chat identifiers of pinned chats in the filtered chat list
    pinned_chat_ids :: Maybe [Int],
    -- | The chosen icon name for short filter representation. If non-empty, must be one of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown", "Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work".
    -- If empty, use getChatFilterDefaultIconName to get default icon name for the filter
    icon_name :: Maybe String,
    -- | The title of the filter; 1-12 characters without line feeds
    title :: Maybe String
  }
  deriving (Eq)

instance Show ChatFilter where
  show
    ChatFilter
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
        icon_name = icon_name_,
        title = title_
      } =
      "ChatFilter"
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
            U.p "icon_name" icon_name_,
            U.p "title" title_
          ]

instance T.FromJSON ChatFilter where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatFilter" -> parseChatFilter v
      _ -> mempty
    where
      parseChatFilter :: A.Value -> T.Parser ChatFilter
      parseChatFilter = A.withObject "ChatFilter" $ \o -> do
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
        icon_name_ <- o A..:? "icon_name"
        title_ <- o A..:? "title"
        return $ ChatFilter {include_channels = include_channels_, include_groups = include_groups_, include_bots = include_bots_, include_non_contacts = include_non_contacts_, include_contacts = include_contacts_, exclude_archived = exclude_archived_, exclude_read = exclude_read_, exclude_muted = exclude_muted_, excluded_chat_ids = excluded_chat_ids_, included_chat_ids = included_chat_ids_, pinned_chat_ids = pinned_chat_ids_, icon_name = icon_name_, title = title_}
  parseJSON _ = mempty

instance T.ToJSON ChatFilter where
  toJSON
    ChatFilter
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
        icon_name = icon_name_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "chatFilter",
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
          "icon_name" A..= icon_name_,
          "title" A..= title_
        ]
