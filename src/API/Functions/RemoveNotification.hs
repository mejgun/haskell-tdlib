-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveNotification where

import Control.Applicative (optional)
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
    notification_id <- optional $ o A..: "notification_id"
    notification_group_id <- optional $ o A..: "notification_group_id"
    return $ RemoveNotification { notification_id = notification_id, notification_group_id = notification_group_id }