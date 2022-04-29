-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveSavedNotificationSound where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Removes a notification sound from the list of saved notification sounds 
-- 
-- __notification_sound_id__ Identifier of the notification sound
data RemoveSavedNotificationSound = 

 RemoveSavedNotificationSound { notification_sound_id :: Maybe Int }  deriving (Eq)

instance Show RemoveSavedNotificationSound where
 show RemoveSavedNotificationSound { notification_sound_id=notification_sound_id } =
  "RemoveSavedNotificationSound" ++ cc [p "notification_sound_id" notification_sound_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RemoveSavedNotificationSound where
 toJSON RemoveSavedNotificationSound { notification_sound_id = notification_sound_id } =
  A.object [ "@type" A..= T.String "removeSavedNotificationSound", "notification_sound_id" A..= notification_sound_id ]

instance T.FromJSON RemoveSavedNotificationSound where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeSavedNotificationSound" -> parseRemoveSavedNotificationSound v
   _ -> mempty
  where
   parseRemoveSavedNotificationSound :: A.Value -> T.Parser RemoveSavedNotificationSound
   parseRemoveSavedNotificationSound = A.withObject "RemoveSavedNotificationSound" $ \o -> do
    notification_sound_id <- mconcat [ o A..:? "notification_sound_id", readMaybe <$> (o A..: "notification_sound_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveSavedNotificationSound { notification_sound_id = notification_sound_id }
 parseJSON _ = mempty
