module TD.Data.ChatFolderInviteLinkInfo
  (ChatFolderInviteLinkInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolderInfo as ChatFolderInfo

data ChatFolderInviteLinkInfo
  = ChatFolderInviteLinkInfo -- ^ Contains information about an invite link to a chat folder
    { chat_folder_info :: Maybe ChatFolderInfo.ChatFolderInfo -- ^ Basic information about the chat folder; chat folder identifier will be 0 if the user didn't have the chat folder yet
    , missing_chat_ids :: Maybe [Int]                         -- ^ Identifiers of the chats from the link, which aren't added to the folder yet
    , added_chat_ids   :: Maybe [Int]                         -- ^ Identifiers of the chats from the link, which are added to the folder already
    }
  deriving (Eq, Show)

instance I.ShortShow ChatFolderInviteLinkInfo where
  shortShow ChatFolderInviteLinkInfo
    { chat_folder_info = chat_folder_info_
    , missing_chat_ids = missing_chat_ids_
    , added_chat_ids   = added_chat_ids_
    }
      = "ChatFolderInviteLinkInfo"
        ++ I.cc
        [ "chat_folder_info" `I.p` chat_folder_info_
        , "missing_chat_ids" `I.p` missing_chat_ids_
        , "added_chat_ids"   `I.p` added_chat_ids_
        ]

instance AT.FromJSON ChatFolderInviteLinkInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatFolderInviteLinkInfo" -> parseChatFolderInviteLinkInfo v
      _                          -> mempty
    
    where
      parseChatFolderInviteLinkInfo :: A.Value -> AT.Parser ChatFolderInviteLinkInfo
      parseChatFolderInviteLinkInfo = A.withObject "ChatFolderInviteLinkInfo" $ \o -> do
        chat_folder_info_ <- o A..:?  "chat_folder_info"
        missing_chat_ids_ <- o A..:?  "missing_chat_ids"
        added_chat_ids_   <- o A..:?  "added_chat_ids"
        pure $ ChatFolderInviteLinkInfo
          { chat_folder_info = chat_folder_info_
          , missing_chat_ids = missing_chat_ids_
          , added_chat_ids   = added_chat_ids_
          }
  parseJSON _ = mempty

