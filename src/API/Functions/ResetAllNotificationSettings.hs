-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetAllNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResetAllNotificationSettings = 
 ResetAllNotificationSettings deriving (Show)

instance T.ToJSON ResetAllNotificationSettings where
 toJSON (ResetAllNotificationSettings {  }) =
  A.object [ "@type" A..= T.String "resetAllNotificationSettings" ]



instance T.FromJSON ResetAllNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resetAllNotificationSettings" -> parseResetAllNotificationSettings v

   _ -> mempty ""
  where
   parseResetAllNotificationSettings :: A.Value -> T.Parser ResetAllNotificationSettings
   parseResetAllNotificationSettings = A.withObject "ResetAllNotificationSettings" $ \o -> do
    return $ ResetAllNotificationSettings {  }