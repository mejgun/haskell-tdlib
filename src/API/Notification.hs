-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Notification where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NotificationType as NotificationType

data Notification = 
 Notification { _type :: Maybe NotificationType.NotificationType, is_silent :: Maybe Bool, date :: Maybe Int, _id :: Maybe Int }  deriving (Show)

instance T.ToJSON Notification where
 toJSON (Notification { _type = _type, is_silent = is_silent, date = date, _id = _id }) =
  A.object [ "@type" A..= T.String "notification", "type" A..= _type, "is_silent" A..= is_silent, "date" A..= date, "id" A..= _id ]

instance T.FromJSON Notification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notification" -> parseNotification v
   _ -> mempty
  where
   parseNotification :: A.Value -> T.Parser Notification
   parseNotification = A.withObject "Notification" $ \o -> do
    _type <- optional $ o A..: "type"
    is_silent <- optional $ o A..: "is_silent"
    date <- optional $ o A..: "date"
    _id <- optional $ o A..: "id"
    return $ Notification { _type = _type, is_silent = is_silent, date = date, _id = _id }