-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBotUpdatesStatus where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only 
-- 
-- __pending_update_count__ The number of pending updates
-- 
-- __error_message__ The last error message
data SetBotUpdatesStatus = 
 SetBotUpdatesStatus { error_message :: Maybe String, pending_update_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetBotUpdatesStatus where
 toJSON (SetBotUpdatesStatus { error_message = error_message, pending_update_count = pending_update_count }) =
  A.object [ "@type" A..= T.String "setBotUpdatesStatus", "error_message" A..= error_message, "pending_update_count" A..= pending_update_count ]

instance T.FromJSON SetBotUpdatesStatus where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setBotUpdatesStatus" -> parseSetBotUpdatesStatus v
   _ -> mempty
  where
   parseSetBotUpdatesStatus :: A.Value -> T.Parser SetBotUpdatesStatus
   parseSetBotUpdatesStatus = A.withObject "SetBotUpdatesStatus" $ \o -> do
    error_message <- o A..:? "error_message"
    pending_update_count <- mconcat [ o A..:? "pending_update_count", readMaybe <$> (o A..: "pending_update_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetBotUpdatesStatus { error_message = error_message, pending_update_count = pending_update_count }