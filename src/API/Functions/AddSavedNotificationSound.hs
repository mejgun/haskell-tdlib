-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddSavedNotificationSound where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Adds a new notification sound to the list of saved notification sounds. The new notification sound is added to the top of the list. If it is already in the list, its position isn't changed 
-- 
-- __sound__ Notification sound file to add
data AddSavedNotificationSound = 

 AddSavedNotificationSound { sound :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show AddSavedNotificationSound where
 show AddSavedNotificationSound { sound=sound } =
  "AddSavedNotificationSound" ++ U.cc [U.p "sound" sound ]

instance T.ToJSON AddSavedNotificationSound where
 toJSON AddSavedNotificationSound { sound = sound } =
  A.object [ "@type" A..= T.String "addSavedNotificationSound", "sound" A..= sound ]

instance T.FromJSON AddSavedNotificationSound where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addSavedNotificationSound" -> parseAddSavedNotificationSound v
   _ -> mempty
  where
   parseAddSavedNotificationSound :: A.Value -> T.Parser AddSavedNotificationSound
   parseAddSavedNotificationSound = A.withObject "AddSavedNotificationSound" $ \o -> do
    sound <- o A..:? "sound"
    return $ AddSavedNotificationSound { sound = sound }
 parseJSON _ = mempty
