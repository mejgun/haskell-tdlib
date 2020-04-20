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



instance T.FromJSON SetChatSlowModeDelay where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatSlowModeDelay" -> parseSetChatSlowModeDelay v
  where
   parseSetChatSlowModeDelay :: A.Value -> T.Parser SetChatSlowModeDelay
   parseSetChatSlowModeDelay = A.withObject "SetChatSlowModeDelay" $ \o -> do
    slow_mode_delay <- o A..: "slow_mode_delay"
    chat_id <- o A..: "chat_id"
    return $ SetChatSlowModeDelay { slow_mode_delay = slow_mode_delay, chat_id = chat_id }