{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.NotificationType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Message as Message
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.PushMessageContent as PushMessageContent
import qualified Utils as U

-- | Contains detailed information about a notification
data NotificationType
  = -- | New message was received @message The message @show_preview True, if message content must be displayed in notifications
    NotificationTypeNewMessage
      { -- |
        show_preview :: Maybe Bool,
        -- |
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
        -- | The message identifier. The message will not be available in the chat history, but the identifier can be used in viewMessages, or as a message to reply
        message_id :: Maybe Int
      }
  deriving (Eq)

instance Show NotificationType where
  show
    NotificationTypeNewMessage
      { show_preview = show_preview_,
        message = message_
      } =
      "NotificationTypeNewMessage"
        ++ U.cc
          [ U.p "show_preview" show_preview_,
            U.p "message" message_
          ]
  show NotificationTypeNewSecretChat =
    "NotificationTypeNewSecretChat"
      ++ U.cc
        []
  show
    NotificationTypeNewCall
      { call_id = call_id_
      } =
      "NotificationTypeNewCall"
        ++ U.cc
          [ U.p "call_id" call_id_
          ]
  show
    NotificationTypeNewPushMessage
      { content = content_,
        is_outgoing = is_outgoing_,
        sender_name = sender_name_,
        sender_id = sender_id_,
        message_id = message_id_
      } =
      "NotificationTypeNewPushMessage"
        ++ U.cc
          [ U.p "content" content_,
            U.p "is_outgoing" is_outgoing_,
            U.p "sender_name" sender_name_,
            U.p "sender_id" sender_id_,
            U.p "message_id" message_id_
          ]

instance T.FromJSON NotificationType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notificationTypeNewMessage" -> parseNotificationTypeNewMessage v
      "notificationTypeNewSecretChat" -> parseNotificationTypeNewSecretChat v
      "notificationTypeNewCall" -> parseNotificationTypeNewCall v
      "notificationTypeNewPushMessage" -> parseNotificationTypeNewPushMessage v
      _ -> mempty
    where
      parseNotificationTypeNewMessage :: A.Value -> T.Parser NotificationType
      parseNotificationTypeNewMessage = A.withObject "NotificationTypeNewMessage" $ \o -> do
        show_preview_ <- o A..:? "show_preview"
        message_ <- o A..:? "message"
        return $ NotificationTypeNewMessage {show_preview = show_preview_, message = message_}

      parseNotificationTypeNewSecretChat :: A.Value -> T.Parser NotificationType
      parseNotificationTypeNewSecretChat = A.withObject "NotificationTypeNewSecretChat" $ \_ -> return NotificationTypeNewSecretChat

      parseNotificationTypeNewCall :: A.Value -> T.Parser NotificationType
      parseNotificationTypeNewCall = A.withObject "NotificationTypeNewCall" $ \o -> do
        call_id_ <- o A..:? "call_id"
        return $ NotificationTypeNewCall {call_id = call_id_}

      parseNotificationTypeNewPushMessage :: A.Value -> T.Parser NotificationType
      parseNotificationTypeNewPushMessage = A.withObject "NotificationTypeNewPushMessage" $ \o -> do
        content_ <- o A..:? "content"
        is_outgoing_ <- o A..:? "is_outgoing"
        sender_name_ <- o A..:? "sender_name"
        sender_id_ <- o A..:? "sender_id"
        message_id_ <- o A..:? "message_id"
        return $ NotificationTypeNewPushMessage {content = content_, is_outgoing = is_outgoing_, sender_name = sender_name_, sender_id = sender_id_, message_id = message_id_}
  parseJSON _ = mempty

instance T.ToJSON NotificationType where
  toJSON
    NotificationTypeNewMessage
      { show_preview = show_preview_,
        message = message_
      } =
      A.object
        [ "@type" A..= T.String "notificationTypeNewMessage",
          "show_preview" A..= show_preview_,
          "message" A..= message_
        ]
  toJSON NotificationTypeNewSecretChat =
    A.object
      [ "@type" A..= T.String "notificationTypeNewSecretChat"
      ]
  toJSON
    NotificationTypeNewCall
      { call_id = call_id_
      } =
      A.object
        [ "@type" A..= T.String "notificationTypeNewCall",
          "call_id" A..= call_id_
        ]
  toJSON
    NotificationTypeNewPushMessage
      { content = content_,
        is_outgoing = is_outgoing_,
        sender_name = sender_name_,
        sender_id = sender_id_,
        message_id = message_id_
      } =
      A.object
        [ "@type" A..= T.String "notificationTypeNewPushMessage",
          "content" A..= content_,
          "is_outgoing" A..= is_outgoing_,
          "sender_name" A..= sender_name_,
          "sender_id" A..= sender_id_,
          "message_id" A..= message_id_
        ]
