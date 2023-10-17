module TD.Data.ChatInviteLinkCounts
  (ChatInviteLinkCounts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatInviteLinkCount as ChatInviteLinkCount

data ChatInviteLinkCounts
  = ChatInviteLinkCounts -- ^ Contains a list of chat invite link counts
    { invite_link_counts :: Maybe [ChatInviteLinkCount.ChatInviteLinkCount] -- ^ List of invite link counts
    }
  deriving (Eq, Show)

instance I.ShortShow ChatInviteLinkCounts where
  shortShow ChatInviteLinkCounts
    { invite_link_counts = invite_link_counts_
    }
      = "ChatInviteLinkCounts"
        ++ I.cc
        [ "invite_link_counts" `I.p` invite_link_counts_
        ]

instance AT.FromJSON ChatInviteLinkCounts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatInviteLinkCounts" -> parseChatInviteLinkCounts v
      _                      -> mempty
    
    where
      parseChatInviteLinkCounts :: A.Value -> AT.Parser ChatInviteLinkCounts
      parseChatInviteLinkCounts = A.withObject "ChatInviteLinkCounts" $ \o -> do
        invite_link_counts_ <- o A..:?  "invite_link_counts"
        pure $ ChatInviteLinkCounts
          { invite_link_counts = invite_link_counts_
          }
  parseJSON _ = mempty

