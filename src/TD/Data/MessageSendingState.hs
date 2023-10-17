module TD.Data.MessageSendingState
  (MessageSendingState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Error as Error

-- | Contains information about the sending state of the message
data MessageSendingState
  = MessageSendingStatePending -- ^ The message is being sent now, but has not yet been delivered to the server
    { sending_id :: Maybe Int -- ^ Non-persistent message sending identifier, specified by the application
    }
  | MessageSendingStateFailed -- ^ The message failed to be sent
    { _error              :: Maybe Error.Error -- ^ The cause of the message sending failure
    , can_retry           :: Maybe Bool        -- ^ True, if the message can be re-sent
    , need_another_sender :: Maybe Bool        -- ^ True, if the message can be re-sent only on behalf of a different sender
    , retry_after         :: Maybe Double      -- ^ Time left before the message can be re-sent, in seconds. No update is sent when this field changes
    }
  deriving (Eq, Show)

instance I.ShortShow MessageSendingState where
  shortShow MessageSendingStatePending
    { sending_id = sending_id_
    }
      = "MessageSendingStatePending"
        ++ I.cc
        [ "sending_id" `I.p` sending_id_
        ]
  shortShow MessageSendingStateFailed
    { _error              = _error_
    , can_retry           = can_retry_
    , need_another_sender = need_another_sender_
    , retry_after         = retry_after_
    }
      = "MessageSendingStateFailed"
        ++ I.cc
        [ "_error"              `I.p` _error_
        , "can_retry"           `I.p` can_retry_
        , "need_another_sender" `I.p` need_another_sender_
        , "retry_after"         `I.p` retry_after_
        ]

instance AT.FromJSON MessageSendingState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSendingStatePending" -> parseMessageSendingStatePending v
      "messageSendingStateFailed"  -> parseMessageSendingStateFailed v
      _                            -> mempty
    
    where
      parseMessageSendingStatePending :: A.Value -> AT.Parser MessageSendingState
      parseMessageSendingStatePending = A.withObject "MessageSendingStatePending" $ \o -> do
        sending_id_ <- o A..:?  "sending_id"
        pure $ MessageSendingStatePending
          { sending_id = sending_id_
          }
      parseMessageSendingStateFailed :: A.Value -> AT.Parser MessageSendingState
      parseMessageSendingStateFailed = A.withObject "MessageSendingStateFailed" $ \o -> do
        _error_              <- o A..:?  "error"
        can_retry_           <- o A..:?  "can_retry"
        need_another_sender_ <- o A..:?  "need_another_sender"
        retry_after_         <- o A..:?  "retry_after"
        pure $ MessageSendingStateFailed
          { _error              = _error_
          , can_retry           = can_retry_
          , need_another_sender = need_another_sender_
          , retry_after         = retry_after_
          }
  parseJSON _ = mempty

