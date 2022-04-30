-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Notification where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.NotificationType as NotificationType

-- |
-- 
-- Contains information about a notification 
-- 
-- __id__ Unique persistent identifier of this notification
-- 
-- __date__ Notification date
-- 
-- __sound_id__ Identifier of the notification sound to be played; 0 if sound is disabled
-- 
-- __type__ Notification type
data Notification = 

 Notification { _type :: Maybe NotificationType.NotificationType, sound_id :: Maybe Int, date :: Maybe Int, _id :: Maybe Int }  deriving (Eq)

instance Show Notification where
 show Notification { _type=_type, sound_id=sound_id, date=date, _id=_id } =
  "Notification" ++ U.cc [U.p "_type" _type, U.p "sound_id" sound_id, U.p "date" date, U.p "_id" _id ]

instance T.ToJSON Notification where
 toJSON Notification { _type = _type, sound_id = sound_id, date = date, _id = _id } =
  A.object [ "@type" A..= T.String "notification", "type" A..= _type, "sound_id" A..= sound_id, "date" A..= date, "id" A..= _id ]

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
    sound_id <- mconcat [ o A..:? "sound_id", readMaybe <$> (o A..: "sound_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Notification { _type = _type, sound_id = sound_id, date = date, _id = _id }
 parseJSON _ = mempty
