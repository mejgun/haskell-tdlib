-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveNotification where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data RemoveNotification = 
 RemoveNotification { notification_id :: Maybe Int, notification_group_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON RemoveNotification where
 toJSON (RemoveNotification { notification_id = notification_id, notification_group_id = notification_group_id }) =
  A.object [ "@type" A..= T.String "removeNotification", "notification_id" A..= notification_id, "notification_group_id" A..= notification_group_id ]

instance T.FromJSON RemoveNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeNotification" -> parseRemoveNotification v
   _ -> mempty
  where
   parseRemoveNotification :: A.Value -> T.Parser RemoveNotification
   parseRemoveNotification = A.withObject "RemoveNotification" $ \o -> do
    notification_id <- mconcat [ o A..:? "notification_id", readMaybe <$> (o A..: "notification_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    notification_group_id <- mconcat [ o A..:? "notification_group_id", readMaybe <$> (o A..: "notification_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveNotification { notification_id = notification_id, notification_group_id = notification_group_id }