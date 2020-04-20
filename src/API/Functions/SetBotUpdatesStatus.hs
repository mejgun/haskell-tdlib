-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBotUpdatesStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetBotUpdatesStatus = 
 SetBotUpdatesStatus { error_message :: String, pending_update_count :: Int }  -- deriving (Show)

instance T.ToJSON SetBotUpdatesStatus where
 toJSON (SetBotUpdatesStatus { error_message = error_message, pending_update_count = pending_update_count }) =
  A.object [ "@type" A..= T.String "setBotUpdatesStatus", "error_message" A..= error_message, "pending_update_count" A..= pending_update_count ]
-- setBotUpdatesStatus SetBotUpdatesStatus  { error_message :: String, pending_update_count :: Int } 

