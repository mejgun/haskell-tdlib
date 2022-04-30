-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleMessageSenderIsBlocked where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Changes the block state of a message sender. Currently, only users and supergroup chats can be blocked 
-- 
-- __sender_id__ Identifier of a message sender to block/unblock
-- 
-- __is_blocked__ New value of is_blocked
data ToggleMessageSenderIsBlocked = 

 ToggleMessageSenderIsBlocked { is_blocked :: Maybe Bool, sender_id :: Maybe MessageSender.MessageSender }  deriving (Eq)

instance Show ToggleMessageSenderIsBlocked where
 show ToggleMessageSenderIsBlocked { is_blocked=is_blocked, sender_id=sender_id } =
  "ToggleMessageSenderIsBlocked" ++ U.cc [U.p "is_blocked" is_blocked, U.p "sender_id" sender_id ]

instance T.ToJSON ToggleMessageSenderIsBlocked where
 toJSON ToggleMessageSenderIsBlocked { is_blocked = is_blocked, sender_id = sender_id } =
  A.object [ "@type" A..= T.String "toggleMessageSenderIsBlocked", "is_blocked" A..= is_blocked, "sender_id" A..= sender_id ]

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
    sender_id <- o A..:? "sender_id"
    return $ ToggleMessageSenderIsBlocked { is_blocked = is_blocked, sender_id = sender_id }
 parseJSON _ = mempty
