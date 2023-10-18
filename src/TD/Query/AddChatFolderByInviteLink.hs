module TD.Query.AddChatFolderByInviteLink
  (AddChatFolderByInviteLink(..)
  , defaultAddChatFolderByInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Adds a chat folder by an invite link. Returns 'TD.Data.Ok.Ok'
data AddChatFolderByInviteLink
  = AddChatFolderByInviteLink
    { invite_link :: Maybe T.Text -- ^ Invite link for the chat folder
    , chat_ids    :: Maybe [Int]  -- ^ Identifiers of the chats added to the chat folder. The chats are automatically joined if they aren't joined yet
    }
  deriving (Eq, Show)

instance I.ShortShow AddChatFolderByInviteLink where
  shortShow
    AddChatFolderByInviteLink
      { invite_link = invite_link_
      , chat_ids    = chat_ids_
      }
        = "AddChatFolderByInviteLink"
          ++ I.cc
          [ "invite_link" `I.p` invite_link_
          , "chat_ids"    `I.p` chat_ids_
          ]

instance AT.ToJSON AddChatFolderByInviteLink where
  toJSON
    AddChatFolderByInviteLink
      { invite_link = invite_link_
      , chat_ids    = chat_ids_
      }
        = A.object
          [ "@type"       A..= AT.String "addChatFolderByInviteLink"
          , "invite_link" A..= invite_link_
          , "chat_ids"    A..= chat_ids_
          ]

defaultAddChatFolderByInviteLink :: AddChatFolderByInviteLink
defaultAddChatFolderByInviteLink =
  AddChatFolderByInviteLink
    { invite_link = Nothing
    , chat_ids    = Nothing
    }

