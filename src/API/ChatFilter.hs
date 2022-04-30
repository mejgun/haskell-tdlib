-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Represents a filter of user chats
-- 
-- __title__ The title of the filter; 1-12 characters without line feeds
-- 
-- __icon_name__ The chosen icon name for short filter representation. If non-empty, must be one of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown", "Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work".
-- 
-- -If empty, use getChatFilterDefaultIconName to get default icon name for the filter
-- 
-- __pinned_chat_ids__ The chat identifiers of pinned chats in the filtered chat list
-- 
-- __included_chat_ids__ The chat identifiers of always included chats in the filtered chat list
-- 
-- __excluded_chat_ids__ The chat identifiers of always excluded chats in the filtered chat list
-- 
-- __exclude_muted__ True, if muted chats need to be excluded
-- 
-- __exclude_read__ True, if read chats need to be excluded
-- 
-- __exclude_archived__ True, if archived chats need to be excluded
-- 
-- __include_contacts__ True, if contacts need to be included
-- 
-- __include_non_contacts__ True, if non-contact users need to be included
-- 
-- __include_bots__ True, if bots need to be included
-- 
-- __include_groups__ True, if basic groups and supergroups need to be included
-- 
-- __include_channels__ True, if channels need to be included
data ChatFilter = 

 ChatFilter { include_channels :: Maybe Bool, include_groups :: Maybe Bool, include_bots :: Maybe Bool, include_non_contacts :: Maybe Bool, include_contacts :: Maybe Bool, exclude_archived :: Maybe Bool, exclude_read :: Maybe Bool, exclude_muted :: Maybe Bool, excluded_chat_ids :: Maybe [Int], included_chat_ids :: Maybe [Int], pinned_chat_ids :: Maybe [Int], icon_name :: Maybe String, title :: Maybe String }  deriving (Eq)

instance Show ChatFilter where
 show ChatFilter { include_channels=include_channels, include_groups=include_groups, include_bots=include_bots, include_non_contacts=include_non_contacts, include_contacts=include_contacts, exclude_archived=exclude_archived, exclude_read=exclude_read, exclude_muted=exclude_muted, excluded_chat_ids=excluded_chat_ids, included_chat_ids=included_chat_ids, pinned_chat_ids=pinned_chat_ids, icon_name=icon_name, title=title } =
  "ChatFilter" ++ U.cc [U.p "include_channels" include_channels, U.p "include_groups" include_groups, U.p "include_bots" include_bots, U.p "include_non_contacts" include_non_contacts, U.p "include_contacts" include_contacts, U.p "exclude_archived" exclude_archived, U.p "exclude_read" exclude_read, U.p "exclude_muted" exclude_muted, U.p "excluded_chat_ids" excluded_chat_ids, U.p "included_chat_ids" included_chat_ids, U.p "pinned_chat_ids" pinned_chat_ids, U.p "icon_name" icon_name, U.p "title" title ]

instance T.ToJSON ChatFilter where
 toJSON ChatFilter { include_channels = include_channels, include_groups = include_groups, include_bots = include_bots, include_non_contacts = include_non_contacts, include_contacts = include_contacts, exclude_archived = exclude_archived, exclude_read = exclude_read, exclude_muted = exclude_muted, excluded_chat_ids = excluded_chat_ids, included_chat_ids = included_chat_ids, pinned_chat_ids = pinned_chat_ids, icon_name = icon_name, title = title } =
  A.object [ "@type" A..= T.String "chatFilter", "include_channels" A..= include_channels, "include_groups" A..= include_groups, "include_bots" A..= include_bots, "include_non_contacts" A..= include_non_contacts, "include_contacts" A..= include_contacts, "exclude_archived" A..= exclude_archived, "exclude_read" A..= exclude_read, "exclude_muted" A..= exclude_muted, "excluded_chat_ids" A..= excluded_chat_ids, "included_chat_ids" A..= included_chat_ids, "pinned_chat_ids" A..= pinned_chat_ids, "icon_name" A..= icon_name, "title" A..= title ]

instance T.FromJSON ChatFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatFilter" -> parseChatFilter v
   _ -> mempty
  where
   parseChatFilter :: A.Value -> T.Parser ChatFilter
   parseChatFilter = A.withObject "ChatFilter" $ \o -> do
    include_channels <- o A..:? "include_channels"
    include_groups <- o A..:? "include_groups"
    include_bots <- o A..:? "include_bots"
    include_non_contacts <- o A..:? "include_non_contacts"
    include_contacts <- o A..:? "include_contacts"
    exclude_archived <- o A..:? "exclude_archived"
    exclude_read <- o A..:? "exclude_read"
    exclude_muted <- o A..:? "exclude_muted"
    excluded_chat_ids <- o A..:? "excluded_chat_ids"
    included_chat_ids <- o A..:? "included_chat_ids"
    pinned_chat_ids <- o A..:? "pinned_chat_ids"
    icon_name <- o A..:? "icon_name"
    title <- o A..:? "title"
    return $ ChatFilter { include_channels = include_channels, include_groups = include_groups, include_bots = include_bots, include_non_contacts = include_non_contacts, include_contacts = include_contacts, exclude_archived = exclude_archived, exclude_read = exclude_read, exclude_muted = exclude_muted, excluded_chat_ids = excluded_chat_ids, included_chat_ids = included_chat_ids, pinned_chat_ids = pinned_chat_ids, icon_name = icon_name, title = title }
 parseJSON _ = mempty
