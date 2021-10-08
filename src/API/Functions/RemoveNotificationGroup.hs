-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveNotificationGroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user 
-- 
-- __notification_group_id__ Notification group identifier
-- 
-- __max_notification_id__ The maximum identifier of removed notifications
data RemoveNotificationGroup = 

 RemoveNotificationGroup { max_notification_id :: Maybe Int, notification_group_id :: Maybe Int }  deriving (Eq)

instance Show RemoveNotificationGroup where
 show RemoveNotificationGroup { max_notification_id=max_notification_id, notification_group_id=notification_group_id } =
  "RemoveNotificationGroup" ++ cc [p "max_notification_id" max_notification_id, p "notification_group_id" notification_group_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RemoveNotificationGroup where
 toJSON RemoveNotificationGroup { max_notification_id = max_notification_id, notification_group_id = notification_group_id } =
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
    max_notification_id <- mconcat [ o A..:? "max_notification_id", readMaybe <$> (o A..: "max_notification_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    notification_group_id <- mconcat [ o A..:? "notification_group_id", readMaybe <$> (o A..: "notification_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveNotificationGroup { max_notification_id = max_notification_id, notification_group_id = notification_group_id }
 parseJSON _ = mempty
