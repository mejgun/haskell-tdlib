-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ProcessPushNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ProcessPushNotification = 
 ProcessPushNotification { payload :: String }  -- deriving (Show)

instance T.ToJSON ProcessPushNotification where
 toJSON (ProcessPushNotification { payload = payload }) =
  A.object [ "@type" A..= T.String "processPushNotification", "payload" A..= payload ]
-- processPushNotification ProcessPushNotification  { payload :: String } 



instance T.FromJSON ProcessPushNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "processPushNotification" -> parseProcessPushNotification v
  where
   parseProcessPushNotification :: A.Value -> T.Parser ProcessPushNotification
   parseProcessPushNotification = A.withObject "ProcessPushNotification" $ \o -> do
    payload <- o A..: "payload"
    return $ ProcessPushNotification { payload = payload }