-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationGroup where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Notification as Notification
import {-# SOURCE #-} qualified API.NotificationGroupType as NotificationGroupType

data NotificationGroup = 
 NotificationGroup { notifications :: Maybe [Notification.Notification], total_count :: Maybe Int, chat_id :: Maybe Int, _type :: Maybe NotificationGroupType.NotificationGroupType, _id :: Maybe Int }  deriving (Show)

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
    notifications <- optional $ o A..: "notifications"
    total_count <- optional $ o A..: "total_count"
    chat_id <- optional $ o A..: "chat_id"
    _type <- optional $ o A..: "type"
    _id <- optional $ o A..: "id"
    return $ NotificationGroup { notifications = notifications, total_count = total_count, chat_id = chat_id, _type = _type, _id = _id }