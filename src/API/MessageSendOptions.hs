-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSendOptions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageSchedulingState as MessageSchedulingState

-- |
-- 
-- Options to be used when a message is sent
-- 
-- __disable_notification__ Pass true to disable notification for the message
-- 
-- __from_background__ Pass true if the message is sent from the background
-- 
-- __scheduling_state__ Message scheduling state. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
data MessageSendOptions = 

 MessageSendOptions { scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState, from_background :: Maybe Bool, disable_notification :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON MessageSendOptions where
 toJSON (MessageSendOptions { scheduling_state = scheduling_state, from_background = from_background, disable_notification = disable_notification }) =
  A.object [ "@type" A..= T.String "messageSendOptions", "scheduling_state" A..= scheduling_state, "from_background" A..= from_background, "disable_notification" A..= disable_notification ]

instance T.FromJSON MessageSendOptions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageSendOptions" -> parseMessageSendOptions v
   _ -> mempty
  where
   parseMessageSendOptions :: A.Value -> T.Parser MessageSendOptions
   parseMessageSendOptions = A.withObject "MessageSendOptions" $ \o -> do
    scheduling_state <- o A..:? "scheduling_state"
    from_background <- o A..:? "from_background"
    disable_notification <- o A..:? "disable_notification"
    return $ MessageSendOptions { scheduling_state = scheduling_state, from_background = from_background, disable_notification = disable_notification }