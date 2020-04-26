-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Notification where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NotificationType as NotificationType

-- |
-- 
-- Contains information about a notification 
-- 
-- __id__ Unique persistent identifier of this notification
-- 
-- __date__ Notification date
-- 
-- __is_silent__ True, if the notification was initially silent
-- 
-- __type__ Notification type
data Notification = 
 Notification { _type :: Maybe NotificationType.NotificationType, is_silent :: Maybe Bool, date :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Notification where
 toJSON (Notification { _type = _type, is_silent = is_silent, date = date, _id = _id }) =
  A.object [ "@type" A..= T.String "notification", "type" A..= _type, "is_silent" A..= is_silent, "date" A..= date, "id" A..= _id ]

instance T.FromJSON Notification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notification" -> parseNotification v
   _ -> mempty
  where
   parseNotification :: A.Value -> T.Parser Notification
   parseNotification = A.withObject "Notification" $ \o -> do
    _type <- o A..:? "type"
    is_silent <- o A..:? "is_silent"
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Notification { _type = _type, is_silent = is_silent, date = date, _id = _id }