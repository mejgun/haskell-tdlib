module TD.Data.ChatFolder
  ( ChatFolder(..)    
  , defaultChatFolder 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatFolderIcon as ChatFolderIcon

data ChatFolder
  = ChatFolder -- ^ Represents a folder for user chats
    { title                :: Maybe T.Text                        -- ^ The title of the folder; 1-12 characters without line feeds
    , icon                 :: Maybe ChatFolderIcon.ChatFolderIcon -- ^ The chosen icon for the chat folder; may be null. If null, use getChatFolderDefaultIconName to get default icon name for the folder
    , color_id             :: Maybe Int                           -- ^ The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled. Can't be changed if folder tags are disabled or the current user doesn't have Telegram Premium subscription
    , is_shareable         :: Maybe Bool                          -- ^ True, if at least one link has been created for the folder
    , pinned_chat_ids      :: Maybe [Int]                         -- ^ The chat identifiers of pinned chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
    , included_chat_ids    :: Maybe [Int]                         -- ^ The chat identifiers of always included chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
    , excluded_chat_ids    :: Maybe [Int]                         -- ^ The chat identifiers of always excluded chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") always excluded non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
    , exclude_muted        :: Maybe Bool                          -- ^ True, if muted chats need to be excluded
    , exclude_read         :: Maybe Bool                          -- ^ True, if read chats need to be excluded
    , exclude_archived     :: Maybe Bool                          -- ^ True, if archived chats need to be excluded
    , include_contacts     :: Maybe Bool                          -- ^ True, if contacts need to be included
    , include_non_contacts :: Maybe Bool                          -- ^ True, if non-contact users need to be included
    , include_bots         :: Maybe Bool                          -- ^ True, if bots need to be included
    , include_groups       :: Maybe Bool                          -- ^ True, if basic groups and supergroups need to be included
    , include_channels     :: Maybe Bool                          -- ^ True, if channels need to be included
    }
  deriving (Eq, Show)

instance I.ShortShow ChatFolder where
  shortShow ChatFolder
    { title                = title_
    , icon                 = icon_
    , color_id             = color_id_
    , is_shareable         = is_shareable_
    , pinned_chat_ids      = pinned_chat_ids_
    , included_chat_ids    = included_chat_ids_
    , excluded_chat_ids    = excluded_chat_ids_
    , exclude_muted        = exclude_muted_
    , exclude_read         = exclude_read_
    , exclude_archived     = exclude_archived_
    , include_contacts     = include_contacts_
    , include_non_contacts = include_non_contacts_
    , include_bots         = include_bots_
    , include_groups       = include_groups_
    , include_channels     = include_channels_
    }
      = "ChatFolder"
        ++ I.cc
        [ "title"                `I.p` title_
        , "icon"                 `I.p` icon_
        , "color_id"             `I.p` color_id_
        , "is_shareable"         `I.p` is_shareable_
        , "pinned_chat_ids"      `I.p` pinned_chat_ids_
        , "included_chat_ids"    `I.p` included_chat_ids_
        , "excluded_chat_ids"    `I.p` excluded_chat_ids_
        , "exclude_muted"        `I.p` exclude_muted_
        , "exclude_read"         `I.p` exclude_read_
        , "exclude_archived"     `I.p` exclude_archived_
        , "include_contacts"     `I.p` include_contacts_
        , "include_non_contacts" `I.p` include_non_contacts_
        , "include_bots"         `I.p` include_bots_
        , "include_groups"       `I.p` include_groups_
        , "include_channels"     `I.p` include_channels_
        ]

instance AT.FromJSON ChatFolder where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatFolder" -> parseChatFolder v
      _            -> mempty
    
    where
      parseChatFolder :: A.Value -> AT.Parser ChatFolder
      parseChatFolder = A.withObject "ChatFolder" $ \o -> do
        title_                <- o A..:?  "title"
        icon_                 <- o A..:?  "icon"
        color_id_             <- o A..:?  "color_id"
        is_shareable_         <- o A..:?  "is_shareable"
        pinned_chat_ids_      <- o A..:?  "pinned_chat_ids"
        included_chat_ids_    <- o A..:?  "included_chat_ids"
        excluded_chat_ids_    <- o A..:?  "excluded_chat_ids"
        exclude_muted_        <- o A..:?  "exclude_muted"
        exclude_read_         <- o A..:?  "exclude_read"
        exclude_archived_     <- o A..:?  "exclude_archived"
        include_contacts_     <- o A..:?  "include_contacts"
        include_non_contacts_ <- o A..:?  "include_non_contacts"
        include_bots_         <- o A..:?  "include_bots"
        include_groups_       <- o A..:?  "include_groups"
        include_channels_     <- o A..:?  "include_channels"
        pure $ ChatFolder
          { title                = title_
          , icon                 = icon_
          , color_id             = color_id_
          , is_shareable         = is_shareable_
          , pinned_chat_ids      = pinned_chat_ids_
          , included_chat_ids    = included_chat_ids_
          , excluded_chat_ids    = excluded_chat_ids_
          , exclude_muted        = exclude_muted_
          , exclude_read         = exclude_read_
          , exclude_archived     = exclude_archived_
          , include_contacts     = include_contacts_
          , include_non_contacts = include_non_contacts_
          , include_bots         = include_bots_
          , include_groups       = include_groups_
          , include_channels     = include_channels_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatFolder where
  toJSON ChatFolder
    { title                = title_
    , icon                 = icon_
    , color_id             = color_id_
    , is_shareable         = is_shareable_
    , pinned_chat_ids      = pinned_chat_ids_
    , included_chat_ids    = included_chat_ids_
    , excluded_chat_ids    = excluded_chat_ids_
    , exclude_muted        = exclude_muted_
    , exclude_read         = exclude_read_
    , exclude_archived     = exclude_archived_
    , include_contacts     = include_contacts_
    , include_non_contacts = include_non_contacts_
    , include_bots         = include_bots_
    , include_groups       = include_groups_
    , include_channels     = include_channels_
    }
      = A.object
        [ "@type"                A..= AT.String "chatFolder"
        , "title"                A..= title_
        , "icon"                 A..= icon_
        , "color_id"             A..= color_id_
        , "is_shareable"         A..= is_shareable_
        , "pinned_chat_ids"      A..= pinned_chat_ids_
        , "included_chat_ids"    A..= included_chat_ids_
        , "excluded_chat_ids"    A..= excluded_chat_ids_
        , "exclude_muted"        A..= exclude_muted_
        , "exclude_read"         A..= exclude_read_
        , "exclude_archived"     A..= exclude_archived_
        , "include_contacts"     A..= include_contacts_
        , "include_non_contacts" A..= include_non_contacts_
        , "include_bots"         A..= include_bots_
        , "include_groups"       A..= include_groups_
        , "include_channels"     A..= include_channels_
        ]

defaultChatFolder :: ChatFolder
defaultChatFolder =
  ChatFolder
    { title                = Nothing
    , icon                 = Nothing
    , color_id             = Nothing
    , is_shareable         = Nothing
    , pinned_chat_ids      = Nothing
    , included_chat_ids    = Nothing
    , excluded_chat_ids    = Nothing
    , exclude_muted        = Nothing
    , exclude_read         = Nothing
    , exclude_archived     = Nothing
    , include_contacts     = Nothing
    , include_non_contacts = Nothing
    , include_bots         = Nothing
    , include_groups       = Nothing
    , include_channels     = Nothing
    }

