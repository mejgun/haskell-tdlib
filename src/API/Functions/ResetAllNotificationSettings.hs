-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetAllNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResetAllNotificationSettings = 
 ResetAllNotificationSettings -- deriving (Show)

instance T.ToJSON ResetAllNotificationSettings where
 toJSON (ResetAllNotificationSettings {  }) =
  A.object [ "@type" A..= T.String "resetAllNotificationSettings" ]
-- resetAllNotificationSettings ResetAllNotificationSettings 

