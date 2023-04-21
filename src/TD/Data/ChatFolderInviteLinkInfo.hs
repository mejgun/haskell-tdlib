{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatFolderInviteLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolderInfo as ChatFolderInfo
import qualified Utils as U

-- |
data ChatFolderInviteLinkInfo = -- | Contains information about an invite link to a chat folder
  ChatFolderInviteLinkInfo
  { -- | Identifiers of the chats from the link, which are added to the folder already
    added_chat_ids :: Maybe [Int],
    -- | Identifiers of the chats from the link, which aren't added to the folder yet
    missing_chat_ids :: Maybe [Int],
    -- | Basic information about the chat folder; chat folder identifier will be 0 if the user didn't have the chat folder yet
    chat_folder_info :: Maybe ChatFolderInfo.ChatFolderInfo
  }
  deriving (Eq)

instance Show ChatFolderInviteLinkInfo where
  show
    ChatFolderInviteLinkInfo
      { added_chat_ids = added_chat_ids_,
        missing_chat_ids = missing_chat_ids_,
        chat_folder_info = chat_folder_info_
      } =
      "ChatFolderInviteLinkInfo"
        ++ U.cc
          [ U.p "added_chat_ids" added_chat_ids_,
            U.p "missing_chat_ids" missing_chat_ids_,
            U.p "chat_folder_info" chat_folder_info_
          ]

instance T.FromJSON ChatFolderInviteLinkInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatFolderInviteLinkInfo" -> parseChatFolderInviteLinkInfo v
      _ -> mempty
    where
      parseChatFolderInviteLinkInfo :: A.Value -> T.Parser ChatFolderInviteLinkInfo
      parseChatFolderInviteLinkInfo = A.withObject "ChatFolderInviteLinkInfo" $ \o -> do
        added_chat_ids_ <- o A..:? "added_chat_ids"
        missing_chat_ids_ <- o A..:? "missing_chat_ids"
        chat_folder_info_ <- o A..:? "chat_folder_info"
        return $ ChatFolderInviteLinkInfo {added_chat_ids = added_chat_ids_, missing_chat_ids = missing_chat_ids_, chat_folder_info = chat_folder_info_}
  parseJSON _ = mempty

instance T.ToJSON ChatFolderInviteLinkInfo where
  toJSON
    ChatFolderInviteLinkInfo
      { added_chat_ids = added_chat_ids_,
        missing_chat_ids = missing_chat_ids_,
        chat_folder_info = chat_folder_info_
      } =
      A.object
        [ "@type" A..= T.String "chatFolderInviteLinkInfo",
          "added_chat_ids" A..= added_chat_ids_,
          "missing_chat_ids" A..= missing_chat_ids_,
          "chat_folder_info" A..= chat_folder_info_
        ]
