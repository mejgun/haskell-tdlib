-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveNotification = 
 RemoveNotification { notification_id :: Int, notification_group_id :: Int }  -- deriving (Show)

instance T.ToJSON RemoveNotification where
 toJSON (RemoveNotification { notification_id = notification_id, notification_group_id = notification_group_id }) =
  A.object [ "@type" A..= T.String "removeNotification", "notification_id" A..= notification_id, "notification_group_id" A..= notification_group_id ]
-- removeNotification RemoveNotification  { notification_id :: Int, notification_group_id :: Int } 

