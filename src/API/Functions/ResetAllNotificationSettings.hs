-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetAllNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Resets all notification settings to their default values. By default, all chats are unmuted and message previews are shown
data ResetAllNotificationSettings = 

 ResetAllNotificationSettings deriving (Eq)

instance Show ResetAllNotificationSettings where
 show ResetAllNotificationSettings {  } =
  "ResetAllNotificationSettings" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ResetAllNotificationSettings where
 toJSON ResetAllNotificationSettings {  } =
  A.object [ "@type" A..= T.String "resetAllNotificationSettings" ]

instance T.FromJSON ResetAllNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resetAllNotificationSettings" -> parseResetAllNotificationSettings v
   _ -> mempty
  where
   parseResetAllNotificationSettings :: A.Value -> T.Parser ResetAllNotificationSettings
   parseResetAllNotificationSettings = A.withObject "ResetAllNotificationSettings" $ \o -> do
    return $ ResetAllNotificationSettings {  }
 parseJSON _ = mempty
