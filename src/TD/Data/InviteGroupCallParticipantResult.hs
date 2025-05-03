module TD.Data.InviteGroupCallParticipantResult
  (InviteGroupCallParticipantResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes result of group call participant invitation
data InviteGroupCallParticipantResult
  = InviteGroupCallParticipantResultUserPrivacyRestricted -- ^ The user can't be invited due to their privacy settings
  | InviteGroupCallParticipantResultUserAlreadyParticipant -- ^ The user can't be invited because they are already a participant of the call
  | InviteGroupCallParticipantResultUserWasBanned -- ^ The user can't be invited because they were banned by the owner of the call and can be invited back only by the owner of the group call
  | InviteGroupCallParticipantResultSuccess -- ^ The user was invited and a service message of the type messageGroupCall was sent which can be used in declineGroupCallInvitation to cancel the invitation
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the invitation message
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow InviteGroupCallParticipantResult where
  shortShow InviteGroupCallParticipantResultUserPrivacyRestricted
      = "InviteGroupCallParticipantResultUserPrivacyRestricted"
  shortShow InviteGroupCallParticipantResultUserAlreadyParticipant
      = "InviteGroupCallParticipantResultUserAlreadyParticipant"
  shortShow InviteGroupCallParticipantResultUserWasBanned
      = "InviteGroupCallParticipantResultUserWasBanned"
  shortShow InviteGroupCallParticipantResultSuccess
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "InviteGroupCallParticipantResultSuccess"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]

instance AT.FromJSON InviteGroupCallParticipantResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inviteGroupCallParticipantResultUserPrivacyRestricted"  -> pure InviteGroupCallParticipantResultUserPrivacyRestricted
      "inviteGroupCallParticipantResultUserAlreadyParticipant" -> pure InviteGroupCallParticipantResultUserAlreadyParticipant
      "inviteGroupCallParticipantResultUserWasBanned"          -> pure InviteGroupCallParticipantResultUserWasBanned
      "inviteGroupCallParticipantResultSuccess"                -> parseInviteGroupCallParticipantResultSuccess v
      _                                                        -> mempty
    
    where
      parseInviteGroupCallParticipantResultSuccess :: A.Value -> AT.Parser InviteGroupCallParticipantResult
      parseInviteGroupCallParticipantResultSuccess = A.withObject "InviteGroupCallParticipantResultSuccess" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ InviteGroupCallParticipantResultSuccess
          { chat_id    = chat_id_
          , message_id = message_id_
          }
  parseJSON _ = mempty

