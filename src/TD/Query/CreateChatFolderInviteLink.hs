module TD.Query.CreateChatFolderInviteLink
  (CreateChatFolderInviteLink(..)
  , defaultCreateChatFolderInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a new invite link for a chat folder. A link can be created for a chat folder if it has only pinned and included chats. Returns 'TD.Data.ChatFolderInviteLink.ChatFolderInviteLink'
data CreateChatFolderInviteLink
  = CreateChatFolderInviteLink
    { chat_folder_id :: Maybe Int    -- ^ Chat folder identifier
    , name           :: Maybe T.Text -- ^ Name of the link; 0-32 characters
    , chat_ids       :: Maybe [Int]  -- ^ Identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link creation
    }
  deriving (Eq, Show)

instance I.ShortShow CreateChatFolderInviteLink where
  shortShow
    CreateChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      , name           = name_
      , chat_ids       = chat_ids_
      }
        = "CreateChatFolderInviteLink"
          ++ I.cc
          [ "chat_folder_id" `I.p` chat_folder_id_
          , "name"           `I.p` name_
          , "chat_ids"       `I.p` chat_ids_
          ]

instance AT.ToJSON CreateChatFolderInviteLink where
  toJSON
    CreateChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      , name           = name_
      , chat_ids       = chat_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "createChatFolderInviteLink"
          , "chat_folder_id" A..= chat_folder_id_
          , "name"           A..= name_
          , "chat_ids"       A..= chat_ids_
          ]

defaultCreateChatFolderInviteLink :: CreateChatFolderInviteLink
defaultCreateChatFolderInviteLink =
  CreateChatFolderInviteLink
    { chat_folder_id = Nothing
    , name           = Nothing
    , chat_ids       = Nothing
    }

