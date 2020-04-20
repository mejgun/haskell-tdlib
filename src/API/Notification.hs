-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Notification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NotificationType as NotificationType

--main = putStrLn "ok"

data Notification = 
 Notification { _type :: NotificationType.NotificationType, is_silent :: Bool, date :: Int, _id :: Int }  -- deriving (Show)

instance T.ToJSON Notification where
 toJSON (Notification { _type = _type, is_silent = is_silent, date = date, _id = _id }) =
  A.object [ "@type" A..= T.String "notification", "type" A..= _type, "is_silent" A..= is_silent, "date" A..= date, "id" A..= _id ]
-- notification Notification  { _type :: NotificationType.NotificationType, is_silent :: Bool, date :: Int, _id :: Int } 

