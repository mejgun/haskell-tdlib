module TD.Data.ChatInviteLinkMembers
  (ChatInviteLinkMembers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatInviteLinkMember as ChatInviteLinkMember

data ChatInviteLinkMembers
  = ChatInviteLinkMembers -- ^ Contains a list of chat members joined a chat via an invite link
    { total_count :: Maybe Int                                         -- ^ Approximate total number of chat members found
    , members     :: Maybe [ChatInviteLinkMember.ChatInviteLinkMember] -- ^ List of chat members, joined a chat via an invite link
    }
  deriving (Eq, Show)

instance I.ShortShow ChatInviteLinkMembers where
  shortShow ChatInviteLinkMembers
    { total_count = total_count_
    , members     = members_
    }
      = "ChatInviteLinkMembers"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "members"     `I.p` members_
        ]

instance AT.FromJSON ChatInviteLinkMembers where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatInviteLinkMembers" -> parseChatInviteLinkMembers v
      _                       -> mempty
    
    where
      parseChatInviteLinkMembers :: A.Value -> AT.Parser ChatInviteLinkMembers
      parseChatInviteLinkMembers = A.withObject "ChatInviteLinkMembers" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        members_     <- o A..:?  "members"
        pure $ ChatInviteLinkMembers
          { total_count = total_count_
          , members     = members_
          }
  parseJSON _ = mempty

