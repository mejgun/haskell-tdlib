-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Notification as Notification
import {-# SOURCE #-} qualified API.NotificationGroupType as NotificationGroupType

--main = putStrLn "ok"

data NotificationGroup = 
 NotificationGroup { notifications :: [Notification.Notification], total_count :: Int, chat_id :: Int, _type :: NotificationGroupType.NotificationGroupType, _id :: Int }  -- deriving (Show)

instance T.ToJSON NotificationGroup where
 toJSON (NotificationGroup { notifications = notifications, total_count = total_count, chat_id = chat_id, _type = _type, _id = _id }) =
  A.object [ "@type" A..= T.String "notificationGroup", "notifications" A..= notifications, "total_count" A..= total_count, "chat_id" A..= chat_id, "type" A..= _type, "id" A..= _id ]
-- notificationGroup NotificationGroup  { notifications :: [Notification.Notification], total_count :: Int, chat_id :: Int, _type :: NotificationGroupType.NotificationGroupType, _id :: Int } 

