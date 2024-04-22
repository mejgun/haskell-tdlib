module TD.Data.FailedToAddMember
  (FailedToAddMember(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data FailedToAddMember
  = FailedToAddMember -- ^ Contains information about a user that has failed to be added to a chat
    { user_id                           :: Maybe Int  -- ^ User identifier
    , premium_would_allow_invite        :: Maybe Bool -- ^ True, if subscription to Telegram Premium would have allowed to add the user to the chat
    , premium_required_to_send_messages :: Maybe Bool -- ^ True, if subscription to Telegram Premium is required to send the user chat invite link
    }
  deriving (Eq, Show)

instance I.ShortShow FailedToAddMember where
  shortShow FailedToAddMember
    { user_id                           = user_id_
    , premium_would_allow_invite        = premium_would_allow_invite_
    , premium_required_to_send_messages = premium_required_to_send_messages_
    }
      = "FailedToAddMember"
        ++ I.cc
        [ "user_id"                           `I.p` user_id_
        , "premium_would_allow_invite"        `I.p` premium_would_allow_invite_
        , "premium_required_to_send_messages" `I.p` premium_required_to_send_messages_
        ]

instance AT.FromJSON FailedToAddMember where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "failedToAddMember" -> parseFailedToAddMember v
      _                   -> mempty
    
    where
      parseFailedToAddMember :: A.Value -> AT.Parser FailedToAddMember
      parseFailedToAddMember = A.withObject "FailedToAddMember" $ \o -> do
        user_id_                           <- o A..:?  "user_id"
        premium_would_allow_invite_        <- o A..:?  "premium_would_allow_invite"
        premium_required_to_send_messages_ <- o A..:?  "premium_required_to_send_messages"
        pure $ FailedToAddMember
          { user_id                           = user_id_
          , premium_would_allow_invite        = premium_would_allow_invite_
          , premium_required_to_send_messages = premium_required_to_send_messages_
          }
  parseJSON _ = mempty

