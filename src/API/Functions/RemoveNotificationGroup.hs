-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveNotificationGroup where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data RemoveNotificationGroup = 
 RemoveNotificationGroup { max_notification_id :: Maybe Int, notification_group_id :: Maybe Int }  deriving (Show)

instance T.ToJSON RemoveNotificationGroup where
 toJSON (RemoveNotificationGroup { max_notification_id = max_notification_id, notification_group_id = notification_group_id }) =
  A.object [ "@type" A..= T.String "removeNotificationGroup", "max_notification_id" A..= max_notification_id, "notification_group_id" A..= notification_group_id ]

instance T.FromJSON RemoveNotificationGroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeNotificationGroup" -> parseRemoveNotificationGroup v
   _ -> mempty
  where
   parseRemoveNotificationGroup :: A.Value -> T.Parser RemoveNotificationGroup
   parseRemoveNotificationGroup = A.withObject "RemoveNotificationGroup" $ \o -> do
    max_notification_id <- optional $ o A..: "max_notification_id"
    notification_group_id <- optional $ o A..: "notification_group_id"
    return $ RemoveNotificationGroup { max_notification_id = max_notification_id, notification_group_id = notification_group_id }