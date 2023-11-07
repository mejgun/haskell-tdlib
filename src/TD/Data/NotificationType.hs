module TD.Data.NotificationType
  (NotificationType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T
import qualified TD.Data.PushMessageContent as PushMessageContent

-- | Contains detailed information about a notification
data NotificationType
  = NotificationTypeNewMessage -- ^ New message was received
    { message      :: Maybe Message.Message -- ^ The message
    , show_preview :: Maybe Bool            -- ^ True, if message content must be displayed in notifications
    }
  | NotificationTypeNewSecretChat -- ^ New secret chat was created
  | NotificationTypeNewCall -- ^ New call was received
    { call_id :: Maybe Int -- ^ Call identifier
    }
  | NotificationTypeNewPushMessage -- ^ New message was received through a push notification
    { message_id  :: Maybe Int                                   -- ^ The message identifier. The message will not be available in the chat history, but the identifier can be used in viewMessages, or as a message to be replied in the same chat
    , sender_id   :: Maybe MessageSender.MessageSender           -- ^ Identifier of the sender of the message. Corresponding user or chat may be inaccessible
    , sender_name :: Maybe T.Text                                -- ^ Name of the sender
    , is_outgoing :: Maybe Bool                                  -- ^ True, if the message is outgoing
    , content     :: Maybe PushMessageContent.PushMessageContent -- ^ Push message content
    }
  deriving (Eq, Show)

instance I.ShortShow NotificationType where
  shortShow NotificationTypeNewMessage
    { message      = message_
    , show_preview = show_preview_
    }
      = "NotificationTypeNewMessage"
        ++ I.cc
        [ "message"      `I.p` message_
        , "show_preview" `I.p` show_preview_
        ]
  shortShow NotificationTypeNewSecretChat
      = "NotificationTypeNewSecretChat"
  shortShow NotificationTypeNewCall
    { call_id = call_id_
    }
      = "NotificationTypeNewCall"
        ++ I.cc
        [ "call_id" `I.p` call_id_
        ]
  shortShow NotificationTypeNewPushMessage
    { message_id  = message_id_
    , sender_id   = sender_id_
    , sender_name = sender_name_
    , is_outgoing = is_outgoing_
    , content     = content_
    }
      = "NotificationTypeNewPushMessage"
        ++ I.cc
        [ "message_id"  `I.p` message_id_
        , "sender_id"   `I.p` sender_id_
        , "sender_name" `I.p` sender_name_
        , "is_outgoing" `I.p` is_outgoing_
        , "content"     `I.p` content_
        ]

instance AT.FromJSON NotificationType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "notificationTypeNewMessage"     -> parseNotificationTypeNewMessage v
      "notificationTypeNewSecretChat"  -> pure NotificationTypeNewSecretChat
      "notificationTypeNewCall"        -> parseNotificationTypeNewCall v
      "notificationTypeNewPushMessage" -> parseNotificationTypeNewPushMessage v
      _                                -> mempty
    
    where
      parseNotificationTypeNewMessage :: A.Value -> AT.Parser NotificationType
      parseNotificationTypeNewMessage = A.withObject "NotificationTypeNewMessage" $ \o -> do
        message_      <- o A..:?  "message"
        show_preview_ <- o A..:?  "show_preview"
        pure $ NotificationTypeNewMessage
          { message      = message_
          , show_preview = show_preview_
          }
      parseNotificationTypeNewCall :: A.Value -> AT.Parser NotificationType
      parseNotificationTypeNewCall = A.withObject "NotificationTypeNewCall" $ \o -> do
        call_id_ <- o A..:?  "call_id"
        pure $ NotificationTypeNewCall
          { call_id = call_id_
          }
      parseNotificationTypeNewPushMessage :: A.Value -> AT.Parser NotificationType
      parseNotificationTypeNewPushMessage = A.withObject "NotificationTypeNewPushMessage" $ \o -> do
        message_id_  <- o A..:?  "message_id"
        sender_id_   <- o A..:?  "sender_id"
        sender_name_ <- o A..:?  "sender_name"
        is_outgoing_ <- o A..:?  "is_outgoing"
        content_     <- o A..:?  "content"
        pure $ NotificationTypeNewPushMessage
          { message_id  = message_id_
          , sender_id   = sender_id_
          , sender_name = sender_name_
          , is_outgoing = is_outgoing_
          , content     = content_
          }
  parseJSON _ = mempty

