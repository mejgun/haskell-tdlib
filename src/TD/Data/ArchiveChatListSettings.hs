{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ArchiveChatListSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ArchiveChatListSettings = -- | Contains settings for automatic moving of chats to and from the Archive chat lists
  ArchiveChatListSettings
  { -- | True, if unmuted chats, that are always included or pinned in a folder, will be kept in the Archive chat list when they get a new message. Ignored if keep_unmuted_chats_archived == true
    keep_chats_from_folders_archived :: Maybe Bool,
    -- | True, if unmuted chats will be kept in the Archive chat list when they get a new message
    keep_unmuted_chats_archived :: Maybe Bool,
    -- | True, if new chats from non-contacts will be automatically archived and muted. Can be set to true only if the option "can_archive_and_mute_new_chats_from_unknown_users" is true
    archive_and_mute_new_chats_from_unknown_users :: Maybe Bool
  }
  deriving (Eq)

instance Show ArchiveChatListSettings where
  show
    ArchiveChatListSettings
      { keep_chats_from_folders_archived = keep_chats_from_folders_archived_,
        keep_unmuted_chats_archived = keep_unmuted_chats_archived_,
        archive_and_mute_new_chats_from_unknown_users = archive_and_mute_new_chats_from_unknown_users_
      } =
      "ArchiveChatListSettings"
        ++ U.cc
          [ U.p "keep_chats_from_folders_archived" keep_chats_from_folders_archived_,
            U.p "keep_unmuted_chats_archived" keep_unmuted_chats_archived_,
            U.p "archive_and_mute_new_chats_from_unknown_users" archive_and_mute_new_chats_from_unknown_users_
          ]

instance T.FromJSON ArchiveChatListSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "archiveChatListSettings" -> parseArchiveChatListSettings v
      _ -> mempty
    where
      parseArchiveChatListSettings :: A.Value -> T.Parser ArchiveChatListSettings
      parseArchiveChatListSettings = A.withObject "ArchiveChatListSettings" $ \o -> do
        keep_chats_from_folders_archived_ <- o A..:? "keep_chats_from_folders_archived"
        keep_unmuted_chats_archived_ <- o A..:? "keep_unmuted_chats_archived"
        archive_and_mute_new_chats_from_unknown_users_ <- o A..:? "archive_and_mute_new_chats_from_unknown_users"
        return $ ArchiveChatListSettings {keep_chats_from_folders_archived = keep_chats_from_folders_archived_, keep_unmuted_chats_archived = keep_unmuted_chats_archived_, archive_and_mute_new_chats_from_unknown_users = archive_and_mute_new_chats_from_unknown_users_}
  parseJSON _ = mempty

instance T.ToJSON ArchiveChatListSettings where
  toJSON
    ArchiveChatListSettings
      { keep_chats_from_folders_archived = keep_chats_from_folders_archived_,
        keep_unmuted_chats_archived = keep_unmuted_chats_archived_,
        archive_and_mute_new_chats_from_unknown_users = archive_and_mute_new_chats_from_unknown_users_
      } =
      A.object
        [ "@type" A..= T.String "archiveChatListSettings",
          "keep_chats_from_folders_archived" A..= keep_chats_from_folders_archived_,
          "keep_unmuted_chats_archived" A..= keep_unmuted_chats_archived_,
          "archive_and_mute_new_chats_from_unknown_users" A..= archive_and_mute_new_chats_from_unknown_users_
        ]
