-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatSlowModeDelay where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members rights 
-- 
-- __chat_id__ Chat identifier
-- 
-- __slow_mode_delay__ New slow mode delay for the chat, in seconds; must be one of 0, 10, 30, 60, 300, 900, 3600
data SetChatSlowModeDelay = 

 SetChatSlowModeDelay { slow_mode_delay :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatSlowModeDelay where
 show SetChatSlowModeDelay { slow_mode_delay=slow_mode_delay, chat_id=chat_id } =
  "SetChatSlowModeDelay" ++ U.cc [U.p "slow_mode_delay" slow_mode_delay, U.p "chat_id" chat_id ]

instance T.ToJSON SetChatSlowModeDelay where
 toJSON SetChatSlowModeDelay { slow_mode_delay = slow_mode_delay, chat_id = chat_id } =
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
    slow_mode_delay <- mconcat [ o A..:? "slow_mode_delay", readMaybe <$> (o A..: "slow_mode_delay" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatSlowModeDelay { slow_mode_delay = slow_mode_delay, chat_id = chat_id }
 parseJSON _ = mempty
