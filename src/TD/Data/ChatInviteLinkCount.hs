module TD.Data.ChatInviteLinkCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ChatInviteLinkCount
  = ChatInviteLinkCount -- ^ Describes a chat administrator with a number of active and revoked chat invite links
    { user_id                   :: Maybe Int -- ^ Administrator's user identifier
    , invite_link_count         :: Maybe Int -- ^ Number of active invite links
    , revoked_invite_link_count :: Maybe Int -- ^ Number of revoked invite links
    }
  deriving (Eq)

instance Show ChatInviteLinkCount where
  show ChatInviteLinkCount
    { user_id                   = user_id_
    , invite_link_count         = invite_link_count_
    , revoked_invite_link_count = revoked_invite_link_count_
    }
      = "ChatInviteLinkCount"
        ++ I.cc
        [ "user_id"                   `I.p` user_id_
        , "invite_link_count"         `I.p` invite_link_count_
        , "revoked_invite_link_count" `I.p` revoked_invite_link_count_
        ]

instance AT.FromJSON ChatInviteLinkCount where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatInviteLinkCount" -> parseChatInviteLinkCount v
      _                     -> mempty
    
    where
      parseChatInviteLinkCount :: A.Value -> AT.Parser ChatInviteLinkCount
      parseChatInviteLinkCount = A.withObject "ChatInviteLinkCount" $ \o -> do
        user_id_                   <- o A..:?  "user_id"
        invite_link_count_         <- o A..:?  "invite_link_count"
        revoked_invite_link_count_ <- o A..:?  "revoked_invite_link_count"
        pure $ ChatInviteLinkCount
          { user_id                   = user_id_
          , invite_link_count         = invite_link_count_
          , revoked_invite_link_count = revoked_invite_link_count_
          }

instance AT.ToJSON ChatInviteLinkCount where
  toJSON ChatInviteLinkCount
    { user_id                   = user_id_
    , invite_link_count         = invite_link_count_
    , revoked_invite_link_count = revoked_invite_link_count_
    }
      = A.object
        [ "@type"                     A..= AT.String "chatInviteLinkCount"
        , "user_id"                   A..= user_id_
        , "invite_link_count"         A..= invite_link_count_
        , "revoked_invite_link_count" A..= revoked_invite_link_count_
        ]
