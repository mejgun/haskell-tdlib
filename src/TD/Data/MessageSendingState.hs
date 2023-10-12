module TD.Data.MessageSendingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data MessageSendingState -- ^ Contains information about the sending state of the message
  = MessageSendingStatePending -- ^ The message is being sent now, but has not yet been delivered to the server
    { sending_id :: Maybe Int -- ^ Non-persistent message sending identifier, specified by the application
    }
  | MessageSendingStateFailed -- ^ The message failed to be sent
    { error_code          :: Maybe Int    -- ^ An error code; 0 if unknown
    , error_message       :: Maybe T.Text -- ^ Error message
    , can_retry           :: Maybe Bool   -- ^ True, if the message can be re-sent
    , need_another_sender :: Maybe Bool   -- ^ True, if the message can be re-sent only on behalf of a different sender
    , retry_after         :: Maybe Double -- ^ Time left before the message can be re-sent, in seconds. No update is sent when this field changes
    }
  deriving (Eq)

instance Show MessageSendingState where
  show MessageSendingStatePending
    { sending_id = sending_id_
    }
      = "MessageSendingStatePending"
        ++ I.cc
        [ "sending_id" `I.p` sending_id_
        ]
  show MessageSendingStateFailed
    { error_code          = error_code_
    , error_message       = error_message_
    , can_retry           = can_retry_
    , need_another_sender = need_another_sender_
    , retry_after         = retry_after_
    }
      = "MessageSendingStateFailed"
        ++ I.cc
        [ "error_code"          `I.p` error_code_
        , "error_message"       `I.p` error_message_
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
        error_code_          <- o A..:?  "error_code"
        error_message_       <- o A..:?  "error_message"
        can_retry_           <- o A..:?  "can_retry"
        need_another_sender_ <- o A..:?  "need_another_sender"
        retry_after_         <- o A..:?  "retry_after"
        pure $ MessageSendingStateFailed
          { error_code          = error_code_
          , error_message       = error_message_
          , can_retry           = can_retry_
          , need_another_sender = need_another_sender_
          , retry_after         = retry_after_
          }

instance AT.ToJSON MessageSendingState where
  toJSON MessageSendingStatePending
    { sending_id = sending_id_
    }
      = A.object
        [ "@type"      A..= AT.String "messageSendingStatePending"
        , "sending_id" A..= sending_id_
        ]
  toJSON MessageSendingStateFailed
    { error_code          = error_code_
    , error_message       = error_message_
    , can_retry           = can_retry_
    , need_another_sender = need_another_sender_
    , retry_after         = retry_after_
    }
      = A.object
        [ "@type"               A..= AT.String "messageSendingStateFailed"
        , "error_code"          A..= error_code_
        , "error_message"       A..= error_message_
        , "can_retry"           A..= can_retry_
        , "need_another_sender" A..= need_another_sender_
        , "retry_after"         A..= retry_after_
        ]
