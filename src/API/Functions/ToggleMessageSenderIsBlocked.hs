-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleMessageSenderIsBlocked where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Changes the block state of a message sender. Currently, only users and supergroup chats can be blocked 
-- 
-- __sender__ Message Sender
-- 
-- __is_blocked__ New value of is_blocked
data ToggleMessageSenderIsBlocked = 

 ToggleMessageSenderIsBlocked { is_blocked :: Maybe Bool, sender :: Maybe MessageSender.MessageSender }  deriving (Show, Eq)

instance T.ToJSON ToggleMessageSenderIsBlocked where
 toJSON (ToggleMessageSenderIsBlocked { is_blocked = is_blocked, sender = sender }) =
  A.object [ "@type" A..= T.String "toggleMessageSenderIsBlocked", "is_blocked" A..= is_blocked, "sender" A..= sender ]

instance T.FromJSON ToggleMessageSenderIsBlocked where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleMessageSenderIsBlocked" -> parseToggleMessageSenderIsBlocked v
   _ -> mempty
  where
   parseToggleMessageSenderIsBlocked :: A.Value -> T.Parser ToggleMessageSenderIsBlocked
   parseToggleMessageSenderIsBlocked = A.withObject "ToggleMessageSenderIsBlocked" $ \o -> do
    is_blocked <- o A..:? "is_blocked"
    sender <- o A..:? "sender"
    return $ ToggleMessageSenderIsBlocked { is_blocked = is_blocked, sender = sender }