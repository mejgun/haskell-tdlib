{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSendingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Error as Error
import qualified Utils as U

-- | Contains information about the sending state of the message
data MessageSendingState
  = -- | The message is being sent now, but has not yet been delivered to the server @sending_id Non-persistent message sending identifier, specified by the application
    MessageSendingStatePending
      { -- |
        sending_id :: Maybe Int
      }
  | -- | The message failed to be sent
    MessageSendingStateFailed
      { -- | Time left before the message can be re-sent, in seconds. No update is sent when this field changes
        retry_after :: Maybe Float,
        -- | True, if the message can be re-sent only on behalf of a different sender
        need_another_sender :: Maybe Bool,
        -- | True, if the message can be re-sent
        can_retry :: Maybe Bool,
        -- | The cause of the message sending failure
        _error :: Maybe Error.Error
      }
  deriving (Eq)

instance Show MessageSendingState where
  show
    MessageSendingStatePending
      { sending_id = sending_id_
      } =
      "MessageSendingStatePending"
        ++ U.cc
          [ U.p "sending_id" sending_id_
          ]
  show
    MessageSendingStateFailed
      { retry_after = retry_after_,
        need_another_sender = need_another_sender_,
        can_retry = can_retry_,
        _error = _error_
      } =
      "MessageSendingStateFailed"
        ++ U.cc
          [ U.p "retry_after" retry_after_,
            U.p "need_another_sender" need_another_sender_,
            U.p "can_retry" can_retry_,
            U.p "_error" _error_
          ]

instance T.FromJSON MessageSendingState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSendingStatePending" -> parseMessageSendingStatePending v
      "messageSendingStateFailed" -> parseMessageSendingStateFailed v
      _ -> mempty
    where
      parseMessageSendingStatePending :: A.Value -> T.Parser MessageSendingState
      parseMessageSendingStatePending = A.withObject "MessageSendingStatePending" $ \o -> do
        sending_id_ <- o A..:? "sending_id"
        return $ MessageSendingStatePending {sending_id = sending_id_}

      parseMessageSendingStateFailed :: A.Value -> T.Parser MessageSendingState
      parseMessageSendingStateFailed = A.withObject "MessageSendingStateFailed" $ \o -> do
        retry_after_ <- o A..:? "retry_after"
        need_another_sender_ <- o A..:? "need_another_sender"
        can_retry_ <- o A..:? "can_retry"
        _error_ <- o A..:? "error"
        return $ MessageSendingStateFailed {retry_after = retry_after_, need_another_sender = need_another_sender_, can_retry = can_retry_, _error = _error_}
  parseJSON _ = mempty

instance T.ToJSON MessageSendingState where
  toJSON
    MessageSendingStatePending
      { sending_id = sending_id_
      } =
      A.object
        [ "@type" A..= T.String "messageSendingStatePending",
          "sending_id" A..= sending_id_
        ]
  toJSON
    MessageSendingStateFailed
      { retry_after = retry_after_,
        need_another_sender = need_another_sender_,
        can_retry = can_retry_,
        _error = _error_
      } =
      A.object
        [ "@type" A..= T.String "messageSendingStateFailed",
          "retry_after" A..= retry_after_,
          "need_another_sender" A..= need_another_sender_,
          "can_retry" A..= can_retry_,
          "error" A..= _error_
        ]
