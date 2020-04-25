-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ProcessPushNotification where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ProcessPushNotification = 
 ProcessPushNotification { payload :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON ProcessPushNotification where
 toJSON (ProcessPushNotification { payload = payload }) =
  A.object [ "@type" A..= T.String "processPushNotification", "payload" A..= payload ]

instance T.FromJSON ProcessPushNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "processPushNotification" -> parseProcessPushNotification v
   _ -> mempty
  where
   parseProcessPushNotification :: A.Value -> T.Parser ProcessPushNotification
   parseProcessPushNotification = A.withObject "ProcessPushNotification" $ \o -> do
    payload <- o A..:? "payload"
    return $ ProcessPushNotification { payload = payload }