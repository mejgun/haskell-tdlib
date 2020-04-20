-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatSlowModeDelay where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetChatSlowModeDelay = 
 SetChatSlowModeDelay { slow_mode_delay :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatSlowModeDelay where
 toJSON (SetChatSlowModeDelay { slow_mode_delay = slow_mode_delay, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatSlowModeDelay", "slow_mode_delay" A..= slow_mode_delay, "chat_id" A..= chat_id ]
-- setChatSlowModeDelay SetChatSlowModeDelay  { slow_mode_delay :: Int, chat_id :: Int } 

