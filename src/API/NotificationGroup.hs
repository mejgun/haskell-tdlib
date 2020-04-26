-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationGroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Notification as Notification
import {-# SOURCE #-} qualified API.NotificationGroupType as NotificationGroupType

-- |
-- 
-- Describes a group of notifications 
-- 
-- __id__ Unique persistent auto-incremented from 1 identifier of the notification group
-- 
-- __type__ Type of the group
-- 
-- __chat_id__ Identifier of a chat to which all notifications in the group belong
-- 
-- __total_count__ Total number of active notifications in the group
-- 
-- __notifications__ The list of active notifications
data NotificationGroup = 
 NotificationGroup { notifications :: Maybe [Notification.Notification], total_count :: Maybe Int, chat_id :: Maybe Int, _type :: Maybe NotificationGroupType.NotificationGroupType, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON NotificationGroup where
 toJSON (NotificationGroup { notifications = notifications, total_count = total_count, chat_id = chat_id, _type = _type, _id = _id }) =
  A.object [ "@type" A..= T.String "notificationGroup", "notifications" A..= notifications, "total_count" A..= total_count, "chat_id" A..= chat_id, "type" A..= _type, "id" A..= _id ]

instance T.FromJSON NotificationGroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notificationGroup" -> parseNotificationGroup v
   _ -> mempty
  where
   parseNotificationGroup :: A.Value -> T.Parser NotificationGroup
   parseNotificationGroup = A.withObject "NotificationGroup" $ \o -> do
    notifications <- o A..:? "notifications"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _type <- o A..:? "type"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ NotificationGroup { notifications = notifications, total_count = total_count, chat_id = chat_id, _type = _type, _id = _id }