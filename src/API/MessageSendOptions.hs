-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSendOptions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSchedulingState as MessageSchedulingState

-- |
-- 
-- Options to be used when a message is sent
-- 
-- __disable_notification__ Pass true to disable notification for the message
-- 
-- __from_background__ Pass true if the message is sent from the background
-- 
-- __protect_content__ Pass true if the content of the message must be protected from forwarding and saving; for bots only
-- 
-- __scheduling_state__ Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
data MessageSendOptions = 

 MessageSendOptions { scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState, protect_content :: Maybe Bool, from_background :: Maybe Bool, disable_notification :: Maybe Bool }  deriving (Eq)

instance Show MessageSendOptions where
 show MessageSendOptions { scheduling_state=scheduling_state, protect_content=protect_content, from_background=from_background, disable_notification=disable_notification } =
  "MessageSendOptions" ++ cc [p "scheduling_state" scheduling_state, p "protect_content" protect_content, p "from_background" from_background, p "disable_notification" disable_notification ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MessageSendOptions where
 toJSON MessageSendOptions { scheduling_state = scheduling_state, protect_content = protect_content, from_background = from_background, disable_notification = disable_notification } =
  A.object [ "@type" A..= T.String "messageSendOptions", "scheduling_state" A..= scheduling_state, "protect_content" A..= protect_content, "from_background" A..= from_background, "disable_notification" A..= disable_notification ]

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
    protect_content <- o A..:? "protect_content"
    from_background <- o A..:? "from_background"
    disable_notification <- o A..:? "disable_notification"
    return $ MessageSendOptions { scheduling_state = scheduling_state, protect_content = protect_content, from_background = from_background, disable_notification = disable_notification }
 parseJSON _ = mempty
