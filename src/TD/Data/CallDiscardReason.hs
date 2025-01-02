module TD.Data.CallDiscardReason
  (CallDiscardReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Describes the reason why a call was discarded
data CallDiscardReason
  = CallDiscardReasonEmpty -- ^ The call wasn't discarded, or the reason is unknown
  | CallDiscardReasonMissed -- ^ The call was ended before the conversation started. It was canceled by the caller or missed by the other party
  | CallDiscardReasonDeclined -- ^ The call was ended before the conversation started. It was declined by the other party
  | CallDiscardReasonDisconnected -- ^ The call was ended during the conversation because the users were disconnected
  | CallDiscardReasonHungUp -- ^ The call was ended because one of the parties hung up
  | CallDiscardReasonAllowGroupCall -- ^ The call was ended because it has been used successfully to transfer private encryption key for the associated group call
    { encrypted_group_call_key :: Maybe BS.ByteString -- ^ Encrypted using the call private key encryption key for the associated group call
    }
  deriving (Eq, Show)

instance I.ShortShow CallDiscardReason where
  shortShow CallDiscardReasonEmpty
      = "CallDiscardReasonEmpty"
  shortShow CallDiscardReasonMissed
      = "CallDiscardReasonMissed"
  shortShow CallDiscardReasonDeclined
      = "CallDiscardReasonDeclined"
  shortShow CallDiscardReasonDisconnected
      = "CallDiscardReasonDisconnected"
  shortShow CallDiscardReasonHungUp
      = "CallDiscardReasonHungUp"
  shortShow CallDiscardReasonAllowGroupCall
    { encrypted_group_call_key = encrypted_group_call_key_
    }
      = "CallDiscardReasonAllowGroupCall"
        ++ I.cc
        [ "encrypted_group_call_key" `I.p` encrypted_group_call_key_
        ]

instance AT.FromJSON CallDiscardReason where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callDiscardReasonEmpty"          -> pure CallDiscardReasonEmpty
      "callDiscardReasonMissed"         -> pure CallDiscardReasonMissed
      "callDiscardReasonDeclined"       -> pure CallDiscardReasonDeclined
      "callDiscardReasonDisconnected"   -> pure CallDiscardReasonDisconnected
      "callDiscardReasonHungUp"         -> pure CallDiscardReasonHungUp
      "callDiscardReasonAllowGroupCall" -> parseCallDiscardReasonAllowGroupCall v
      _                                 -> mempty
    
    where
      parseCallDiscardReasonAllowGroupCall :: A.Value -> AT.Parser CallDiscardReason
      parseCallDiscardReasonAllowGroupCall = A.withObject "CallDiscardReasonAllowGroupCall" $ \o -> do
        encrypted_group_call_key_ <- fmap I.readBytes <$> o A..:?  "encrypted_group_call_key"
        pure $ CallDiscardReasonAllowGroupCall
          { encrypted_group_call_key = encrypted_group_call_key_
          }
  parseJSON _ = mempty

