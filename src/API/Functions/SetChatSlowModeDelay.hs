-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatSlowModeDelay where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetChatSlowModeDelay = 
 SetChatSlowModeDelay { slow_mode_delay :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON SetChatSlowModeDelay where
 toJSON (SetChatSlowModeDelay { slow_mode_delay = slow_mode_delay, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatSlowModeDelay", "slow_mode_delay" A..= slow_mode_delay, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatSlowModeDelay where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatSlowModeDelay" -> parseSetChatSlowModeDelay v
   _ -> mempty
  where
   parseSetChatSlowModeDelay :: A.Value -> T.Parser SetChatSlowModeDelay
   parseSetChatSlowModeDelay = A.withObject "SetChatSlowModeDelay" $ \o -> do
    slow_mode_delay <- optional $ o A..: "slow_mode_delay"
    chat_id <- optional $ o A..: "chat_id"
    return $ SetChatSlowModeDelay { slow_mode_delay = slow_mode_delay, chat_id = chat_id }