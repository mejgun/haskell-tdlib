{-# LANGUAGE OverloadedStrings #-}

module TD.Data.NotificationGroupType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the type of notifications in a notification group
data NotificationGroupType
  = -- | A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with ordinary unread messages
    NotificationGroupTypeMessages
  | -- | A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with unread mentions of the current user, replies to their messages, or a pinned message
    NotificationGroupTypeMentions
  | -- | A group containing a notification of type notificationTypeNewSecretChat
    NotificationGroupTypeSecretChat
  | -- | A group containing notifications of type notificationTypeNewCall
    NotificationGroupTypeCalls
  deriving (Eq)

instance Show NotificationGroupType where
  show NotificationGroupTypeMessages =
    "NotificationGroupTypeMessages"
      ++ U.cc
        []
  show NotificationGroupTypeMentions =
    "NotificationGroupTypeMentions"
      ++ U.cc
        []
  show NotificationGroupTypeSecretChat =
    "NotificationGroupTypeSecretChat"
      ++ U.cc
        []
  show NotificationGroupTypeCalls =
    "NotificationGroupTypeCalls"
      ++ U.cc
        []

instance T.FromJSON NotificationGroupType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notificationGroupTypeMessages" -> parseNotificationGroupTypeMessages v
      "notificationGroupTypeMentions" -> parseNotificationGroupTypeMentions v
      "notificationGroupTypeSecretChat" -> parseNotificationGroupTypeSecretChat v
      "notificationGroupTypeCalls" -> parseNotificationGroupTypeCalls v
      _ -> mempty
    where
      parseNotificationGroupTypeMessages :: A.Value -> T.Parser NotificationGroupType
      parseNotificationGroupTypeMessages = A.withObject "NotificationGroupTypeMessages" $ \o -> do
        return $ NotificationGroupTypeMessages {}

      parseNotificationGroupTypeMentions :: A.Value -> T.Parser NotificationGroupType
      parseNotificationGroupTypeMentions = A.withObject "NotificationGroupTypeMentions" $ \o -> do
        return $ NotificationGroupTypeMentions {}

      parseNotificationGroupTypeSecretChat :: A.Value -> T.Parser NotificationGroupType
      parseNotificationGroupTypeSecretChat = A.withObject "NotificationGroupTypeSecretChat" $ \o -> do
        return $ NotificationGroupTypeSecretChat {}

      parseNotificationGroupTypeCalls :: A.Value -> T.Parser NotificationGroupType
      parseNotificationGroupTypeCalls = A.withObject "NotificationGroupTypeCalls" $ \o -> do
        return $ NotificationGroupTypeCalls {}
  parseJSON _ = mempty

instance T.ToJSON NotificationGroupType where
  toJSON NotificationGroupTypeMessages =
    A.object
      [ "@type" A..= T.String "notificationGroupTypeMessages"
      ]
  toJSON NotificationGroupTypeMentions =
    A.object
      [ "@type" A..= T.String "notificationGroupTypeMentions"
      ]
  toJSON NotificationGroupTypeSecretChat =
    A.object
      [ "@type" A..= T.String "notificationGroupTypeSecretChat"
      ]
  toJSON NotificationGroupTypeCalls =
    A.object
      [ "@type" A..= T.String "notificationGroupTypeCalls"
      ]
