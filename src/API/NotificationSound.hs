-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationSound where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- Describes a notification sound in MP3 format
-- 
-- __id__ Unique identifier of the notification sound
-- 
-- __duration__ Duration of the sound, in seconds
-- 
-- __date__ Point in time (Unix timestamp) when the sound was created
-- 
-- __title__ Title of the notification sound
-- 
-- __data__ Arbitrary data, defined while the sound was uploaded
-- 
-- __sound__ File containing the sound
data NotificationSound = 

 NotificationSound { sound :: Maybe File.File, _data :: Maybe String, title :: Maybe String, date :: Maybe Int, duration :: Maybe Int, _id :: Maybe Int }  deriving (Eq)

instance Show NotificationSound where
 show NotificationSound { sound=sound, _data=_data, title=title, date=date, duration=duration, _id=_id } =
  "NotificationSound" ++ U.cc [U.p "sound" sound, U.p "_data" _data, U.p "title" title, U.p "date" date, U.p "duration" duration, U.p "_id" _id ]

instance T.ToJSON NotificationSound where
 toJSON NotificationSound { sound = sound, _data = _data, title = title, date = date, duration = duration, _id = _id } =
  A.object [ "@type" A..= T.String "notificationSound", "sound" A..= sound, "data" A..= _data, "title" A..= title, "date" A..= date, "duration" A..= duration, "id" A..= _id ]

instance T.FromJSON NotificationSound where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notificationSound" -> parseNotificationSound v
   _ -> mempty
  where
   parseNotificationSound :: A.Value -> T.Parser NotificationSound
   parseNotificationSound = A.withObject "NotificationSound" $ \o -> do
    sound <- o A..:? "sound"
    _data <- o A..:? "data"
    title <- o A..:? "title"
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ NotificationSound { sound = sound, _data = _data, title = title, date = date, duration = duration, _id = _id }
 parseJSON _ = mempty
