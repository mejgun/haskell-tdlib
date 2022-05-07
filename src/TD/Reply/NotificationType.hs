{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.NotificationType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Message as Message
import qualified TD.Reply.MessageSender as MessageSender
import qualified TD.Reply.PushMessageContent as PushMessageContent
import qualified Utils as U

-- | Contains detailed information about a notification
data NotificationType
  = -- | New message was received @message The message
    NotificationTypeNewMessage
      { -- |
        message :: Maybe Message.Message
      }
  | -- | New secret chat was created
    NotificationTypeNewSecretChat
  | -- | New call was received @call_id Call identifier
    NotificationTypeNewCall
      { -- |
        call_id :: Maybe Int
      }
  | -- | New message was received through a push notification
    NotificationTypeNewPushMessage
      { -- | Push message content
        content :: Maybe PushMessageContent.PushMessageContent,
        -- | True, if the message is outgoing
        is_outgoing :: Maybe Bool,
        -- | Name of the sender
        sender_name :: Maybe String,
        -- | Identifier of the sender of the message. Corresponding user or chat may be inaccessible
        sender_id :: Maybe MessageSender.MessageSender,
        -- | The message identifier. The message will not be available in the chat history, but the ID can be used in viewMessages, or as reply_to_message_id
        message_id :: Maybe Int
      }
  deriving (Eq)

instance Show NotificationType where
  show
    NotificationTypeNewMessage
      { message = message
      } =
      "NotificationTypeNewMessage"
        ++ U.cc
          [ U.p "message" message
          ]
  show NotificationTypeNewSecretChat =
    "NotificationTypeNewSecretChat"
      ++ U.cc
        []
  show
    NotificationTypeNewCall
      { call_id = call_id
      } =
      "NotificationTypeNewCall"
        ++ U.cc
          [ U.p "call_id" call_id
          ]
  show
    NotificationTypeNewPushMessage
      { content = content,
        is_outgoing = is_outgoing,
        sender_name = sender_name,
        sender_id = sender_id,
        message_id = message_id
      } =
      "NotificationTypeNewPushMessage"
        ++ U.cc
          [ U.p "content" content,
            U.p "is_outgoing" is_outgoing,
            U.p "sender_name" sender_name,
            U.p "sender_id" sender_id,
            U.p "message_id" message_id
          ]

instance T.FromJSON NotificationType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notificationTypeNewMessage" -> parseNotificationTypeNewMessage v
      "notificationTypeNewSecretChat" -> parseNotificationTypeNewSecretChat v
      "notificationTypeNewCall" -> parseNotificationTypeNewCall v
      "notificationTypeNewPushMessage" -> parseNotificationTypeNewPushMessage v
      _ -> fail ""
    where
      parseNotificationTypeNewMessage :: A.Value -> T.Parser NotificationType
      parseNotificationTypeNewMessage = A.withObject "NotificationTypeNewMessage" $ \o -> do
        message_ <- o A..:? "message"
        return $ NotificationTypeNewMessage {message = message_}

      parseNotificationTypeNewSecretChat :: A.Value -> T.Parser NotificationType
      parseNotificationTypeNewSecretChat = A.withObject "NotificationTypeNewSecretChat" $ \o -> do
        return $ NotificationTypeNewSecretChat {}

      parseNotificationTypeNewCall :: A.Value -> T.Parser NotificationType
      parseNotificationTypeNewCall = A.withObject "NotificationTypeNewCall" $ \o -> do
        call_id_ <- mconcat [o A..:? "call_id", U.rm <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ NotificationTypeNewCall {call_id = call_id_}

      parseNotificationTypeNewPushMessage :: A.Value -> T.Parser NotificationType
      parseNotificationTypeNewPushMessage = A.withObject "NotificationTypeNewPushMessage" $ \o -> do
        content_ <- o A..:? "content"
        is_outgoing_ <- o A..:? "is_outgoing"
        sender_name_ <- o A..:? "sender_name"
        sender_id_ <- o A..:? "sender_id"
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ NotificationTypeNewPushMessage {content = content_, is_outgoing = is_outgoing_, sender_name = sender_name_, sender_id = sender_id_, message_id = message_id_}
  parseJSON _ = fail ""

instance T.ToJSON NotificationType where
  toJSON
    NotificationTypeNewMessage
      { message = message
      } =
      A.object
        [ "@type" A..= T.String "notificationTypeNewMessage",
          "message" A..= message
        ]
  toJSON NotificationTypeNewSecretChat =
    A.object
      [ "@type" A..= T.String "notificationTypeNewSecretChat"
      ]
  toJSON
    NotificationTypeNewCall
      { call_id = call_id
      } =
      A.object
        [ "@type" A..= T.String "notificationTypeNewCall",
          "call_id" A..= call_id
        ]
  toJSON
    NotificationTypeNewPushMessage
      { content = content,
        is_outgoing = is_outgoing,
        sender_name = sender_name,
        sender_id = sender_id,
        message_id = message_id
      } =
      A.object
        [ "@type" A..= T.String "notificationTypeNewPushMessage",
          "content" A..= content,
          "is_outgoing" A..= is_outgoing,
          "sender_name" A..= sender_name,
          "sender_id" A..= sender_id,
          "message_id" A..= message_id
        ]
