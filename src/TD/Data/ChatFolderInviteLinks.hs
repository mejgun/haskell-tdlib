module TD.Data.ChatFolderInviteLinks
  (ChatFolderInviteLinks(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolderInviteLink as ChatFolderInviteLink

data ChatFolderInviteLinks
  = ChatFolderInviteLinks -- ^ Represents a list of chat folder invite links
    { invite_links :: Maybe [ChatFolderInviteLink.ChatFolderInviteLink] -- ^ List of the invite links
    }
  deriving (Eq, Show)

instance I.ShortShow ChatFolderInviteLinks where
  shortShow ChatFolderInviteLinks
    { invite_links = invite_links_
    }
      = "ChatFolderInviteLinks"
        ++ I.cc
        [ "invite_links" `I.p` invite_links_
        ]

instance AT.FromJSON ChatFolderInviteLinks where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatFolderInviteLinks" -> parseChatFolderInviteLinks v
      _                       -> mempty
    
    where
      parseChatFolderInviteLinks :: A.Value -> AT.Parser ChatFolderInviteLinks
      parseChatFolderInviteLinks = A.withObject "ChatFolderInviteLinks" $ \o -> do
        invite_links_ <- o A..:?  "invite_links"
        pure $ ChatFolderInviteLinks
          { invite_links = invite_links_
          }
  parseJSON _ = mempty

