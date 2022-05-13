{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSendingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about the sending state of the message
data MessageSendingState
  = -- | The message is being sent now, but has not yet been delivered to the server
    MessageSendingStatePending
  | -- | The message failed to be sent @error_code An error code; 0 if unknown @error_message Error message
    MessageSendingStateFailed
      { -- | Time left before the message can be re-sent, in seconds. No update is sent when this field changes
        retry_after :: Maybe Float,
        -- | True, if the message can be re-sent only on behalf of a different sender
        need_another_sender :: Maybe Bool,
        -- | True, if the message can be re-sent
        can_retry :: Maybe Bool,
        -- |
        error_message :: Maybe String,
        -- |
        error_code :: Maybe Int
      }
  deriving (Eq)

instance Show MessageSendingState where
  show MessageSendingStatePending =
    "MessageSendingStatePending"
      ++ U.cc
        []
  show
    MessageSendingStateFailed
      { retry_after = retry_after_,
        need_another_sender = need_another_sender_,
        can_retry = can_retry_,
        error_message = error_message_,
        error_code = error_code_
      } =
      "MessageSendingStateFailed"
        ++ U.cc
          [ U.p "retry_after" retry_after_,
            U.p "need_another_sender" need_another_sender_,
            U.p "can_retry" can_retry_,
            U.p "error_message" error_message_,
            U.p "error_code" error_code_
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
      parseMessageSendingStatePending = A.withObject "MessageSendingStatePending" $ \_ -> return MessageSendingStatePending

      parseMessageSendingStateFailed :: A.Value -> T.Parser MessageSendingState
      parseMessageSendingStateFailed = A.withObject "MessageSendingStateFailed" $ \o -> do
        retry_after_ <- o A..:? "retry_after"
        need_another_sender_ <- o A..:? "need_another_sender"
        can_retry_ <- o A..:? "can_retry"
        error_message_ <- o A..:? "error_message"
        error_code_ <- mconcat [o A..:? "error_code", U.rm <$> (o A..: "error_code" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageSendingStateFailed {retry_after = retry_after_, need_another_sender = need_another_sender_, can_retry = can_retry_, error_message = error_message_, error_code = error_code_}
  parseJSON _ = mempty

instance T.ToJSON MessageSendingState where
  toJSON MessageSendingStatePending =
    A.object
      [ "@type" A..= T.String "messageSendingStatePending"
      ]
  toJSON
    MessageSendingStateFailed
      { retry_after = retry_after_,
        need_another_sender = need_another_sender_,
        can_retry = can_retry_,
        error_message = error_message_,
        error_code = error_code_
      } =
      A.object
        [ "@type" A..= T.String "messageSendingStateFailed",
          "retry_after" A..= retry_after_,
          "need_another_sender" A..= need_another_sender_,
          "can_retry" A..= can_retry_,
          "error_message" A..= error_message_,
          "error_code" A..= error_code_
        ]
