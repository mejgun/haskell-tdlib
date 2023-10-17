module TD.Data.ChatList
  (ChatList(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a list of chats
data ChatList
  = ChatListMain -- ^ A main list of chats
  | ChatListArchive -- ^ A list of chats usually located at the top of the main chat list. Unmuted chats are automatically moved from the Archive to the Main chat list when a new message arrives
  | ChatListFolder -- ^ A list of chats added to a chat folder
    { chat_folder_id :: Maybe Int -- ^ Chat folder identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ChatList where
  shortShow ChatListMain
      = "ChatListMain"
  shortShow ChatListArchive
      = "ChatListArchive"
  shortShow ChatListFolder
    { chat_folder_id = chat_folder_id_
    }
      = "ChatListFolder"
        ++ I.cc
        [ "chat_folder_id" `I.p` chat_folder_id_
        ]

instance AT.FromJSON ChatList where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatListMain"    -> pure ChatListMain
      "chatListArchive" -> pure ChatListArchive
      "chatListFolder"  -> parseChatListFolder v
      _                 -> mempty
    
    where
      parseChatListFolder :: A.Value -> AT.Parser ChatList
      parseChatListFolder = A.withObject "ChatListFolder" $ \o -> do
        chat_folder_id_ <- o A..:?  "chat_folder_id"
        pure $ ChatListFolder
          { chat_folder_id = chat_folder_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatList where
  toJSON ChatListMain
      = A.object
        [ "@type" A..= AT.String "chatListMain"
        ]
  toJSON ChatListArchive
      = A.object
        [ "@type" A..= AT.String "chatListArchive"
        ]
  toJSON ChatListFolder
    { chat_folder_id = chat_folder_id_
    }
      = A.object
        [ "@type"          A..= AT.String "chatListFolder"
        , "chat_folder_id" A..= chat_folder_id_
        ]

