module TD.Data.ChatFolderInviteLink
  (ChatFolderInviteLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ChatFolderInviteLink
  = ChatFolderInviteLink -- ^ Contains a chat folder invite link
    { invite_link :: Maybe T.Text -- ^ The chat folder invite link
    , name        :: Maybe T.Text -- ^ Name of the link
    , chat_ids    :: Maybe [Int]  -- ^ Identifiers of chats, included in the link
    }
  deriving (Eq, Show)

instance I.ShortShow ChatFolderInviteLink where
  shortShow ChatFolderInviteLink
    { invite_link = invite_link_
    , name        = name_
    , chat_ids    = chat_ids_
    }
      = "ChatFolderInviteLink"
        ++ I.cc
        [ "invite_link" `I.p` invite_link_
        , "name"        `I.p` name_
        , "chat_ids"    `I.p` chat_ids_
        ]

instance AT.FromJSON ChatFolderInviteLink where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatFolderInviteLink" -> parseChatFolderInviteLink v
      _                      -> mempty
    
    where
      parseChatFolderInviteLink :: A.Value -> AT.Parser ChatFolderInviteLink
      parseChatFolderInviteLink = A.withObject "ChatFolderInviteLink" $ \o -> do
        invite_link_ <- o A..:?  "invite_link"
        name_        <- o A..:?  "name"
        chat_ids_    <- o A..:?  "chat_ids"
        pure $ ChatFolderInviteLink
          { invite_link = invite_link_
          , name        = name_
          , chat_ids    = chat_ids_
          }
  parseJSON _ = mempty

