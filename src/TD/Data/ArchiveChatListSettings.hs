module TD.Data.ArchiveChatListSettings
  ( ArchiveChatListSettings(..)    
  , defaultArchiveChatListSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ArchiveChatListSettings
  = ArchiveChatListSettings -- ^ Contains settings for automatic moving of chats to and from the Archive chat lists
    { archive_and_mute_new_chats_from_unknown_users :: Maybe Bool -- ^ True, if new chats from non-contacts will be automatically archived and muted. Can be set to true only if the option "can_archive_and_mute_new_chats_from_unknown_users" is true
    , keep_unmuted_chats_archived                   :: Maybe Bool -- ^ True, if unmuted chats will be kept in the Archive chat list when they get a new message
    , keep_chats_from_folders_archived              :: Maybe Bool -- ^ True, if unmuted chats, that are always included or pinned in a folder, will be kept in the Archive chat list when they get a new message. Ignored if keep_unmuted_chats_archived == true
    }
  deriving (Eq, Show)

instance I.ShortShow ArchiveChatListSettings where
  shortShow ArchiveChatListSettings
    { archive_and_mute_new_chats_from_unknown_users = archive_and_mute_new_chats_from_unknown_users_
    , keep_unmuted_chats_archived                   = keep_unmuted_chats_archived_
    , keep_chats_from_folders_archived              = keep_chats_from_folders_archived_
    }
      = "ArchiveChatListSettings"
        ++ I.cc
        [ "archive_and_mute_new_chats_from_unknown_users" `I.p` archive_and_mute_new_chats_from_unknown_users_
        , "keep_unmuted_chats_archived"                   `I.p` keep_unmuted_chats_archived_
        , "keep_chats_from_folders_archived"              `I.p` keep_chats_from_folders_archived_
        ]

instance AT.FromJSON ArchiveChatListSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "archiveChatListSettings" -> parseArchiveChatListSettings v
      _                         -> mempty
    
    where
      parseArchiveChatListSettings :: A.Value -> AT.Parser ArchiveChatListSettings
      parseArchiveChatListSettings = A.withObject "ArchiveChatListSettings" $ \o -> do
        archive_and_mute_new_chats_from_unknown_users_ <- o A..:?  "archive_and_mute_new_chats_from_unknown_users"
        keep_unmuted_chats_archived_                   <- o A..:?  "keep_unmuted_chats_archived"
        keep_chats_from_folders_archived_              <- o A..:?  "keep_chats_from_folders_archived"
        pure $ ArchiveChatListSettings
          { archive_and_mute_new_chats_from_unknown_users = archive_and_mute_new_chats_from_unknown_users_
          , keep_unmuted_chats_archived                   = keep_unmuted_chats_archived_
          , keep_chats_from_folders_archived              = keep_chats_from_folders_archived_
          }
  parseJSON _ = mempty

instance AT.ToJSON ArchiveChatListSettings where
  toJSON ArchiveChatListSettings
    { archive_and_mute_new_chats_from_unknown_users = archive_and_mute_new_chats_from_unknown_users_
    , keep_unmuted_chats_archived                   = keep_unmuted_chats_archived_
    , keep_chats_from_folders_archived              = keep_chats_from_folders_archived_
    }
      = A.object
        [ "@type"                                         A..= AT.String "archiveChatListSettings"
        , "archive_and_mute_new_chats_from_unknown_users" A..= archive_and_mute_new_chats_from_unknown_users_
        , "keep_unmuted_chats_archived"                   A..= keep_unmuted_chats_archived_
        , "keep_chats_from_folders_archived"              A..= keep_chats_from_folders_archived_
        ]

defaultArchiveChatListSettings :: ArchiveChatListSettings
defaultArchiveChatListSettings =
  ArchiveChatListSettings
    { archive_and_mute_new_chats_from_unknown_users = Nothing
    , keep_unmuted_chats_archived                   = Nothing
    , keep_chats_from_folders_archived              = Nothing
    }

