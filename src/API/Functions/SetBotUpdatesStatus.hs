-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBotUpdatesStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetBotUpdatesStatus = 
 SetBotUpdatesStatus { error_message :: String, pending_update_count :: Int }  deriving (Show)

instance T.ToJSON SetBotUpdatesStatus where
 toJSON (SetBotUpdatesStatus { error_message = error_message, pending_update_count = pending_update_count }) =
  A.object [ "@type" A..= T.String "setBotUpdatesStatus", "error_message" A..= error_message, "pending_update_count" A..= pending_update_count ]



instance T.FromJSON SetBotUpdatesStatus where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setBotUpdatesStatus" -> parseSetBotUpdatesStatus v

   _ -> mempty ""
  where
   parseSetBotUpdatesStatus :: A.Value -> T.Parser SetBotUpdatesStatus
   parseSetBotUpdatesStatus = A.withObject "SetBotUpdatesStatus" $ \o -> do
    error_message <- o A..: "error_message"
    pending_update_count <- o A..: "pending_update_count"
    return $ SetBotUpdatesStatus { error_message = error_message, pending_update_count = pending_update_count }