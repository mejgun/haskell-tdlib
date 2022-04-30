-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedNotificationSound where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notification sound with the specified identifier 
-- 
-- __notification_sound_id__ Identifier of the notification sound
data GetSavedNotificationSound = 

 GetSavedNotificationSound { notification_sound_id :: Maybe Int }  deriving (Eq)

instance Show GetSavedNotificationSound where
 show GetSavedNotificationSound { notification_sound_id=notification_sound_id } =
  "GetSavedNotificationSound" ++ U.cc [U.p "notification_sound_id" notification_sound_id ]

instance T.ToJSON GetSavedNotificationSound where
 toJSON GetSavedNotificationSound { notification_sound_id = notification_sound_id } =
  A.object [ "@type" A..= T.String "getSavedNotificationSound", "notification_sound_id" A..= notification_sound_id ]

instance T.FromJSON GetSavedNotificationSound where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSavedNotificationSound" -> parseGetSavedNotificationSound v
   _ -> mempty
  where
   parseGetSavedNotificationSound :: A.Value -> T.Parser GetSavedNotificationSound
   parseGetSavedNotificationSound = A.withObject "GetSavedNotificationSound" $ \o -> do
    notification_sound_id <- mconcat [ o A..:? "notification_sound_id", readMaybe <$> (o A..: "notification_sound_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetSavedNotificationSound { notification_sound_id = notification_sound_id }
 parseJSON _ = mempty
